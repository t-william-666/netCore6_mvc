using System.Data;
using System.Data.SqlClient;
namespace coreWeb_MVC.Models
{
    public class DBHelper
    {
       //连接数据库SQL
       public static string conStr = "";
       //public static SqlConnection connection = null;

        private static void openSqlData()
        {
            //if(connection== null)
            //{
            //    connection = new SqlConnection(conStr);

            //}
            //if (connection.State == CancellationState.Closed)
            //{
            //    connection.Open();
            //}


            ////if (conn == null)
            ////    conn = new SqlConnection(ConnString);
            ////if (conn.State == ConnectionState.Broken)
            ////{
            ////    conn.Close();
            ////    conn.Open();
            ////}
            ////if (conn.State == ConnectionState.Closed)
            ////{
            ////    conn.Open();
            ////}

        }

    }
}
