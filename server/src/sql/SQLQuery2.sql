CREATE TABLE GIAO_HANG_LE.TAI_KHOAN (
    ten_dang_nhap VARCHAR(32) PRIMARY KEY,
    mat_khau VARCHAR(32) NOT NULL,
    diem_thuong INT NOT NULL DEFAULT 0
);

--INSERT INTO GIAO_HANG_LE.TAI_KHOAN VALUES('admin', 'root', 0);
--INSERT INTO GIAO_HANG_LE.TAI_KHOAN VALUES('trung.nguyen', 'trung1234', 200);
--INSERT INTO GIAO_HANG_LE.TAI_KHOAN VALUES('khang.nguyen', 'khang1234', 200);
--INSERT INTO GIAO_HANG_LE.TAI_KHOAN VALUES('phat.nguyen', 'phat1234', 200);
--INSERT INTO GIAO_HANG_LE.TAI_KHOAN VALUES('dat.du', 'dat1234', 200);
--INSERT INTO GIAO_HANG_LE.TAI_KHOAN VALUES('dung.nguyen', 'dung1234', 100);
--INSERT INTO GIAO_HANG_LE.TAI_KHOAN VALUES('dat.le', 'dat1234', 100);
--INSERT INTO GIAO_HANG_LE.TAI_KHOAN VALUES('nam.tran', 'nam1234', 800);
--INSERT INTO GIAO_HANG_LE.TAI_KHOAN VALUES('khanh.tran', 'khanh1234', 200);
--INSERT INTO GIAO_HANG_LE.TAI_KHOAN VALUES('thao.dang', 'thao1234', 1200);
--INSERT INTO GIAO_HANG_LE.TAI_KHOAN VALUES('vy.nguyen', 'vy1234', 1500);

--SELECT * FROM GIAO_HANG_LE.TAI_KHOAN;

CREATE TABLE GIAO_HANG_LE.KHACH_HANG (
    ma_khach_hang INT PRIMARY KEY IDENTITY(0,1),
    ten_dang_nhap VARCHAR(32) NOT NULL UNIQUE,
    ten_khach_hang VARCHAR(32) NOT NULL,
    dia_chi VARCHAR(128) NOT NULL,
    so_dien_thoai CHAR(10) NOT NULL UNIQUE,
    email VARCHAR(64) NOT NULL UNIQUE,

    FOREIGN KEY (ten_dang_nhap) REFERENCES GIAO_HANG_LE.TAI_KHOAN(ten_dang_nhap) ON DELETE CASCADE ON UPDATE CASCADE
);


--INSERT INTO GIAO_HANG_LE.KHACH_HANG VALUES('admin', 'admin', 'admin', 0909900900, 'admin@company.com');
--INSERT INTO GIAO_HANG_LE.KHACH_HANG VALUES ('trung.nguyen', 'Nguyen Thanh Trung', '497 Hoa Hao, Phuong 07, Quan 10, Thanh pho Ho Chi Minh', 0772220220, 'trung.nguyen@gmail.com');
--INSERT INTO GIAO_HANG_LE.KHACH_HANG VALUES ('khang.nguyen', 'Nguyen Duy Khang', 'Ky tuc xa khu A, Phuong Linh Trung, Thanh pho Thu Duc, Thanh pho Ho Chi Minh', 0909009009, 'khang.nguyen@gmail.com');
--INSERT INTO GIAO_HANG_LE.KHACH_HANG VALUES ('phat.nguyen', 'Nguyen Tan Phat', 'Ky tuc xa khu A, Phuong Linh Trung, Thanh pho Thu Duc, Thanh pho Ho Chi Minh', 0989124245, 'phat.nguyen@gmail.com');
--INSERT INTO GIAO_HANG_LE.KHACH_HANG VALUES ('dat.du', 'Du Thanh Dat', 'Ky tuc xa khu B, Phuong Dong Hoa, Thanh pho Di An, Tinh Binh Duong', 0978145246, 'dat.du@gmail.com');
--INSERT INTO GIAO_HANG_LE.KHACH_HANG VALUES ('dung.nguyen', 'Nguyen Tien Dung', '473 Nguyen An Ninh, Phuong 9, Thanh pho Vung Tau, Tinh Ba Ria Vung Tau', 0988124278, 'dung.tiennguyen@gmail.com');
--INSERT INTO GIAO_HANG_LE.KHACH_HANG VALUES ('dat.le', 'Le Tien Dat', '639 Hoang Hoa Tham, Quan Ba Dinh, Ha Noi', 0722120876, 'datle.2k1@gmail.com');
--INSERT INTO GIAO_HANG_LE.KHACH_HANG VALUES ('nam.tran', 'Tran Thanh Nam', 'Toa D2, KDC Vinhome Central Park, Phuong Long Thanh My, Quan 9, Thanh pho Ho Chi Minh', 0919109109, 'nam.tran1203@hitech.vn');
--INSERT INTO GIAO_HANG_LE.KHACH_HANG VALUES ('khanh.tran', 'Tran Quoc Khanh', '180 Ngo Tat To, Phuong Loc Vuong, Thanh pho Nam Dinh, Tinh Nam Dinh', 0387201578, 'khanhtranquoc99@gmail.com');
--INSERT INTO GIAO_HANG_LE.KHACH_HANG VALUES ('thao.dang', 'Dang Thi Thu Thao', '42 Duong so 10, KDC Masteri Thao Dien, Quan 2, Thanh pho Ho Chi Minh', 0919100200, 'thao.dang98@gmail.com');
--INSERT INTO GIAO_HANG_LE.KHACH_HANG VALUES ('vy.nguyen', 'Nguyen Bui Thao Vy', '82 Tran Huy Lieu, Quan Phu Nhuan, Thanh pho Ho Chi Minh', 0887778778, 'vythao.nguyen@gmail.com');

