FROM mono
WORKDIR /var/www/

RUN sed -i 's/deb.debian.org/mirrors.huaweicloud.com/g' /etc/apt/sources.list

EXPOSE 8000

RUN apt-get update && apt-get install -y mono-fastcgi-server4

COPY ./Edu_Online.sln ./

COPY ./Edu_Online/ ./Edu_Online/

RUN nuget restore

RUN printf "cp /var/www/Edu_Online/Web.Release.config /var/www/Edu_Online/Web.config  \n\
sed -i 's/EDU_CONNECTION_STRING/'"\$EDU_CONNECTION_STRING"'/g' /var/www/Edu_Online/Web.config \n\
sed -i 's/STR_SMTP_SERVER_VALUE/'"\$STR_SMTP_SERVER_VALUE"'/g' /var/www/Edu_Online/Web.config \n\
sed -i 's/STR_SMTP_FROM_VALUE/'"\$STR_SMTP_FROM_VALUE"'/g' /var/www/Edu_Online/Web.config \n\
sed -i 's/STR_SMTP_PASSWORD_VALUE/'"\$STR_SMTP_PASSWORD_VALUE"'/g' /var/www/Edu_Online/Web.config \n\
msbuild Edu_Online.sln -p:Configuration=Release \n\
fastcgi-mono-server4 /applications=/:/var/www/Edu_Online/ --socket=tcp:0.0.0.0:8000 --printlog --name=mono\n" > ./entrypoint.sh

CMD ["sh", "./entrypoint.sh"]