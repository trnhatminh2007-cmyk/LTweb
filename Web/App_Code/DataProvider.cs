// ==========================================
// Class ho tro ket noi va thao tac SQL Server
// ==========================================
using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public class DataProvider
{
    // Chuoi ket noi CSDL lay tu Web.config
    private static string strKetNoi = ConfigurationManager.ConnectionStrings["QL_LaptopConnectionString"].ConnectionString;

    // Ham lay du lieu (SELECT) do vao DataTable
    public static DataTable layDuLieu(string sql, CommandType cmdType = CommandType.Text, SqlParameter[] p = null)
    {
        DataTable dt = new DataTable();
        using (SqlConnection con = new SqlConnection(strKetNoi))
        {
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                cmd.CommandType = cmdType;
                if (p != null)
                {
                    cmd.Parameters.AddRange(p);
                }
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                }
            }
        }
        return dt;
    }

    // Ham thuc thi cau lenh (INSERT, UPDATE, DELETE)
    public static int thucThi(string sql, CommandType cmdType = CommandType.Text, SqlParameter[] p = null)
    {
        int kq = 0;
        using (SqlConnection con = new SqlConnection(strKetNoi))
        {
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                cmd.CommandType = cmdType;
                if (p != null)
                {
                    cmd.Parameters.AddRange(p);
                }
                con.Open();
                kq = cmd.ExecuteNonQuery();
            }
        }
        return kq;
    }
}
