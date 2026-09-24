-- Bai tap thuc hanh: Quan ly San pham Laptop
-- Tao Database
CREATE DATABASE QL_SANPHAM;
GO

USE QL_SANPHAM;
GO

-- 1. Tao bang Nha San Xuat
CREATE TABLE NhaSX (
    idNSX VARCHAR(10) PRIMARY KEY,
    TenNSX NVARCHAR(50) NOT NULL,
    ThuTu INT DEFAULT 1
);
GO

-- 2. Tao bang San Pham
CREATE TABLE SanPham (
    idSP VARCHAR(20) PRIMARY KEY,
    TenSP NVARCHAR(100) NOT NULL,
    GiaBan INT NOT NULL CHECK (GiaBan > 0),
    MoTa NVARCHAR(500),
    Hinh VARCHAR(50),
    idNSX VARCHAR(10) REFERENCES NhaSX(idNSX)
);
GO

-- 3. Chen du lieu mau
INSERT INTO NhaSX(idNSX, TenNSX, ThuTu) VALUES 
('HP', 'HP', 1), 
('DL', 'DELL', 2), 
('AP', 'APPLE', 3), 
('AS', 'ASUS', 4);
GO

INSERT INTO SanPham(idSP, TenSP, GiaBan, MoTa, Hinh, idNSX) VALUES 
('DELL10', 'DELL XPS 2023', 26000000, N'Laptop cao cap', 'dell.png', 'DL'),
('DELLIN', 'DELL Inspiron 15', 15000000, N'Laptop van phong', 'dellin.png', 'DL'),
('HPX2', 'HP Spectre X2', 28000000, N'Thiet ke sang trong', 'hp.png', 'HP'),
('HPENVY', 'HP Envy 13', 22000000, N'Mong nhe', 'hpenvy.png', 'HP'),
('APM1', 'MacBook Air M1', 19000000, N'Pin trau', 'macair.png', 'AP'),
('APM2', 'MacBook Pro M2', 35000000, N'Chuyen nghiep', 'macpro.png', 'AP'),
('ROG01', 'ASUS ROG Strix', 25000000, N'Laptop Gaming', 'rog.png', 'AS'),
('ZEN01', 'ASUS ZenBook', 21000000, N'Mong nhe thoi thuong', 'zenbook.png', 'AS');
GO

-- 4. Stored Procedure lay danh sach nha san xuat (kem so luong san pham)
CREATE PROC NhaSX_Sel
AS
BEGIN
    SELECT n.idNSX, n.TenNSX, COUNT(s.idSP) AS SoLuong
    FROM NhaSX n
    LEFT JOIN SanPham s ON n.idNSX = s.idNSX
    GROUP BY n.idNSX, n.TenNSX, n.ThuTu
    ORDER BY n.ThuTu;
END;
GO

-- 5. Stored Procedure lay san pham theo hang
CREATE PROC SanPham_Sel_idNSX
    @idNSX VARCHAR(10)
AS
BEGIN
    SELECT * FROM SanPham WHERE idNSX = @idNSX;
END;
GO
