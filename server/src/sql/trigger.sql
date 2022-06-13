-- 1.2.2. TRIGGER

-- Check khoi luong cua don hang
DROP TRIGGER IF EXISTS GIAO_HANG_LE.Check_Khoiluong
GO
CREATE TRIGGER GIAO_HANG_LE.Check_Khoiluong
ON GIAO_HANG_LE.DON_HANG
FOR  INSERT, UPDATE
AS
BEGIN
    DECLARE @kl FLOAT;
    SELECT @kl = trong_luong
    from INSERTED;
    IF (@kl > 20.0)
	BEGIN
        RAISERROR ('Khoi luong don hang khong duoc vuot qua 20kg', 16, 1);
        ROLLBACK;
    END;
END;
GO

--INSERT INTO GIAO_HANG_LE.DON_HANG(ma_khach_hang, trong_luong, can_giao_di, dia_chi_di, dia_chi_den)  VALUES  (1, 21.2, 1, 'HCM', 'HCM');
--INSERT INTO GIAO_HANG_LE.DON_HANG(ma_khach_hang, trong_luong, can_giao_di, dia_chi_di, dia_chi_den)  VALUES  (1, 1.2, 1, 'HCM', 'HCM');
--UPDATE GIAO_HANG_LE.DON_HANG    SET trong_luong = 20.01   WHERE ma_khach_hang = 1;
--DELETE FROM GIAO_HANG_LE.DON_HANG;

-- Check tinh hop le cua email KH
DROP TRIGGER IF EXISTS GIAO_HANG_LE.Check_EmailKH
GO
CREATE TRIGGER GIAO_HANG_LE.Check_EmailKH
ON GIAO_HANG_LE.KHACH_HANG
FOR  INSERT, UPDATE
AS
BEGIN
    DECLARE @mail VARCHAR(64);
    SELECT @mail = email
    from INSERTED;
    IF (@mail NOT LIKE '%_@__%.__%')
	BEGIN
        RAISERROR ('Dia chi email khong hop le', 16, 1);
        ROLLBACK;
    END;
END;
GO

--INSERT INTO GIAO_HANG_LE.KHACH_HANG VALUES ('em.nguyen', 'Nguyen Van Em', 'Tra Vinh', 0877778667, 'em.nguyen@gmailcom');
--INSERT INTO GIAO_HANG_LE.KHACH_HANG VALUES ('em.nguyen', 'Nguyen Van Em', 'Tra Vinh', 0877778667, 'em.nguyen@gmail.com');
--UPDATE GIAO_HANG_LE.KHACH_HANG SET email = 'em.nguyen.company.com.vn' WHERE ten_dang_nhap = 'em.nguyen';

-- Check tinh hop le cua email nhan vien
DROP TRIGGER IF EXISTS GIAO_HANG_LE.Check_EmailNV
GO
CREATE TRIGGER GIAO_HANG_LE.Check_EmailNV
ON GIAO_HANG_LE.NHAN_VIEN
FOR  INSERT, UPDATE
AS
BEGIN
    DECLARE @mail VARCHAR(64);
    SELECT @mail = email
    from INSERTED;
    IF (@mail NOT LIKE '%_@company.com')
	BEGIN
        RAISERROR ('Dia chi email khong hop le', 16, 1);
        ROLLBACK;
    END;
END;
GO

--INSERT INTO GIAO_HANG_LE.NHAN_VIEN VALUES ('sinh.nguyen', 'Nguyen Sinh', 'Vung Tau', 0787878899, 'sinh.nguyen@gmail.com');
--INSERT INTO GIAO_HANG_LE.NHAN_VIEN VALUES ('sinh.nguyen', 'Nguyen Sinh', 'Vung Tau', 0787878899, 'sinh.nguyen@company.com');
--UPDATE GIAO_HANG_LE.NHAN_VIEN SET email = 'sinh.nguyen@gmail.com' WHERE ten_dang_nhap = 'sinh.nguyen';

-- Check so luong nhann vien trong mot phong
CREATE OR ALTER TRIGGER GIAO_HANG_LE.Check_SoluongNV
ON GIAO_HANG_LE.KIEM_KHO
FOR  INSERT, UPDATE
AS
BEGIN
    DECLARE @sum1 INT;

    SELECT @sum1 = COUNT(GIAO_HANG_LE.KIEM_KHO.ma_nhan_vien)
    FROM INSERTED, GIAO_HANG_LE.KIEM_KHO
    WHERE INSERTED.ma_so_kho = GIAO_HANG_LE.KIEM_KHO.ma_so_kho AND INSERTED.phong = GIAO_HANG_LE.KIEM_KHO.phong
    GROUP BY GIAO_HANG_LE.KIEM_KHO.phong;

    IF (@sum1 > 10)
	BEGIN
        RAISERROR ('So nhan vien trong mot phong khong the lon hon 10', 16, 1);
        ROLLBACK;
    END;