--SELECT * FROM GIAO_HANG_LE.KHACH_HANG;

CREATE TABLE GIAO_HANG_LE.DON_HANG (
    ma_don_hang INT PRIMARY KEY IDENTITY(0,1),
	ma_khach_hang INT NOT NULL,
    trong_luong FLOAT NOT NULL,
    can_giao_di BIT NOT NULL,
    dia_chi_di VARCHAR(128) NOT NULL,
    dia_chi_den VARCHAR(128) NOT NULL,
	gia_tien INT NOT NULL DEFAULT 0

	FOREIGN KEY (ma_khach_hang) REFERENCES GIAO_HANG_LE.KHACH_HANG(ma_khach_hang) ON DELETE CASCADE ON UPDATE CASCADE

	CONSTRAINT check_giatien_donhang
		CHECK (gia_tien >= 0)
);

--INSERT INTO GIAO_HANG_LE.DON_HANG VALUES  (1, 1.2, 1, '497 Hoa Hao, Phuong 07, Quan 10, Thanh pho Ho Chi Minh', '03 Nguyen Gia Thieu, Phuong 12, Quan 3, Thanh pho Ho Chi Minh', 12000);
--INSERT INTO GIAO_HANG_LE.DON_HANG VALUES  (1, 3.8, 1, '497 Hoa Hao, Phuong 07, Quan 10, Thanh pho Ho Chi Minh', '39A Luy Ban Bich, Khu pho An Lac, Thi tran Phuoc Hai, Huyen Dat Do, Tinh Ba Ria Vung Tau', 22000);
--INSERT INTO GIAO_HANG_LE.DON_HANG VALUES  (6, 8.7, 0, '639 Hoang Hoa Tham, Quan Ba Dinh, Ha Noi', '347 Huynh Van Banh, Phuong 11, Quan Phu Nhuan, Thanh pho Ho Chi Minh', 52000);
--INSERT INTO GIAO_HANG_LE.DON_HANG VALUES  (3, 0.6, 1, 'Ky tuc xa khu A, Phuong Linh Trung, Thanh pho Thu Duc, Thanh pho Ho Chi Minh', 'FC42+6QP, Xa My Tinh An, Huyen Cho Gao, Tinh Tien Giang', 30000);
--INSERT INTO GIAO_HANG_LE.DON_HANG VALUES  (5, 5.3, 0, '473 Nguyen An Ninh, Phuong 9, Thanh pho Vung Tau, Tinh Ba Ria Vung Tau', '20 Huynh Tinh Cua, Quan 3, Thanh pho Ho Chi Minh', 22000);
--INSERT INTO GIAO_HANG_LE.DON_HANG VALUES  (8, 9.5, 1, '180 Ngo Tat To, Phuong Loc Vuong, Thanh pho Nam Dinh, Tinh Nam Dinh', '52B Nguyen Van Troi, Phuong 15, Quan Phu Nhuan, Thanh pho Ho Chi Minh', 72000);

--SELECT * FROM GIAO_HANG_LE.DON_HANG;

CREATE TABLE GIAO_HANG_LE.KHO_HANG (
    ma_kho_hang INT PRIMARY KEY IDENTITY(0,1),
    ten_kho_hang VARCHAR(32) NOT NULL UNIQUE,
    dia_chi VARCHAR(128) NOT NULL UNIQUE
);

