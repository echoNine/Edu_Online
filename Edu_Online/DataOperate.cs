using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Edu_Online
{
    public class DataOperate
    {
        public static SqlConnection CreateCon()
        {
            string strCnn = ConfigurationManager.ConnectionStrings["EduString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCnn);
            return con;
        }

        public static bool ExecSQL(string sql)
        {
            SqlConnection con = CreateCon();         //创建数据库连接
            con.Open();         //打开数据库连接
            SqlCommand com = new SqlCommand(sql, con);       //创建SQLCommand对象
            try
            {
                com.ExecuteNonQuery();       //执行SQL语句
            }
            catch (Exception e)
            {
                return false;       //返回布尔值 False
            }
            finally
            {
                con.Close();      //关闭数据库连接
            }
            return true;           //返回布尔值 True
        }

        public static DataSet GetDataset(string sql, string table)
        {
            SqlConnection con = CreateCon();         //创建数据库连接
            con.Open();         //打开数据库连接
            DataSet ds = new DataSet();        //创建DataSet对象
            SqlDataAdapter sda = new SqlDataAdapter(sql, con);      //创建DataAdapter对象
            sda.Fill(ds, table);        //填充DataSet数据集        
            con.Close();      //关闭数据库连接
            return ds;        //返回DataSet对象
        }

        public static SqlDataReader GetRow(string sql)
        {
            SqlConnection con = CreateCon();         //创建数据库连接
            con.Open();         //打开数据库连接
            SqlCommand com = new SqlCommand(sql, con);        //创建SqlCommand对象
            return com.ExecuteReader();        //返回执行ExecuteReader方法返回的DataReader对象
        }

        public static int SeleSQL(string sql)
        {
            SqlConnection con = CreateCon();         //创建数据库连接
            con.Open();         //打开数据库连接
            SqlCommand com = new SqlCommand(sql, con);        //创建SqlCommand对象
            try
            {
                return Convert.ToInt32(com.ExecuteScalar());             //返回执行ExecuteScalar方法返回的值
            }
            catch (Exception ex)
            {
                return 0;            //返回0
            }
            finally
            {
                con.Close();            //关闭数据库连接
            }
        }

        public static bool ExecTransaction(string[] sql)
        {
            SqlConnection con = CreateCon();        //创建数据库连接
            SqlTransaction sTransaction = null;        //创建SqlTransaction对象
            try
            {
                con.Open();            //打开数据库连接
                SqlCommand com = con.CreateCommand();            //创建SqlCommand对象
                sTransaction = con.BeginTransaction();            //设置开始事务
                com.Transaction = sTransaction;            //设置需要执行事务
                foreach (string sqlT in sql)
                {
                    com.CommandText = sqlT;                //设置SQL语句
                    if (com.ExecuteNonQuery() <= 0)                //判断是否执行成功
                    {
                        sTransaction.Rollback();                    //设置事务回滚
                        return false;                    //返回布尔值False
                    }
                }
                sTransaction.Commit();            //提交事务
                return true;            //返回布尔值True
            }
            catch (Exception ex)
            {
                sTransaction.Rollback();            //设置事务回滚
                return false;            //返回布尔值False
            }
            finally
            {
                con.Close();            //关闭数据库连接
            }
        }
    }
}