END;
GO

--DELETE FROM GIAO_HANG_LE.KIEM_KHO;
--INSERT INTO GIAO_HANG_LE.KIEM_KHO VALUES (0, 24, 1), (1, 24, 1);
--INSERT INTO GIAO_HANG_LE.KIEM_KHO VALUES (2, 24, 1);
--INSERT INTO GIAO_HANG_LE.KIEM_KHO VALUES (3, 24, 1), (4, 24, 1);
--INSERT INTO GIAO_HANG_LE.KIEM_KHO VALUES (5, 24, 1);
--INSERT INTO GIAO_HANG_LE.KIEM_KHO VALUES (6, 24, 1);
--INSERT INTO GIAO_HANG_LE.KIEM_KHO VALUES (7, 24, 1);
--INSERT INTO GIAO_HANG_LE.KIEM_KHO VALUES (8, 24, 1);
--INSERT INTO GIAO_HANG_LE.KIEM_KHO VALUES (9, 24, 1);
--INSERT INTO GIAO_HANG_LE.KIEM_KHO VALUES (10, 24, 1);
--INSERT INTO GIAO_HANG_LE.KIEM_KHO VALUES (11, 24, 1);
--INSERT INTO GIAO_HANG_LE.KIEM_KHO VALUES (12, 24, 2);
--INSERT INTO GIAO_HANG_LE.KIEM_KHO VALUES (13, 24, 2);
--INSERT INTO GIAO_HANG_LE.KIEM_KHO VALUES (14, 24, 2);
--INSERT INTO GIAO_HANG_LE.KIEM_KHO VALUES (15, 24, 2);
--UPDATE GIAO_HANG_LE.KIEM_KHO SET phong = 1 WHERE ma_nhan_vien = 15;

-- Restore data
--DELETE FROM GIAO_HANG_LE.KIEM_KHO;
--INSERT INTO GIAO_HANG_LE.KIEM_KHO VALUES (0, 24, 1), (1, 24, 1);
--INSERT INTO GIAO_HANG_LE.KIEM_KHO VALUES (2, 26, 1);
--INSERT INTO GIAO_HANG_LE.KIEM_KHO VALUES (3, 33, 1), (4, 33, 1);
--INSERT INTO GIAO_HANG_LE.KIEM_KHO VALUES (5, 2, 1);
--INSERT INTO GIAO_HANG_LE.KIEM_KHO VALUES (6, 1, 1);
--INSERT INTO GIAO_HANG_LE.KIEM_KHO VALUES (7, 3, 1);
--INSERT INTO GIAO_HANG_LE.KIEM_KHO VALUES (8, 4, 1);
--INSERT INTO GIAO_HANG_LE.KIEM_KHO VALUES (9, 25, 1);
--INSERT INTO GIAO_HANG_LE.KIEM_KHO VALUES (10, 18, 1);
--INSERT INTO GIAO_HANG_LE.KIEM_KHO VALUES (11, 16, 1);
--INSERT INTO GIAO_HANG_LE.KIEM_KHO VALUES (12, 29, 1);
--INSERT INTO GIAO_HANG_LE.KIEM_KHO VALUES (13, 39, 1), (14, 39, 1), (15, 39, 1);

-- Check so lan tai xe giao cho nguoi nhan
CREATE OR ALTER TRIGGER GIAO_HANG_LE.Check_Solannhan
ON GIAO_HANG_LE.GIAO_DEN
FOR INSERT
AS
BEGIN
    DECLARE @sum2 INT;

    SELECT @sum2 = COUNT(*)
    FROM INSERTED, GIAO_HANG_LE.GIAO_DEN
    WHERE INSERTED.ma_don_hang = GIAO_HANG_LE.GIAO_DEN.ma_don_hang
    GROUP BY GIAO_HANG_LE.GIAO_DEN.ma_don_hang;

    IF (@sum2 > 5)
	BEGIN
        RAISERROR ('Khong the luu kho qua 5 lan', 16, 1);
        ROLLBACK;
    END;
END;
GO