--INSERT INTO GIAO_HANG_LE.KHO_HANG VALUES
--('Chau Phu','Xa Vinh Thanh Trung, Huyen Chau Phu, An Giang'),--('Cho Moi','56 Tran Hung Dao, Thi tran Cho Moi, Huyen Cho Moi, Tinh An Giang'),--('Chau Doc','Phuong Nui Sam, Thanh pho Chau Doc, An Giang'),--('Long Xuyen','164 Hung Vuong, phuong My Long, Thanh pho Long Xuyen, tinh An Giang'),--('Chau Duc','401 duong Hung Vuong, Thi Tran Ngai Giao, Huyen Chau Duc, tinh Ba Ria - Vung Tau'),--('Vung Tau','165-167A Nguyen An Ninh, Phuong Thang Nhi, Thanh Pho Vung Tau, Ba Ria - Vung Tau'),--('Phu My','52 Pham Huu Chi, phuong Phu My, thi xa Phu My, tinh Ba Ria - Vung Tau'),--('Ba Ria','499 Dien Bien Phu, phuong Long Toan, Ba Ria, Ba Ria - Vung Tau'),--('Bac Giang','368 duong Hoang Van Thu, Thanh pho Bac Giang, tinh Bac Giang'),--('Gia Rai','Khom 5, Thi tran Ho Phong, Thi Xa Gia Rai, Bac Lieu'),--('Bac Lieu','66 Cao Van Lau, Phuong Nha Mat, Thanh pho Bac Lieu, Bac Lieu'),--('Bac Ninh','10 Duong Luong The Vinh,Phuong Ninh Xa,TP Bac Ninh,Bac Ninh'),--('Chau Thanh - Ben Tre','Ap Phu Khuong, Xa Phu Tuc, Huyen Chau Thanh, Ben Tre'),--('Quy Nhon 02','233 Le Thanh Nghi, Phuong Dong Da, Thanh Pho Quy Nhon, Tinh Binh Dinh'),--('Quy Nhon 01','47 Vo Lieu, Ghenh Rang, Thanh pho Quy Nhon, Binh Dinh'),--('Di An','107 Duong so 2, KP Dong Thanh, Phuong Tan Dong Hiep, Thanh Pho Di An, Tinh Binh Duong'),--('Thuan An 02','9 Bis, KP Dong Tu, Lai Thieu, Thanh Pho Thuan An, Tinh Binh Duong'),--('Ben Cat','341/15 Khu DC Ap 5, Phuong Chanh Phu Hoa, Thi Xa Ben Cat, Tinh Binh Duong'),--('Thuan An 01','Duong D12 KCN Thuan Giao, Thi Xa Thuan An, Binh Duong'),--('La gi','480 Thong Nhat, Phuong Tan An, Thi xa La Gi, Binh Thuan'),--('Phan Thiet','18 Truong Han Sieu, phuong Phu Thuy, thanh pho Phan Thiet, tinh Binh Thuan'),--('Tuy Phong','99 Nguyen Thi Minh Khai, Khu pho 5, Lien Huong, huyen Tuy Phong, tinh Binh Thuan'),--('Ca Mau','156 Nguyen Dinh Chieu, Phuong 8, Thanh pho Ca Mau, Ca Mau'),--('Cai Rang','QL1A, Ba Lang, Cai Rang, Can Tho'),--('Binh Thuy','LK6, D1-27, Xuan Hong, Phuong Long Tuyen, Quan Binh Thuy, Can Tho'),--('Ninh Kieu','11/12  Khu nha vuon Con Khuong, Phuong Cai Khe, Quan Ninh Kieu, Can Tho'),--('Hai Chau 02','179-181 30/4, Hoa Cuong Bac, Quan Hai Chau, Da Nang'),--('Ngu Hanh Son','138 Le Van Hien, Phuong Khue My, Quan Ngu Hanh Son, Da Nang'),--('Thanh Khe','63 Nguyen Gian Thanh, Hoa Khe, Quan Thanh Khe, Da Nang'),--('Buon Ma Thuot 02','326 Nguyen Van Cu, Tan Lap, Thanh Pho Buon Ma Thuot, Tinh Dak Lak'),--('Buon Ma Thuot 01','30 10/3, Thanh Nhat, Thanh Pho Buon Ma Thuot, Dak Lak'),--('Bien Hoa 03','503 Bui Trong Nghia, Khu pho 3, Phuong Trang Dai, Bien Hoa, Dong Nai'),--('Thong Nhat','H1/005 Ap Nam Son, xa Quang Trung, Huyen Thong Nhat, Tinh Dong Nai'),--('Bien Hoa 01','2366 Nguyen Ai Quoc, Cau Hang, Xa Hoa An, thanh pho Bien Hoa, Dong Nai'),--('Trang Bom','24 Tran Phu, Xa Bac Son, Huyen Trang Bom, Dong Nai'),--('Xuan Loc','10A Nguyen Thi Minh Khai,Thi tran Gia Ray, Huyen Xuan Loc, Dong Nai'),--('Bien Hoa 02','697 khu pho 4, Huynh Van Nghe, phuong Buu Long, Bien Hoa, Dong Nai'),--('Long Thanh','10 Tran Thuong Xuyen, Thi tran Long Thanh, Huyen Long Thanh, Dong Nai'),--('Nhon Trach','Ap Ben Cam, xa Phuoc Thien, Huyen Nhon Trach , Dong Nai'),--('Lap Vo','3/2, Thi tran Lap Vo, Huyen Lap Vo, Tinh Dong Thap'),--('Lai Vung','Duong so 7, KDT Sen Vang, Lai Vung, Dong Thap'),--('Cao Lanh','421/1 Duong 30/4, Phuong 1, thanh pho cao lanh, Dong thap'),--('Sa Dec','10 Phan Dinh Phung, Khu Dan cu Tan Hoa, Phuong An Hoa, Thanh pho Sa Dec, Dong Thap'),--('Ha Giang','7 Nguyen Du, Phuong Nguyen Trai , Thanh Pho Ha Giang, Ha Giang'),--('Long Bien','To 4 Thon Thuong Dong, Phuong Phuc Loi, Quan Long Bien, Ha Noi'),--('Duy Tan','So 6 ngach 3, ngo 78 Duy Tan, Phuong Dich Vong Hau, Quan Cau Giay, Ha Noi'),--('My Dinh','236 Duong My Dinh, Phuong My Dinh 2, Quan Nam Tu Liem, Ha Noi'),--('Ba Vi','546 Duong Quang Oai, xa Chu Minh, huyen Ba Vi, Thanh Pho Ha Noi'),--('Me Linh','To 5 thi tran Chi Dong, huyen Me Linh, Ha Noi'),--('Soc Son','Thon Duoc Ha, Xa Tien Duoc, Huyen Soc Son, Ha Noi'),--('Thuong Tin','Ngo 1 Cau Dua, Thon Binh Vong, xa Van Binh, huyen Thuong Tin, Ha Noi'),--('Chuong My','Xom Ben, Xa Tot Dong, Huyen Chuong My, Ha Noi'),--('Hoai Duc','Ngo 28 duong Yen So, thon Trung Ky, xa Dac So, huyen Hoai Duc, Ha Noi'),--('Thanh Tri','Thon Vinh Trung, Xa Dai Ang, huyen Thanh Tri, Ha Noi'),--('Thanh Oai','So 1A , duong Binh Minh, Xom Cho, Xa Binh Minh, Huyen Thanh Oai, Ha Noi'),--('Gia Lam','Khu tai dinh cu Doc Hoi, Thi Tran Trau Quy, Huyen Gia Lam, Ha Noi'),--('Dong Anh','71 Tho Bao, Xa Van Noi, Huyen Dong Anh, Ha Noi'),--('Ha Tinh','481 Duong 26/3, Dai Nai, Thanh Pho Ha Tinh, Tinh Ha Tinh'),--('Ninh Giang','Quoc lo 37, xa Tan Huong, huyen Ninh Giang, tinh Hai Duong'),--('Kinh Mon','358/1 Tran Hung Dao, Phuong An Luu Thi Xa Kinh Mon, Hai Duong'),--('Tu Ky','343 duong 391, Thi tran Tu Ky, huyen Tu Ky, Hai Duong'),--('Chi Linh','23 Tran Hung Dao, phuong Sao Do, Thanh Pho Chi Linh, Hai Duong'),--('Hai Duong','247 Binh Loc, phuong Tan Binh, thanh pho Hai Duong, tinh Hai Duong'),--('Le Chan','To 2 Phuong Vinh Niem, Quan Le Chan, Thanh Pho Hai Phong'),--('Phung Hiep','Duong Hung Vuong, Thi tran Cay Duong, Phung Hiep, Hau Giang'),--('Vi Thanh','35 Nguyen Khuyen, Phuong 3, Thanh pho Vi Thanh, Tinh Hau Giang'),--('Nha Trang 03','127 Duong 23/10, Phuong Son, Nha Trang, Khanh Hoa'),--('Nha Trang 01','2 duong 29, Khu Dan Cu Phuoc Long A, Phuong Phuoc Long, Thanh Pho Nha Trang, Khanh Hoa'),--('Phu Quoc','Duong 30/4, Duong To, Phu Quoc, Kien Giang'),--('Rach Gia','23 Dong Da, Phuong Vinh Lac, Thanh pho Rach Gia, Tinh Kien Giang'),--('Kon Tum','316 Dao Duy Tu, Thang Loi, Thanh pho Kon Tum, Tinh Kon Tum'),--('Da Lat 02','45-47 Yersin, Phuong 9, Thanh Pho Da Lat, Tinh Lam Dong'),--('Bao Loc','130 Nguyen Khuyen, Phuong 2, Bao Loc, Lam Dong'),--('Da Lat 01','168A Xo Viet Nghe Tinh, P7. Thanh Pho Da Lat, Lam Dong'),--('Lao Cai','106 duong Yet Kieu, phuong Kim Tan, thanh pho Lao Cai, Tinh Lao Cai'),--('Ben Luc','282A khu pho 8, duong Phan Van Mang, thi tran Ben Luc, Huyen Ben Luc, tinh Long An'),--('Duc Hoa','47 Quoc lo N2 ap Thuan Hoa 2 xa Hoa Khanh Nam, Duc Hoa, Long An'),--('Can Giuoc','Quoc lo 50, Xa Truong Binh, Huyen Can Giuoc, Long An'),--('Dien Chau','Xom 1, Dien Thanh, Dien Chau, Nghe An'),--('Vinh 2','120 Phong Dinh Cang, Phuong Hung Dung, Thanh Pho Vinh, Nghe An'),--('Nghi Loc','Duong Thang Long, Thi Tran Quan Hanh, Nghi Loc, Nghe An'),--('Vinh 01','Lo A13-A14 Duong 72M, Nghi Phu, Thanh Pho Vinh. Nghe An'),--('Phan Rang','Lo 5 Nguyen Thi Minh Khai, Son Hai, Thanh Pho Phan Rang,Thap Cham, Ninh Thuan'),--('Viet Tri','Duong Lac Long Quan, Phuong Minh Nong, Thanh Pho Viet Tri, Tinh Phu Tho'),--('Tuy Hoa','47 Nguyen Trung Truc, Phuong 8, Tuy Hoa, Phu Yen'),--('Dong Hoi','Lo 5 Pham Van Dong, P. Nam Ly, Thanh Pho Dong Hoi, Quang Binh'),--('Dien Ban','107 Phan Thuc Duyen, Dien An, Dien Ban, Quang Nam'),--('Hoi An','55 Phan Dinh Phung, Cam Pho, Hoi An, Quang Nam, Hoi An, Quang Nam'),--('Tam Ky','Lo M17, KDC pho cho An Son, Phuong An Son, Thanh Pho Tam Ky, Quang Nam, Tam Ky, Quang Nam'),--('Quang Ngai','07 Le Thanh Ton, phuong Nghia Chanh, thanh pho Quang Ngai, tinh Quang Ngai'),--('Soc Trang','154 Pham Hung, Phuong 8, Thanh pho Soc Trang, Tinh Soc Trang'),--('Go Dau','204, to ban do so 11, ap Xom Moi, xa Thanh Phuoc, huyen Go Dau, tinh Tay Ninh'),--('Duong Minh Chau','So 6 DT 781, Khu Pho 3, Thi Tran Duong Minh Chau, Huyen Duong Minh Chau, Tinh Tay Ninh'),--('Tay Ninh','691 Dien Bien Phu, phuong Ninh Thanh, Thanh pho Tay Ninh, tinh Tay Ninh'),--('Thanh Hoa','182 MBQH so 89 XD UBTH, Phuong Dong Huong, TP. Thanh Hoa , Thanh Hoa'),--('Hue','C5 Tung Thien Vuong, phuong Vy Da, Thanh pho Hue, Tinh Thua Thien Hue'),--('My Tho','Doan Thi Nghiep, phuong 5, thanh pho My Tho, Tien Giang'),--('Chau Thanh - Tien Giang','Tinh lo 878, Tam Hiep, Chau Thanh, Tien Giang'),--('Nguyen Oanh','139 Nguyen Oanh, phuong 10, Quan Go Vap, Thanh Pho Ho Chi Minh'),--('Phan Huy Ich','85 Phan Huy Ich, Phuong 15, Quan Tan Binh, Thanh Pho Ho Chi Minh'),--('Luy Ban Bich','321 Luy Ban Bich, Phuong Hiep Tan, Quan Tan Phu, Thanh Pho Ho Chi Minh'),--('Can Gio','73 Dao Cu, Thi tran Can Thanh, Huyen Can Gio'),--('Binh Chanh 01','A1/9A duong Tran Van Giau, xa Le Minh Xuan, huyen Binh Chanh, Thanh Pho Ho Chi Minh'),--('Binh Chanh 02','1410 duong Vinh Loc, xa Vinh Loc B, huyen Binh Chanh, TP Ho Chi Minh'),--('Hoc Mon','10/4 Thoi Tam Thon 18, Ap Tam Dong, Thoi Tam Thon, Huyen Hoc Mon, TP Ho Chi Minh'),--('Son Duong','TDP Tan Bac, Thi tran Son Duong, Huyen Son Duong, Tinh Tuyen Quang'),--('Long Ho','Khu dan cu Phu Duc, xa Phu Duc, huyen Long Ho, tinh Vinh Long'),--('Vinh Long','328 Pho Co Dieu, phuong 3, thanh pho Vinh Long, tinh Vinh Long'),--('Vinh Tuong','Khu Trung tam thuong mai va nha o Phuc Son, xa Thuong Trung, huyen Vinh Tuong, Vinh Phuc'),--('Phuc Yen','65 Tran Phu, phuong Trung Nhi, Phuc Yen, Vinh Phuc');
--SELECT * FROM GIAO_HANG_LE.KHO_HANG;

