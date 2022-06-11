-- 1.2.1. Procedure
CREATE PROCEDURE Them_Tai_Khoan @ten_tai_khoan VARCHAR(32), @mat_khau VARCHAR(32), @diemthuong INT
AS
BEGIN
    DECLARE @dp INT;

    SELECT @dp = COUNT(*)
    FROM GIAO_HANG_LE.TAI_KHOAN AS tk
    WHERE @ten_tai_khoan = tk.ten_dang_nhap;

    IF (@dp <> 0)
    BEGIN
		RAISERROR('Ten tai khoan da ton tai, vui long chon mot ten dang nhap khac!', 16, 1);
		RETURN;
    END;

    DECLARE @len INT;
    SELECT @len = LEN(@mat_khau);

    IF (@len < 6)
    BEGIN
		RAISERROR('Mat khau qua ngan, vui long chon mat khau dai hon!', 16, 1);
		RETURN;
    END;

    INSERT INTO GIAO_HANG_LE.TAI_KHOAN VALUES (@ten_tai_khoan, @mat_khau, @diemthuong);

END;

CREATE PROCEDURE Thay_Doi_Mat_Khau @ten_tai_khoan VARCHAR(32), @mat_khau VARCHAR(32), @mat_khau_moi VARCHAR(32)
AS
BEGIN
    DECLARE @mk VARCHAR(32);

    SELECT @mk = tk.mat_khau
    FROM GIAO_HANG_LE.TAI_KHOAN as tk
    WHERE @ten_tai_khoan = tk.ten_dang_nhap;

    IF (@mk IS NULL)
    BEGIN
		RAISERROR('Tai khoan khong ton tai!', 16, 1);
		RETURN;
    END;

    IF (@mk <> @mat_khau)
    BEGIN
		RAISERROR('Mat khau cu khong dung!', 16, 1);
		RETURN;
    END;

    IF (LEN(@mat_khau_moi) < 6)
    BEGIN
		RAISERROR('Mat khau qua ngan, vui long chon mat khau dai hon!', 16, 1);
		RETURN;
    END;

    UPDATE GIAO_HANG_LE.TAI_KHOAN
    SET mat_khau = @mat_khau_moi
    WHERE ten_dang_nhap = @ten_tai_khoan;

END;

CREATE PROCEDURE Xoa_Tai_Khoan @ten_tai_khoan VARCHAR(32), @mat_khau VARCHAR(32)
AS
BEGIN
    DECLARE @mk VARCHAR(32);

    SELECT @mk = tk.mat_khau
    FROM GIAO_HANG_LE.TAI_KHOAN as tk
    WHERE @ten_tai_khoan = tk.ten_dang_nhap;

    IF (@mk IS NULL)
    BEGIN
        RAISERROR('Tai khoan khong ton tai!', 16, 1);
		RETURN;
    END;

    IF (@mk <> @mat_khau)
    BEGIN
        RAISERROR('Mat khau khong dung!', 16, 1);
		RETURN;
    END;

    DELETE FROM GIAO_HANG_LE.TAI_KHOAN
    WHERE GIAO_HANG_LE.TAI_KHOAN.ten_dang_nhap = @ten_tai_khoan;
END;


EXEC Them_Tai_Khoan 'khanh.tran', 'k1', 200;
EXEC Them_Tai_Khoan 'khanh.tran1', 'k1', 200;
EXEC Them_Tai_Khoan 'khanh.tran1', 'khanh1', 200;
SELECT * FROM GIAO_HANG_LE.TAI_KHOAN;
EXEC Thay_Doi_Mat_Khau 'khanh.tran2', 'khanh1', 'khanh2';
EXEC Thay_Doi_Mat_Khau 'khanh.tran1', 'khanh1', 'k2';
EXEC Thay_Doi_Mat_Khau 'khanh.tran1', 'khanh1', 'khanh2';
EXEC Xoa_Tai_Khoan 'khanh.tran1', 'khanh1';
EXEC Xoa_Tai_Khoan 'khanh.tran2', 'khanh';
EXEC Xoa_Tai_Khoan 'khanh.tran1', 'khanh2';



-- 1.2.3. FUNCTION
CREATE FUNCTION GIAO_HANG_LE.Tong_Doanh_Thu(@thang INT, @nam INT)
RETURNS INT
AS
BEGIN
    DECLARE @income INT;
    SELECT @income = SUM(gia_tien)
    FROM GIAO_HANG_LE.DON_HANG
    WHERE @thang = MONTH(thoi_gian) AND @nam = YEAR(thoi_gian)
    RETURN @income;
END;