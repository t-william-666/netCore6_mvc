using System.Data;
using Microsoft.Data;
using Microsoft.Data.SqlClient;


namespace coreWeb_MVC.Models
{
    /// <summary>
    /// 使用【ADO.Net】连接数据库
    /// </summary>
    public class DBHelper
    {
        // 连接数据库SQL
        public static string conStr = "Server=.;Database=TestDB;Trusted_Connection=True;User ID=sa;Password=123456;";
        public static SqlConnection connection = null;
 
        // 打开数据库
        private static void openSqlData()
        {
            if (connection == null)
            {
                connection = new SqlConnection(conStr);
            }
            if (connection.State == ConnectionState.Closed)
            {
                connection.Open();
            }
        }

        // 断开数据库连接
        private static void closeSqlData()
        {
            if(connection != null)
            {
                connection?.Close();
            }
            if(connection.State == ConnectionState.Open)
            {
                connection.Close();
            }
        }

        // 对数据进行【查询】 直接获取数据 》 速度快
        public static SqlDataReader dataReader(string sql)
        {
            try
            {
                //打开数据库
                openSqlData();
                SqlCommand command = new SqlCommand(sql, connection);
                SqlDataReader reader= command.ExecuteReader();
                return reader;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                //关闭数据库连接
                closeSqlData();
            }
        }

        // 使用【bool类型】 对数据库 增、删、改
        public static bool getUpdate(string sql)
        {
            try
            {
                //打开数据库
                openSqlData();
                SqlCommand command= new SqlCommand(sql, connection);
                int result = command.ExecuteNonQuery();
                return result > 0;
            }
            catch (Exception)
            {
                
                throw;
            }
            finally
            {
                //关闭数据库连接
                closeSqlData();
            }
        }

        // 使用【int类型】 对数据库 增、删、改
        public static int getUpdate2(string sql)
        {
            try
            {
                //打开数据库
                SqlCommand command= new SqlCommand(sql, connection);
                int result=command.ExecuteNonQuery();
                return result;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                //关闭数据库连接
                closeSqlData();
            }
        }

        // 使用 【DATaTable】对数据进行 【查询】
        public static DataTable getDatatTable(string sql)
        {
            try
            {
                //打开数据库
                openSqlData();
                SqlDataAdapter adapter = new SqlDataAdapter(sql,connection);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                return dt;  
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                //关闭数据库连接
                closeSqlData();
            }
        }

        // 使用 断开时连接【DataSet】 对数据库进行 增、删、改
        public static DataSet getDataSet(string sql)
        {
            try
            {
                //打开数据库
                openSqlData();
                SqlDataAdapter adapter= new SqlDataAdapter(sql,connection);
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                return ds;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                //关闭数据库连接
                closeSqlData();
            }
           
        }
    }
}