CREATE TABLE GIAO_HANG_LE.CHANG (
    ma_chang INT PRIMARY KEY IDENTITY(0,1),
    kho_bat_dau INT NOT NULL,
    kho_ket_thuc INT NOT NULL,
    phi_duoi_1kg DECIMAL(10, 4) NOT NULL,
    phi_duoi_10kg DECIMAL(10, 4) NOT NULL,
    phi_tren_10kg DECIMAL(10, 4) NOT NULL,

    FOREIGN KEY (kho_bat_dau) REFERENCES GIAO_HANG_LE.KHO_HANG(ma_kho_hang),
    FOREIGN KEY (kho_ket_thuc) REFERENCES GIAO_HANG_LE.KHO_HANG(ma_kho_hang),

	CONSTRAINT check_giatien_chan1
		CHECK (phi_duoi_1kg >= 0 AND phi_duoi_10kg >= 0 AND phi_tren_10kg >= 0) 
);

CREATE TABLE GIAO_HANG_LE.DAT_HANG (
    ma_don_hang INT PRIMARY KEY,
    ma_khach_hang INT NOT NULL,
    thoi_gian DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (ma_don_hang) REFERENCES GIAO_HANG_LE.DON_HANG(ma_don_hang) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ma_khach_hang) REFERENCES GIAO_HANG_LE.KHACH_HANG(ma_khach_hang) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE GIAO_HANG_LE.DI_QUA (
    ma_don_hang INT NOT  NULL,
    ma_chang INT NOT NULL,
    thu_tu INT NOT NULL DEFAULT 0,

	PRIMARY KEY (ma_don_hang, ma_chang),

    FOREIGN KEY (ma_don_hang) REFERENCES GIAO_HANG_LE.DON_HANG(ma_don_hang) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ma_chang) REFERENCES GIAO_HANG_LE.CHANG(ma_chang) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE GIAO_HANG_LE.THUNG_HANG (
    ma_thung_hang INT PRIMARY KEY IDENTITY(0,1),
    ma_chang INT NOT NULL,

    FOREIGN KEY (ma_chang) REFERENCES GIAO_HANG_LE.CHANG(ma_chang) ON UPDATE CASCADE
);

