using StackExchange.Profiling;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

namespace DavesMusic.Controllers{
    public static class DBHelper{
        static string connectionString = ConfigurationManager.ConnectionStrings["DavesMusicConnection2"].ConnectionString;

        public static IDbConnection GetOpenConnection() {
            DbConnection cnn = new SqlConnection(connectionString);
            cnn.Open();

            // wrap the connection with a profiling connection that tracks timings 
            return new StackExchange.Profiling.Data.ProfiledDbConnection(cnn, MiniProfiler.Current);
        }
    }
}