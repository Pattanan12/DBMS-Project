DROP DATABASE IF EXISTS mind;
CREATE DATABASE IF NOT EXISTS `mind` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `mind`;

create table `user` (
	User_ID		int		Primary Key,
    User_Fullname	varchar(50),
    User_Age	int,
    User_Gender	char(1),
    User_DOB	date,
    User_AppleID	varchar(50),
    User_EXP	date,
	CONSTRAINT chk_usergender CHECK (User_Gender = 'M' OR User_Gender ='F')
);
insert into `user` (User_ID, User_Fullname, User_Age, User_DOB, User_Gender, User_AppleID, User_EXP)
values (101, 'Kitty Chicha', 19, '2002-06-03', 'F', 'kitty_2545@icloud.com','2021-01-04'),
	   (102, 'Rossalin Yao', 17, '2004-03-01', 'F', 'nongpae_@icloud.com','2021-02-07'),
       (103, 'Waris Dammak', 25, '1997-03-07', 'M', 'jamebonddy@icloud.com','2021-03-015'),
       (104, 'Chanisara Kotkham', 16, '2005-03-07', 'F', 'annonynous1@icloud.com','2021-04-14'),
       (105, 'Punsikorn Tiyakorn', 19, '2002-03-06', 'F', 'ohjennis@icloud.com','2021-04-07'),
       (106, 'Rosie Red', 20, '2001-04-01', 'F', 'imyourfather@icloud.com','2021-09-10'),
	   (107, 'Chalumphu Atjarit', 19, '2002-03-07', 'F', 'iamsusking@icloud.com','2021-08-28'),
       (108, 'Henry Mcdonald', 42, '1975-10-27', 'M', 'meow_cat@hotmail.com','2021-06-11'),
       (109, 'Pattanan Tai', 20, '2001-09-18', 'F', 'pattanan.ttai@hotmail.com','2021-01-26'),
	   (110, 'Sunshine Modulo', 22, '1999-09-18', 'F', 'hello.sunshine@hotmail.com','2021-03-09');
       
create table `song` (
	Song_ID		int		Primary Key,
    Song_name	varchar(50),
    URL			varchar(100),
    User_ID		int,
    constraint fk_SuserID foreign key (User_ID)
    references `user`(User_ID)
);
insert into `song` (Song_ID, Song_name,URL,User_ID)
values	(401, "Need to know", 'https://music.apple.com/th/search?term=nedd%20to%20know',101),
		(402,  "Jazz Classic", 'https://music.apple.com/th/search?term=Jazz%20classic',102),
        (403,  "Call me baby", 'https://music.apple.com/th/search?term=call%20me%20baby',103),
        (404,  "Fuck the Police", 'https://music.apple.com/th/search?term=fuck%20the%20police',104),
		(405,  "แค่เธอเข้ามา", 'https://music.apple.com/th/search?term=2%E0%B8%A1%E0%B8%B2',105),
        (406, "ILYSB", 'https://music.apple.com/th/search?term=ILYSB',106),
        (407, "War with heaven", 'https://music.apple.com/th/album/war-with-heaven/1580491222?i=1580491310',107),
        (408, "The One", 'https://music.apple.com/th/search?term=the%20one',108),
        (409, "You",'https://music.apple.com/th/search?term=You',109),
        (410, "YaYaYa",'https://music.apple.com/th/search?term=YaYaYa',110); 

create table `album` (
	Album_ID		int		Primary Key,
    Album_name	varchar(50),
    Album_release	date,
    URL			varchar(100),
    Song_ID		int,
	constraint fk_ZSongID foreign key (Song_ID)
    references `song`(Song_ID)
);