CREATE TABLE GIAO_HANG_LE.NHAN_VIEN (
    ma_nhan_vien INT PRIMARY KEY IDENTITY(0,1),
    ten_dang_nhap VARCHAR(32) NOT NULL UNIQUE,
    ten_nhan_vien VARCHAR(32) NOT NULL,
    dia_chi VARCHAR(128) NOT NULL,
    so_dien_thoai DECIMAL(10, 0) NOT NULL UNIQUE,
    email VARCHAR(64) NOT NULL UNIQUE,

    FOREIGN KEY (ten_dang_nhap) REFERENCES GIAO_HANG_LE.TAI_KHOAN(ten_dang_nhap) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE GIAO_HANG_LE.KIEM_KHO (
    ma_nhan_vien INT PRIMARY KEY,
	ma_so_kho INT,
    phong INT NOT NULL,

    FOREIGN KEY (ma_nhan_vien) REFERENCES GIAO_HANG_LE.NHAN_VIEN(ma_nhan_vien) ON UPDATE CASCADE
	FOREIGN KEY (ma_so_kho) REFERENCES GIAO_HANG_LE.KHO_HANG(ma_kho_hang) ON UPDATE CASCADE
);


CREATE TABLE GIAO_HANG_LE.TAI_XE (
    ma_tai_xe INT PRIMARY KEY,
    bien_so_xe VARCHAR(16) NOT NULL UNIQUE,

    FOREIGN KEY (ma_tai_xe) REFERENCES GIAO_HANG_LE.NHAN_VIEN(ma_nhan_vien)  ON UPDATE CASCADE
);


CREATE TABLE GIAO_HANG_LE.ROI_KHO (
    ma_thung INT PRIMARY KEY,
    thoi_gian_di DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	ma_tai_xe INT NOT NULL,
    ma_kiem_kho INT NOT NULL,

	FOREIGN KEY (ma_kiem_kho) REFERENCES GIAO_HANG_LE.KIEM_KHO(ma_nhan_vien),
	FOREIGN KEY (ma_tai_xe) REFERENCES GIAO_HANG_LE.TAI_XE(ma_tai_xe) ON UPDATE CASCADE,
    FOREIGN KEY (ma_thung) REFERENCES GIAO_HANG_LE.THUNG_HANG(ma_thung_hang) ON UPDATE CASCADE
);


CREATE TABLE GIAO_HANG_LE.DEN_KHO (
	ma_thung INT PRIMARY KEY,
    thoi_gian_den DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	ma_tai_xe INT NOT NULL,
    ma_kiem_kho INT NOT NULL,

	FOREIGN KEY (ma_kiem_kho) REFERENCES GIAO_HANG_LE.KIEM_KHO(ma_nhan_vien),
	FOREIGN KEY (ma_tai_xe) REFERENCES GIAO_HANG_LE.TAI_XE(ma_tai_xe) ON UPDATE CASCADE,
    FOREIGN KEY (ma_thung) REFERENCES GIAO_HANG_LE.THUNG_HANG(ma_thung_hang) ON UPDATE CASCADE
);

CREATE TABLE GIAO_HANG_LE.DONG_GOI (
    ma_don_hang INT NOT NULL,
    ma_thung_hang INT NOT NULL,
    ma_kiem_kho INT NOT NULL,
    thoi_gian DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

	PRIMARY KEY (ma_don_hang, ma_thung_hang),

    FOREIGN KEY (ma_don_hang) REFERENCES GIAO_HANG_LE.DON_HANG(ma_don_hang) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ma_thung_hang) REFERENCES GIAO_HANG_LE.THUNG_HANG(ma_thung_hang) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ma_kiem_kho) REFERENCES GIAO_HANG_LE.KIEM_KHO(ma_nhan_vien) ON UPDATE CASCADE
);

