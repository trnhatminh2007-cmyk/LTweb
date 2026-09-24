<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" ResponseEncoding="utf-8" ContentType="text/html; charset=utf-8" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Cửa hàng Laptop Việt</title>
    <!-- Thu vien Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="StyleSheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- Khung chinh can giua trang -->
        <div class="khung p-0">
            <!-- Tieu de trang -->
            <div class="tieu-de text-center py-3 fw-bold">
                <a href="Default.aspx" class="text-decoration-none text-dark d-block">
                    CỬA HÀNG LAPTOP VIỆT
                </a>
            </div>
            
            <!-- Than trang chia 2 cot -->
            <div class="row g-0 than-trang">
                <!-- Cot trai: Menu cac hang san xuat -->
                <div class="col-12 col-md-4 col-lg-3 cot-trai p-3">
                    <h3>Hãng sản xuất:</h3>
                    <ul class="list-unstyled menu-hang mb-0">
                        <asp:Repeater ID="RepeaterNhaSX" runat="server">
                            <ItemTemplate>
                                <li class="mb-2">
                                    <a href='<%# "Default.aspx?id=" + Eval("idNSX") %>' class="d-block text-decoration-none text-dark fw-bold">
                                        - <%# Eval("TenNSX") %> (<%# Eval("SoLuong") %>)
                                    </a>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>

                <!-- Cot phai: Danh sach san pham -->
                <div class="col-12 col-md-8 col-lg-9 cot-phai p-4">
                    <div class="row g-4 justify-content-center w-100">
                        <asp:Repeater ID="RepeaterSanPham" runat="server">
                            <ItemTemplate>
                                <div class="col-12 col-sm-6 d-flex justify-content-center">
                                    <div class="product-card">
                                        <div class="product-img-box">
                                            <img src='<%# "images/" + Eval("Hinh") %>' alt='<%# Eval("TenSP") %>' />
                                        </div>
                                        <ul class="ps-3 mb-0 thong-tin">
                                            <li class="mb-1">Mã sản phẩm: <%# Eval("idSP") %></li>
                                            <li class="mb-1 text-red fw-bold"><%# Eval("TenSP") %></li>
                                            <li>Giá bán: <span class="text-red"><%# Eval("GiaBan", "{0:N0}") %> <sup>vnd</sup></span></li>
                                        </ul>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
            
            <!-- Chan trang -->
            <div class="chan-trang p-3">
                Liên hệ: Họ và tên thí sinh<br />
                Số điện thoại:
            </div>
        </div>
    </form>
</body>
</html>