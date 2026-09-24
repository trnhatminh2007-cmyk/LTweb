// ==========================================
// Bai tap thuc hanh: Website Ban Laptop
// Sinh vien thuc hien: Ho va ten sinh vien
// Lop / Ma sinh vien: MSSV
// ==========================================
using System;
using System.Data;
using System.Data.SqlClient;

public partial class Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Load du lieu khi vao trang lan dau
            LoadHang();
            LoadSanPham();
        }
    }

    // Ham load danh sach hang san xuat vao menu trai
    private void LoadHang()
    {
        DataTable dt = DataProvider.layDuLieu("NhaSX_Sel", CommandType.StoredProcedure);
        RepeaterNhaSX.DataSource = dt;
        RepeaterNhaSX.DataBind();
    }

    // Ham load san pham (theo hang duoc chon hoac tat ca)
    private void LoadSanPham()
    {
        string id = Request.QueryString["id"];
        DataTable dt;

        if (!string.IsNullOrEmpty(id))
        {
            SqlParameter[] p = {
                new SqlParameter("@idNSX", id)
            };
            dt = DataProvider.layDuLieu("SanPham_Sel_idNSX", CommandType.StoredProcedure, p);
        }
        else
        {
            dt = DataProvider.layDuLieu("SELECT * FROM SanPham");
        }

        RepeaterSanPham.DataSource = dt;
        RepeaterSanPham.DataBind();
    }
}