CREATE TABLE GIAO_HANG_LE.GIAO_DI (
    ma_don_hang INT NOT NULL,
    thoi_gian DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ma_tai_xe INT NOT NULL,
    thanh_cong BIT NOT NULL,
    ly_do VARCHAR(64),

	PRIMARY KEY (ma_don_hang, thoi_gian, ma_tai_xe),

    FOREIGN KEY (ma_don_hang) REFERENCES GIAO_HANG_LE.DON_HANG(ma_don_hang) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ma_tai_xe) REFERENCES GIAO_HANG_LE.TAI_XE(ma_tai_xe) ON UPDATE CASCADE
);

CREATE TABLE GIAO_HANG_LE.GIAO_DEN (
    ma_don_hang INT NOT NULL,
    thoi_gian DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ma_tai_xe INT NOT NULL,
    thanh_cong BIT NOT NULL,
    ly_do VARCHAR(64),

	PRIMARY KEY (ma_don_hang, thoi_gian, ma_tai_xe),

    FOREIGN KEY (ma_don_hang) REFERENCES GIAO_HANG_LE.DON_HANG(ma_don_hang) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ma_tai_xe) REFERENCES GIAO_HANG_LE.TAI_XE(ma_tai_xe) ON UPDATE CASCADE
);

CREATE TABLE GIAO_HANG_LE.GIAO_DEN_KHO(
    ma_don_hang INT NOT NULL,
    ma_tai_xe INT,
    ma_kiem_kho INT NOT NULL,
    thoi_gian DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	thanh_cong BIT NOT NULL,
    ly_do VARCHAR(64),

    PRIMARY KEY (ma_don_hang, ma_kiem_kho),

    FOREIGN KEY (ma_don_hang) REFERENCES GIAO_HANG_LE.DON_HANG(ma_don_hang) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ma_tai_xe) REFERENCES GIAO_HANG_LE.TAI_XE(ma_tai_xe) ON UPDATE CASCADE,
    FOREIGN KEY (ma_kiem_kho) REFERENCES GIAO_HANG_LE.KIEM_KHO(ma_nhan_vien)
);


