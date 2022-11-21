DROP TABLE IF EXISTS tb_deliveryCharge;
CREATE TABLE tb_deliveryCharge
(
	location_no		serial PRIMARY KEY ,
    location_nm    VARCHAR(100) NOT NULL,
    location_price    INTEGER NOT NULL
);
--///////////////////////////////////////////////////
DROP TABLE IF EXISTS tb_image;
CREATE TABLE tb_image
(
    img_no    numeric PRIMARY KEY NOT NULL,
    img_type    CHAR NOT NULL,
    img_path    VARCHAR(200) NOT NULL,
    img_nm    VARCHAR(200) NOT NULL
   --	user_id varchar(100) REFERENCES tb_user (user_id)
);
--///////////////////////////////////////////////////
DROP TABLE IF EXISTS tb_payment;
CREATE TABLE tb_payment
(
    pay_no    numeric NOT NULL PRIMARY KEY ,
    pay_time    TIMESTAMP,
    pay_allow    boolean DEFAULT false,
    pay_content    VARCHAR(100) NOT NULL
);
--///////////////////////////////////////////////////
DROP TABLE IF EXISTS tb_user;
CREATE TABLE tb_user
(
	user_no serial PRIMARY KEY NOT NULL 
,	user_id varchar(100) NOT NULL 
,	user_pwd varchar(100) NOT NULL 
,	user_name varchar(100) NOT NULL 
,	user_phone varchar(100) NOT NULL 
,	user_regdate timestamp
,	user_activate char NOT NULL 
,	user_role	integer NOT NULL 
);
--///////////////////////////////////////////////////
DROP TABLE IF EXISTS tb_chat_service;
CREATE TABLE IF NOT EXISTS tb_chat_service(
    chat_no serial PRIMARY KEY,
    chat_serial_no int,
    chat_context text,
    chat_date timestamp,
    chat_type int NOT NULL DEFAULT 1
);
--///////////////////////////////////////////////////
drop table if exists tb_setting;
create table tb_setting
(
	setting_no serial PRIMARY KEY,
    msg_agree            boolean            NOT NULL  default false,
    update_agree        boolean            NOT null default false,
    favor_agree            boolean           not null default false,
    marketing_agree        boolean           not null default false,
    user_introduce        text
);
--///////////////////////////////////////////////////
drop table if exists tb_mypage;
create table tb_mypage
(
   --fk로 구성
);
--///////////////////////////////////////////////////
drop table if exists tb_account;--결제
create table tb_account(
	account_no serial PRIMARY KEY NOT NULL ,
	account_type integer NOT NULL DEFAULT 1 ,
	account_bank varchar(100) NOT NULL ,
	account_bank_no numeric NOT NULL,
	account_bank_nm varchar(100) NOT NULL
);
--///////////////////////////////////////////////////
drop table if exists tb_address;
create table tb_address
(
    address_id            serial       primary key not null,
    address_name        varchar(100),
    address_num            integer                not null,
    address           varchar(100)        not null,
    address_detail           varchar(100)        not null,
    receiver_name        varchar(100)        not null,
    receiver_phonenum    varchar(100)        not null,
    default_address        boolean
);
--///////////////////////////////////////////////////
drop table if exists tb_notice;
create table tb_notice
(
	notice_id		serial		primary key
,	notice_title  	varchar(200)	not null
,	notice_context	text
,	notice_regdate	Timestamp
,	notice_category	integer	NOT NULL
,	notice_private	boolean NOT NULL DEFAULT FALSE 
);
--///////////////////////////////////////////////////
drop table if exists tb_inquiry;
create table tb_inquiry
(
	inquiry_no			serial		PRIMARY KEY
,	inquiry_type_no		integer		NOT NULL
,	inquiry_title  		varchar(30)	NOT NULL 
,	inquiry_context		TEXT 
,	inquiry_regdate		Timestamp
,	inquiry_state		boolean	NOT NULL DEFAULT FALSE 
,	inquiry_private		boolean	NOT NULL DEFAULT FALSE
, 	inquiry_category	integer NOT NULL DEFAULT 1
);
--///////////////////////////////////////////////////
drop table if exists tb_leave;
create table tb_leave
(	
	leave_no	NUMERIC PRIMARY KEY NOT NULL ,
	leave_category int NOT NULL ,
	leave_reason	TEXT
);

--///////////////////////////////////////////////////
drop table if exists tb_genre;
create table tb_genre
(
   genre_id int primary key
,   genre_name int NOT NULL 
);
--///////////////////////////////////////////////////
drop table if exists tb_product;
create table tb_product
(
	product_id int primary key
,	prdt_name varchar(30)
,	prdt_desc varchar(2000)
,	prdt_desc_detail text
,	prdt_regdate timestamp
,	prdt_opendate date
,	prdt_enddate date
,	prdt_goal NUMERIC NOT NULL DEFAULT 500000
,	prdt_currenttotal NUMERIC NOT NULL DEFAULT 0
,	prdt_open boolean DEFAULT false 
,   prdt_desc_policy text
);
--///////////////////////////////////////////////////
drop table if exists tb_reward;
create table tb_reward
(
	reward_id int primary key
,	reward_name varchar(100) NOT NULL 
,	reward_desc varchar(100) NOT NULL 
,	reward_price NUMERIC DEFAULT 1000 
,	reward_stock int
);