insert into `album` (Album_ID, Album_name, Album_release, URL,Song_ID)
values	(201, "Exodus", '2021-01-05', 'https://music.apple.com/us/album/the-2nd-album-exodus-chinese-version/979878243',401),
		(202, "Planet Her", '2021-07-11', 'https://music.apple.com/us/album/planet-her-deluxe/1574004234',402),
        (203, "You never walk alone", '2017-02-08', 'https://music.apple.com/us/album/you-never-walk-alone/1274676784',403),
        (204, "Obsession", '2019-05-07', 'https://music.apple.com/us/album/obsession-the-6th-album/1488308374',404),
		(205, "BNK Festival", '2018-06-01', 'https://music.apple.com/us/album/bnk-festival/1446555570?i=1446555574',405),
        (206, "ผู้เดียว", '2020-01-04', 'https://music.apple.com/us/album/%E0%B8%9C-%E0%B9%80%E0%B8%94-%E0%B8%A2%E0%B8%A7/1526414575',406),
        (207, "Shang-Chi and The Legend of the ten ring", '2021-09-03','https://music.apple.com/th/album/shang-chi-and-the-legend-of-the-ten-rings-the-album/1580491222',407),
		(208, "HELLO Chapter 1:Hello Stranger", '2019-07-22','https://music.apple.com/th/album/hello-chapter-1-hello-stranger-ep/1473122684',408),
        (209, "ILYSB", '2017-06-29','https://music.apple.com/th/album/ilysb-stripped/1444896617?i=1444896637',409),
        (210, "The1975", '2013-01-01','https://music.apple.com/th/artist/the-1975/542640016',410);


 create table `employee` (
	employee_ID	int	primary key,
    employee_Fullname varchar(50),
    employee_Address	varchar(50),
    employee_Gender	char(1),
    CONSTRAINT chk_empgender CHECK (employee_Gender = 'M' OR employee_Gender ='F')
);

insert into `employee` (employee_ID, employee_Fullname, employee_Address, employee_Gender)
values	(701, "Boogie Steven", "Bang Na, Bkk", "M"),
		(702, "Carrier Kellog", "Bang Yai, Bkk", "F"),
        (703, "Ayino Kiminoto", "Sampran, Nk", "M"),
		(704, "Sony Sang", "Baan Bueng, Chon Buri", "F"),
        (705, "Senyai Bark", "Sathorn, Bkk", "M"),
        (706, "Happy Friday", "Sampran, Nk", "F"),
        (707, "Max Johnson", "Cha-am, Phetchaburi", "M"),
        (708, "Scarlette Richard", "Phaya Thai, Bkk", "F"),
        (709, "Jessica Wellinton", "Phaya Thai, Bkk", "F"),
        (710, "Oliver Kenston", "Nong Chok, Bkk", "M"),
        (711, "Jordy Billaden", "Benchalak, Sisaket", "M"),
        (712, "Pete Pettigrew", "Ao Luek, Krabi", "M"),
        (713, "Ronald Wiseley", "Bang Rachan, Sing Buri", "M"),
        (714, "Harry Kicker", "Bo Kluea, Nan", "M"),
        (715, "Candy Yamasuki", "Lat Phrao, Bkk", "F");

 create table `full_time` (
    monthly_earning	 int,
    promotion	char(2),
    employee_ID	int primary key,
    constraint fk_emID foreign key (employee_ID)
    references  `employee`(employee_ID)
);

insert into  `full_time` (monthly_earning, promotion, employee_ID)
values	(1200, "A", 701),
		(1300, "B", 702),
        (1250, "A", 703),
        (1750, "C", 704),
        (2750, "E", 705),
        (1250, "A", 706),
        (1250, "A", 707),
        (1500, "B", 708),
        (2500, "D", 709),
        (1750, "C", 710);

 create table `part_time` (
    hourly_earning	 int,
    employee_ID	int primary key,
    constraint fk_2emID foreign key (employee_ID)
    references  `employee`(employee_ID)
);
insert into  `part_time` (hourly_earning, employee_ID)
values	(45, 711),
		(45, 712),
        (45, 713),
		(45, 714),
		(45, 715);


