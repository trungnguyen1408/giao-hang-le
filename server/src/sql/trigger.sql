-- 1.2.2. TRIGGER 
-- Check khoi luong cua don hang
CREATE TRIGGER Check_Khoiluong
ON GIAO_HANG_LE.DON_HANG
FOR  INSERT, UPDATE 
AS
BEGIN
	DECLARE @kl FLOAT;
	SELECT @kl = trong_luong from INSERTED;
	IF (@kl > 10.0) 
	BEGIN
		RAISERROR ('Khoi luong don hang khong duoc vuot qua 10kg', 16, 1);
		ROLLBACK; 
	END;
END;

-- Check tinh hop le cua email KH
CREATE TRIGGER Check_EmailKH
ON GIAO_HANG_LE.KHACH_HANG
FOR  INSERT, UPDATE
AS
BEGIN
	DECLARE @mail VARCHAR(64);
	SELECT @mail = email from INSERTED;
	IF (@mail NOT LIKE '%_@__%.__%') 
	BEGIN
		RAISERROR ('Dia chi email khong hop le', 16, 1);
		ROLLBACK; 
	END;
END;

-- Check tinh hop le cua email nhan vien
CREATE TRIGGER Check_EmailNV
ON GIAO_HANG_LE.NHAN_VIEN
FOR  INSERT, UPDATE
AS
BEGIN
	DECLARE @mail VARCHAR(64);
	SELECT @mail = email from INSERTED;
	IF (@mail NOT LIKE '%_@company.com') 
	BEGIN
		RAISERROR ('Dia chi email khong hop le', 16, 1);
		ROLLBACK; 
	END;
END;

-- Check so luong nhann vien trong mot phong 
CREATE OR ALTER TRIGGER Check_SoluongNV
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

-- Check so lan tai xe giao cho nguoi nhan
CREATE OR ALTER TRIGGER Check_Solannhan
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

--- Check so lan tai xe lay don tu nguoi gui
CREATE OR ALTER TRIGGER Check_Solangui
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

--- Check ma tai xe khop voi don hang
CREATE OR ALTER TRIGGER Check_Thungdenkho
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

--- Check ma tai xe khop voi don hang
CREATE OR ALTER TRIGGER Check_Dondenkho
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