--DELETE FROM GIAO_HANG_LE.GIAO_DEN;
--INSERT INTO GIAO_HANG_LE.GIAO_DEN(ma_don_hang, ma_tai_xe, thanh_cong, ly_do) VALUES (0, 17, 0, 'khong lien lac duoc');
--WAITFOR DELAY '00:00:00.01';
--INSERT INTO GIAO_HANG_LE.GIAO_DEN(ma_don_hang, ma_tai_xe, thanh_cong, ly_do) VALUES (0, 17, 0, 'khong lien lac duoc');
--WAITFOR DELAY '00:00:00.01';
--INSERT INTO GIAO_HANG_LE.GIAO_DEN(ma_don_hang, ma_tai_xe, thanh_cong, ly_do) VALUES (0, 17, 0, 'khong lien lac duoc');
--WAITFOR DELAY '00:00:00.01';
--INSERT INTO GIAO_HANG_LE.GIAO_DEN(ma_don_hang, ma_tai_xe, thanh_cong, ly_do) VALUES (0, 17, 0, 'khong lien lac duoc');
--WAITFOR DELAY '00:00:00.01';
--INSERT INTO GIAO_HANG_LE.GIAO_DEN(ma_don_hang, ma_tai_xe, thanh_cong, ly_do) VALUES (0, 17, 0, 'khong lien lac duoc');
--WAITFOR DELAY '00:00:00.01';
--INSERT INTO GIAO_HANG_LE.GIAO_DEN(ma_don_hang, ma_tai_xe, thanh_cong, ly_do) VALUES (0, 17, 0, 'khong lien lac duoc');
--WAITFOR DELAY '00:00:00.01';

---- Restore data
--DELETE FROM GIAO_HANG_LE.GIAO_DEN;
--INSERT INTO GIAO_HANG_LE.GIAO_DEN(ma_don_hang, ma_tai_xe, thanh_cong, ly_do) VALUES (0, 17, 1, '');
--WAITFOR DELAY '00:00:00.01';
--INSERT INTO GIAO_HANG_LE.GIAO_DEN(ma_don_hang, ma_tai_xe, thanh_cong, ly_do) VALUES (1, 18, 1, '');
--WAITFOR DELAY '00:00:00.01';
--INSERT INTO GIAO_HANG_LE.GIAO_DEN(ma_don_hang, ma_tai_xe, thanh_cong, ly_do) VALUES (2, 19, 1, '');
--WAITFOR DELAY '00:00:00.01';
--INSERT INTO GIAO_HANG_LE.GIAO_DEN(ma_don_hang, ma_tai_xe, thanh_cong, ly_do) VALUES (3, 19, 1, '');
--WAITFOR DELAY '00:00:00.01';
--INSERT INTO GIAO_HANG_LE.GIAO_DEN(ma_don_hang, ma_tai_xe, thanh_cong, ly_do) VALUES (4, 17, 0, 'Khong lien lac duoc');
--WAITFOR DELAY '00:00:00.01';
--INSERT INTO GIAO_HANG_LE.GIAO_DEN(ma_don_hang, ma_tai_xe, thanh_cong, ly_do) VALUES (5, 19, 1, '');
--WAITFOR DELAY '00:00:00.01';
--INSERT INTO GIAO_HANG_LE.GIAO_DEN(ma_don_hang, ma_tai_xe, thanh_cong, ly_do) VALUES (4, 17, 0, 'Hen 10h ngay mai');
--WAITFOR DELAY '00:00:01.01';
--INSERT INTO GIAO_HANG_LE.GIAO_DEN(ma_don_hang, ma_tai_xe, thanh_cong, ly_do) VALUES (4, 19, 1, '');



--- Check so lan tai xe lay don tu nguoi gui
CREATE OR ALTER TRIGGER GIAO_HANG_LE.Check_Solangui
ON GIAO_HANG_LE.GIAO_DI
FOR INSERT
AS
BEGIN
    DECLARE @sum3 INT;

    SELECT @sum3 = COUNT(*)
    FROM INSERTED, GIAO_HANG_LE.GIAO_DI
    WHERE INSERTED.ma_don_hang = GIAO_HANG_LE.GIAO_DI.ma_don_hang
    GROUP BY GIAO_HANG_LE.GIAO_DI.ma_don_hang;

    IF (@sum3 > 5)
	BEGIN
        RAISERROR ('Khong the lay hang tu nguoi gui, bi tu choi qua 5 lan!', 16, 1);
        ROLLBACK;
    END;
END;

GO

--- Check ma tai xe khop voi thung hang
CREATE OR ALTER TRIGGER GIAO_HANG_LE.Check_Thungdenkho
ON GIAO_HANG_LE.DEN_KHO
FOR INSERT, UPDATE
AS
BEGIN
    DECLARE @matx1 INT, @matx2 INT;

    SELECT @matx1 = INSERTED.ma_tai_xe, @matx2 = GIAO_HANG_LE.ROI_KHO.ma_tai_xe
    FROM INSERTED, GIAO_HANG_LE.ROI_KHO
    WHERE GIAO_HANG_LE.ROI_KHO.ma_thung = INSERTED.ma_thung;

    IF (@matx1 <> @matx2)
	BEGIN
        RAISERROR ('Tai xe nhan thung hang phai khop khi giao thung hang', 16, 1);
        ROLLBACK;
    END;