create table `playlist` (
	Playlist_ID		int	Primary Key,
    Category	varchar(50),
    Playlist_Name	varchar(50),
    URL			varchar(100),
    employee_ID		int,
    Song_ID		int,
    constraint fk_SongIDp foreign key (Song_ID)
    references `song`(Song_ID),
    constraint fk_EMPID foreign key (employee_ID)
    references `employee`(employee_ID)
);

insert into `playlist` (Playlist_ID, Category, Playlist_Name, URL,employee_ID,Song_ID)
values	(301, "Pop", "Pop in spatial radio", 'https://music.apple.com/th/playlist/hits-in-spatial-audio/pl.ba2404fbc4464b8ba2d60399189cf24e',701 ,401),
		(302, "Pop", "Summer playlist", 'https://music.apple.com/th/playlist/pop-playlist-2021/pl.8041a56e48ac4650aa0bb67aff6194c6',702,402),
        (303, "K-Pop", "Guest Playlist: BTS", 'https://music.apple.com/th/playlist/guest-playlist-bts/pl.cf32aa708d4943b6bb1b6499093bbdfc',703,403),
        (304, "R&B", "boxx music playlist", 'https://music.apple.com/th/playlist/boxx-music-playlist/pl.c0142e0aa6744b54816c5d7301a0960b',704,404),
		(305, "R&B", "Shawn's Summer Mix", 'https://music.apple.com/th/playlist/shawns-summer-mix/pl.ae58ec81f51f4a4abe54cd728cc78715',705,405),
        (306, "Alternative", "Alternative Station",'https://music.apple.com/th/search?term=alnernative',706,406),
        (307, "Pop", "2019Hits",'https://music.apple.com/th/playlist/pop-hits-2019/pl.abe46acb6af0457caac2ad9101fe1dac',707,407), 
        (308, "Rock", "Tilly Birds",'https://music.apple.com/th/playlist/tilly-birds-essentials/pl.694b72043d924d8887a26bc875ea5b0b',708,408),
        (309, "K-pop", "K-pop Hit 2017",'https://music.apple.com/th/playlist/k-pop-hits-2017/pl.db349869c368476bb18bf4e0489bf0f5',709,409),
        (310, "K-pop", "K-pop Hit 2019",'https://music.apple.com/th/playlist/k-pop-hits-2019/pl.2b6a604f99504e7abca0d0e9e967c2ed',710,410);

        
        
create table `subscription_plan` (
	subscription_ID 	int primary key,
    subscription_name	varchar(30),
    price	int,
    User_ID	int,
    constraint fk_PUserID foreign key (User_ID)
    references  `user`(User_ID)
);

insert into `subscription_plan` (subscription_ID , subscription_name, price, User_ID)
values	(501, "Student", 69, 101),
		(502,  "Family", 199, 102),
        (503,  "Individual", 129, 103),
        (504,  "Individual", 129, 104),
        (505,  "Family", 199, 105),
        (506, "Student", 69, 106),
        (507, "Family", 199, 107),
        (508, "Individual", 129, 108),
        (509, "Individual", 129, 109),
        (510, "Student", 69, 110);

create table `payment_method` (
	payment_no	int	primary key,
    payment_cardtype varchar(20),
    payment_date	date,
    User_ID	int,
    constraint fk_P2UserID foreign key (User_ID)
    references  `user`(User_ID)
);

insert into `payment_method`(payment_no, payment_cardtype, payment_date, User_ID)
values	(601, "mastercard", "2021-07-09", 101),
		(602, "visa", "2021-07-09", 102),
        (603, "mastercard", "2021-01-03", 103),
		(604, "visa", "2021-05-07", 104),
        (605, "visa", "2021-07-11", 105),
        (606, "visa", "2021-03-03", 106),
        (607, "mastercard", "2021-05-16", 107),
        (608, "mastercard", "2021-06-28", 108),
        (609, "visa", "2021-10-15", 109),
        (610, "visa", "2021-08-03", 110);
 