CREATE TABLE GIAO_HANG_LE.NGUOINHAN (
	ma_don_hang INT PRIMARY KEY,
	ten_nguoi_nhan VARCHAR(32) NOT NULL,
    so_dien_thoai DECIMAL(10, 0) NOT NULL,
	
	FOREIGN KEY (ma_don_hang) REFERENCES GIAO_HANG_LE.DON_HANG(ma_don_hang) ON DELETE CASCADE ON UPDATE CASCADE
); 


CREATE OR ALTER TRIGGER Check_Khoiluong
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


CREATE OR ALTER TRIGGER Check_SoluongNV
ON GIAO_HANG_LE.KIEM_KHO
FOR  INSERT, UPDATE 
AS
BEGIN
	DECLARE @sum INT;

	SELECT @sum = COUNT(GIAO_HANG_LE.KIEM_KHO.ma_nhan_vien)
	FROM INSERTED, GIAO_HANG_LE.KIEM_KHO
	WHERE INSERTED.ma_so_kho = GIAO_HANG_LE.KIEM_KHO.ma_so_kho AND INSERTED.phong = GIAO_HANG_LE.KIEM_KHO.phong
	GROUP BY GIAO_HANG_LE.KIEM_KHO.phong;

	IF (@sum > 10)
	BEGIN
	RAISERROR ('So nhan vien trong mot phong khong the lon hon 10', 16, 1);
	ROLLBACK; 
	END;