--///////////////////////////////////////////////////
ALTER TABLE tb_product  ADD COLUMN reward_id int NOT NULL;
ALTER TABLE tb_product ADD FOREIGN KEY(reward_id)
REFERENCES tb_reward(reward_id) ON DELETE CASCADE;

ALTER TABLE tb_user ADD COLUMN img_no int NOT NULL;
ALTER TABLE tb_user ADD FOREIGN KEY(img_no)
REFERENCES tb_image(img_no) ON DELETE CASCADE;

ALTER TABLE TB_PRODUCT  ADD COLUMN img_no int NOT NULL;
ALTER TABLE TB_PRODUCT ADD FOREIGN KEY(img_no)
REFERENCES tb_image(img_no) ON DELETE CASCADE;

ALTER TABLE TB_INQUIRY  ADD COLUMN img_no int NOT NULL;
ALTER TABLE TB_INQUIRY ADD FOREIGN KEY(img_no)
REFERENCES tb_image(img_no) ON DELETE CASCADE;

ALTER TABLE TB_NOTICE  ADD COLUMN img_no int NOT NULL;
ALTER TABLE TB_NOTICE ADD FOREIGN KEY(img_no)
REFERENCES tb_image(img_no) ON DELETE CASCADE;

ALTER TABLE TB_address  ADD COLUMN user_no int NOT NULL;
ALTER TABLE TB_address ADD FOREIGN KEY(user_no)
REFERENCES tb_user(user_no) ON DELETE CASCADE;

ALTER TABLE TB_CHAT_SERVICE  ADD COLUMN product_id int NOT NULL;
ALTER TABLE TB_CHAT_SERVICE ADD FOREIGN KEY(product_id)
REFERENCES tb_product(product_id) ON DELETE CASCADE;

ALTER TABLE TB_inquiry  ADD COLUMN user_no int NOT NULL;
ALTER TABLE TB_inquiry ADD FOREIGN KEY(user_no)
REFERENCES tb_user(user_no) ON DELETE CASCADE;

ALTER TABLE tb_payment ADD COLUMN account_no int NOT NULL;
ALTER TABLE tb_payment ADD FOREIGN KEY(account_no)
REFERENCES tb_account(account_no) ON DELETE CASCADE;

ALTER TABLE tb_account ADD COLUMN user_no int NOT NULL;
ALTER TABLE tb_account ADD FOREIGN KEY(user_no)
REFERENCES tb_user(user_no) ON DELETE CASCADE;

ALTER TABLE tb_genre ADD COLUMN product_id int NOT NULL;
ALTER TABLE tb_genre ADD FOREIGN KEY(product_id)
REFERENCES tb_product(product_id) ON DELETE CASCADE;

ALTER TABLE tb_leave ADD COLUMN user_no int NOT NULL;
ALTER TABLE tb_leave ADD FOREIGN KEY(user_no)
REFERENCES tb_user(user_no) ON DELETE CASCADE;

ALTER TABLE tb_setting ADD COLUMN user_no int NOT NULL;
ALTER TABLE tb_setting ADD FOREIGN KEY(user_no)
REFERENCES tb_user(user_no) ON DELETE CASCADE;

ALTER TABLE tb_address ADD COLUMN location_no int NOT NULL;
ALTER TABLE tb_address ADD FOREIGN KEY(location_no)
REFERENCES tb_deliverycharge(location_no) ON DELETE CASCADE;

ALTER TABLE tb_mypage ADD COLUMN user_no int NOT NULL;
ALTER TABLE tb_mypage ADD FOREIGN KEY(user_no)
REFERENCES tb_user(user_no) ON DELETE CASCADE;
ALTER TABLE tb_mypage ADD PRIMARY KEY(user_no);

ALTER TABLE tb_mypage ADD COLUMN product_id int NOT NULL;
ALTER TABLE tb_mypage ADD FOREIGN KEY(product_id)
REFERENCES tb_product(product_id) ON DELETE CASCADE;

ALTER TABLE tb_mypage ADD COLUMN setting_no int NOT NULL;
ALTER TABLE tb_mypage ADD FOREIGN KEY(setting_no)
REFERENCES tb_setting(setting_no) ON DELETE CASCADE;

ALTER TABLE TB_CHAT_SERVICE  ADD COLUMN pay_no int NOT NULL;
ALTER TABLE TB_CHAT_SERVICE ADD FOREIGN KEY(pay_no)
REFERENCES tb_payment(pay_no) ON DELETE CASCADE;

ALTER TABLE TB_PRODUCT  ADD COLUMN user_no int NOT NULL;
ALTER TABLE TB_PRODUCT ADD FOREIGN KEY(user_no)
REFERENCES tb_user(user_no) ON DELETE CASCADE;

ALTER TABLE TB_REWARD  ADD COLUMN reward_grade int NOT NULL;

ALTER TABLE TB_REWARD  ADD COLUMN reward_grade int NOT NULL;

ALTER TABLE TB_mypage  ADD COLUMN product_like boolean DEFAULT FALSE;

ALTER TABLE TB_INQUIRY RENAME COLUMN inquiry_category TO inquiry_serial_no;

ALTER TABLE tb_payment ADD COLUMN USER_no int NOT NULL;
ALTER TABLE tb_payment ADD FOREIGN KEY(USER_no)
REFERENCES tb_mypage(USER_no) ON DELETE CASCADE;