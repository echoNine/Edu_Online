FROM mono
WORKDIR /var/www/

COPY ./Edu_Online.sln ./

COPY ./Edu_Online/ ./Edu_Online/

RUN sed -i 's/deb.debian.org/mirrors.huaweicloud.com/g' /etc/apt/sources.list

EXPOSE 8000

RUN apt-get update && apt-get install -y mono-fastcgi-server4

RUN nuget restore && msbuild Edu_Online.sln

CMD ["fastcgi-mono-server4", "/applications=/:/var/www/Edu_Online/", "--socket=tcp:0.0.0.0:8000", "--printlog", "--name=mono"]