END;

GO

--- Check ma tai xe khop voi don hang
CREATE OR ALTER TRIGGER GIAO_HANG_LE.Check_Dondenkho
ON GIAO_HANG_LE.GIAO_DEN_KHO
FOR INSERT, UPDATE
AS
BEGIN
    DECLARE @matx1 INT, @matx2 INT;

    SELECT @matx1 = INSERTED.ma_tai_xe, @matx2 = GIAO_HANG_LE.GIAO_DI.ma_tai_xe
    FROM INSERTED, GIAO_HANG_LE.GIAO_DI
    WHERE GIAO_HANG_LE.GIAO_DI.ma_don_hang = INSERTED.ma_don_hang;

    IF (@matx1 <> @matx2)
	BEGIN
        RAISERROR ('Tai xe nhan don hang phai khop khi giao don hang den kho', 16, 1);
        ROLLBACK;
    END;
END;

GO


-- Hai trigger nay chay truoc de tinh tien va tinh cong diem, có the thay truc tiep ket qua
--- Cong diem cho tk neu co don hang moi lon hon 10,000
CREATE OR ALTER TRIGGER GIAO_HANG_LE.Check_Diem
ON GIAO_HANG_LE.DON_HANG
FOR INSERT, UPDATE
AS
BEGIN
    DECLARE @gt INT, @diem INT, @diemht INT, @tdn VARCHAR(32);

    SELECT @gt = INSERTED.gia_tien, @tdn  = GIAO_HANG_LE.KHACH_HANG.ten_dang_nhap, @diemht = GIAO_HANG_LE.TAI_KHOAN.diem_thuong, @diem = INSERTED.gia_tien / 1000
    FROM INSERTED, GIAO_HANG_LE.TAI_KHOAN, GIAO_HANG_LE.KHACH_HANG
    WHERE INSERTED.ma_khach_hang = GIAO_HANG_LE.KHACH_HANG.ma_khach_hang AND GIAO_HANG_LE.KHACH_HANG.ten_dang_nhap = GIAO_HANG_LE.TAI_KHOAN.ten_dang_nhap;
    IF (@gt > 10000)
	BEGIN
        UPDATE GIAO_HANG_LE.TAI_KHOAN
	SET GIAO_HANG_LE.TAI_KHOAN.diem_thuong = @diem + @diemht
	WHERE GIAO_HANG_LE.TAI_KHOAN.ten_dang_nhap = @tdn;
    END;
END;

GO


-- Thuc hien chay function Tinh tien 1 chang truoc
--- Trigger tinh tien cho don hang, lien quan thuoc tinh dan xuat
DROP TRIGGER IF EXISTS GIAO_HANG_LE.Tinh_Tien;
GO
CREATE TRIGGER GIAO_HANG_LE.Tinh_Tien ON GIAO_HANG_LE.DI_QUA
FOR INSERT, UPDATE, DELETE
AS
    WITH
    tang_them
    AS
    (
        SELECT ma_don_hang,
            SUM(phi_duoi_1kg) as duoi_1kg,
            SUM(phi_duoi_10kg) as duoi_10kg,
            SUM(phi_tren_10kg) as tren_10kg
        FROM CHANG, inserted
        WHERE CHANG.ma_chang = inserted.ma_chang
        GROUP BY ma_don_hang
    ),
    giam_xuong
    AS
    (
        SELECT ma_don_hang,
            SUM(phi_duoi_1kg) as duoi_1kg,
            SUM(phi_duoi_10kg) as duoi_10kg,
            SUM(phi_tren_10kg) as tren_10kg
        FROM CHANG, deleted
        WHERE CHANG.ma_chang = deleted.ma_chang
        GROUP BY ma_don_hang
    ),
    tong_cong
    AS
    (
        SELECT t.ma_don_hang,
            ISNULL(t.duoi_1kg, 0) - ISNULL(g.duoi_1kg, 0) as duoi_1kg,
            ISNULL(t.duoi_10kg, 0) - ISNULL(g.duoi_10kg, 0) as duoi_10kg,
            ISNULL(t.tren_10kg, 0) - ISNULL(g.tren_10kg, 0) as tren_10kg
        FROM tang_them as t FULL OUTER JOIN giam_xuong as g
            ON t.ma_don_hang = g.ma_don_hang
    )
    UPDATE DON_HANG
    SET gia_tien = gia_tien
        + GIAO_HANG_LE.Tinh_Tien_Mot_Chang(trong_luong, duoi_1kg, duoi_10kg, tren_10kg)
    FROM DON_HANG, tong_cong
    WHERE DON_HANG.ma_don_hang = tong_cong.ma_don_hang
GO