END;

CREATE OR ALTER TRIGGER Check_Solannhan
ON GIAO_HANG_LE.GIAO_DEN
FOR INSERT
AS
BEGIN
	DECLARE @sum INT;

	SELECT @sum = COUNT(*)
	FROM INSERTED, GIAO_HANG_LE.GIAO_DEN
	WHERE INSERTED.ma_don_hang = GIAO_HANG_LE.GIAO_DEN.ma_don_hang
	GROUP BY GIAO_HANG_LE.GIAO_DEN.ma_don_hang;

	IF (@sum > 5)
	BEGIN
	RAISERROR ('Khong the luu kho qua 5 lan', 16, 1);
	ROLLBACK; 
	END;
END;

CREATE OR ALTER TRIGGER Check_Solangui
ON GIAO_HANG_LE.GIAO_DI
FOR INSERT
AS
BEGIN
	DECLARE @sum INT;

	SELECT @sum = COUNT(*)
	FROM INSERTED, GIAO_HANG_LE.GIAO_DI
	WHERE INSERTED.ma_don_hang = GIAO_HANG_LE.GIAO_DI.ma_don_hang
	GROUP BY GIAO_HANG_LE.GIAO_DI.ma_don_hang;

	IF (@sum > 5)
	BEGIN
	RAISERROR ('Khong the lay hang tu nguoi gui, bi tu choi qua 5 lan!', 16, 1);
	ROLLBACK; 
	END;
END;






SELECT * FROM GIAO_HANG_LE.TAI_KHOAN;
SELECT * FROM  GIAO_HANG_LE.DON_HANG;
SELECT * FROM  GIAO_HANG_LE.KHO_HANG;
SELECT * FROM  GIAO_HANG_LE.KHACH_HANG;
SELECT * FROM  GIAO_HANG_LE.DAT_HANG;
SELECT * FROM  GIAO_HANG_LE.CHANG;
SELECT * FROM  GIAO_HANG_LE.DI_QUA;
SELECT * FROM  GIAO_HANG_LE.THUNG_HANG;
SELECT * FROM  GIAO_HANG_LE.ROI_KHO;
SELECT * FROM  GIAO_HANG_LE.DEN_KHO;
SELECT * FROM  GIAO_HANG_LE.NHAN_VIEN;
SELECT * FROM  GIAO_HANG_LE.KIEM_KHO;
SELECT * FROM GIAO_HANG_LE.DONG_GOI;
SELECT * FROM GIAO_HANG_LE.TAI_XE;
SELECT * FROM  GIAO_HANG_LE.GIAO_DEN;
SELECT * FROM  GIAO_HANG_LE.GIAO_DI;
SELECT * FROM GIAO_HANG_LE.NGUOINHAN;
SELECT * FROM GIAO_HANG_LE.GIAO_DEN_KHO;