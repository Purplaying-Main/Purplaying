-- user
DROP TABLE IF EXISTS tb_user;
CREATE TABLE tb_user
(
    user_no serial PRIMARY KEY NOT NULL 
,    user_id varchar(100) NOT NULL 
,    user_pwd varchar(100) NOT NULL 
,    user_name varchar(100) NOT NULL 
,    user_phone varchar(100) NOT NULL default '010-0000-0000'
,    user_regdate timestamp default now()
,    user_activate integer NOT NULL default 1
,    user_role    integer NOT NULL default 0
); 

SELECT * FROM tb_user;

INSERT INTO tb_user
(user_id, user_pwd, user_name, user_phone, user_regdate, user_activate, user_role)
VALUES('admin@gmail.com', '0111', '관리자', '010-1111-1111', now(), 1, 0);

INSERT INTO tb_user
(user_id, user_pwd, user_name, user_phone, user_regdate, user_activate, user_role)
VALUES('ezen@gmail.com', '0111', 'ezen', '010-1111-2222', now(), 1, 1);



-- 약관동의 체크 테이블
drop table if exists tb_agreement;
create table tb_agreement
(
    agree_no serial primary key,
    agree_age boolean not null default false,
    agree_terms boolean not null default false,
    agree_inform boolean not null default false,
    agree_inform_third boolean not null default false,
    agree_marketing boolean not null default false
);
-- 약관동의 체크테이블 fk추가
ALTER TABLE tb_agreement ADD COLUMN user_no int NOT NULL;
ALTER TABLE tb_agreement ADD FOREIGN KEY(user_no)
REFERENCES tb_user(user_no) ON DELETE CASCADE;

-- 세팅 테이블
drop table if exists tb_setting;
create table tb_setting
(
    setting_no serial PRIMARY KEY,
    msg_agree            boolean            NOT NULL  default false,
    update_agree        boolean            NOT null default false,
    favor_agree            boolean           not null default false,
    marketing_agree        boolean           not null default false,
    user_introduce        text,
    user_no int NOT null,
    FOREIGN KEY(user_no) REFERENCES tb_user(user_no) ON DELETE CASCADE
);


-- 주소 테이블
drop table if exists tb_address;
create table tb_address
(
    address_id            serial       primary key not null,
    address_name        varchar(100),
    address_num            char(5)                not null,
    address           varchar(100)        not null,
    address_detail           varchar(100)        not null,
    receiver_name        varchar(100)        not null,
    receiver_phonenum    varchar(100)        not null,
    default_address        boolean,
    user_no                 int        not null,
    FOREIGN KEY(USER_no) REFERENCES tb_user(USER_no) ON DELETE cascade
);

-- 마이페이지 테이블
drop table if exists tb_mypage;
create table tb_mypage
(
   user_no int NOT null,
   FOREIGN KEY(user_no) REFERENCES tb_user(user_no) ON DELETE cascade,
   PRIMARY KEY(user_no),
   prdt_id int NOT null,
   FOREIGN KEY(prdt_id) REFERENCES tb_product(prdt_id) ON DELETE cascade,
   product_like boolean DEFAULT FALSE
); 


--공지사항 notice.jsp 테스트
drop table if exists tb_notice;
create table tb_notice
(
	notice_id		serial		primary KEY
,	writer		varchar(100)	NOT NULL		
,	notice_title  	varchar(200)	not null
,	notice_context	text
,	notice_regdate	Timestamp
,	notice_category	integer	NOT NULL DEFAULT 1
,	notice_private	boolean NOT NULL DEFAULT FALSE 
,	view_cnt		int default 0
);

SELECT * FROM tb_notice;

INSERT INTO public.tb_notice
(writer, notice_title, notice_context, notice_regdate, notice_category, notice_private, view_cnt)
VALUES(1, '공지사항', '공지사항내용', now(), 1, FALSE, 1);

INSERT INTO tb_notice
(user_id, notice_title, notice_context, notice_regdate, notice_category, notice_private, view_cnt)
VALUES('ezen@gmail.com', '이벤트5', '이벤트입니다5', now(), 2, TRUE, 0);

ALTER TABLE tb_notice ADD FOREIGN KEY (user_id)
REFERENCES tb_user(user_id)
;

-- 컬럼명 변경
ALTER TABLE tb_notice RENAME COLUMN user_id TO writer;

-- 수정 
UPDATE tb_notice
SET notice_title = '수정테스트 ', notice_context = '이내용은 수정되었습니다.', notice_regdate = now(), notice_private = true  
WHERE notice_id= 99 and writer = 'admin@gmail.com'
;

-- project 11.22 최신버전 ( tb_product, tb_reward)
drop table if exists tb_product;
create table tb_product
(
    prdt_id serial PRIMARY KEY NOT NULL 
,    prdt_name varchar(30)
,    prdt_desc varchar(2000)
,    prdt_desc_detail text
,    prdt_regdate timestamp DEFAULT now()
,    prdt_opendate date
,    prdt_enddate date
,    prdt_goal NUMERIC
,    prdt_currenttotal NUMERIC
,    prdt_open boolean 
,    prdt_desc_policy text
,    writer varchar(100) 
,    prdt_genre int 
,    prdt_thumbnail text 
,     prdt_dday NUMERIC
,      prdt_percent NUMERIC
,     prdt_purchaseday date
,     prdt_limitday date
);

SELECT * FROM tb_product tp ;

drop table if exists tb_reward;
create table tb_reward
(
    reward_id serial primary key
,    reward_name varchar(100) NOT NULL 
,    reward_desc text NOT NULL 
,    reward_price NUMERIC DEFAULT 1000 
,    reward_stock int
,   reward_category int not null default 0
); 

ALTER TABLE TB_REWARD  ADD COLUMN prdt_id int NOT NULL;

ALTER TABLE TB_REWARD ADD FOREIGN KEY(prdt_id)
REFERENCES tb_product(prdt_id) ON DELETE CASCADE;

SELECT * FROM tb_reward tr ;
TRUNCATE TABLE tb_reward restart IDENTITY;


-- 일대일 문의 게시판
drop table if exists tb_inquiry;
create table tb_inquiry
(
    inquiry_no            serial        PRIMARY key
,    inquiry_state        integer        NOT NULL DEFAULT 0
,    writer                varchar(100) NOT NULL
,    inquiry_title          varchar(30)    NOT NULL 
,    inquiry_context        TEXT 
,    inquiry_private        boolean    NOT NULL DEFAULT FALSE
,    inquiry_regdate        date default CURRENT_TIMESTAMP
);

-- 일대일 문의 답변 게시판
drop table if exists tb_inquiry_ans;
create table tb_inquiry_ans
(
    ans_no            serial        PRIMARY key
,    ans_state        integer        not null
,    admin_id        varchar(100) NOT NULL
,    ans_context        TEXT 
,    ans_regdate        date default CURRENT_TIMESTAMP
);

ALTER TABLE tb_inquiry_ans  ADD COLUMN inquiry_no int NOT NULL;
ALTER TABLE tb_inquiry_ans ADD FOREIGN KEY(inquiry_no)
REFERENCES tb_inquiry(inquiry_no) ON DELETE CASCADE;


-- file DB(프로젝트id 외래키설정)
drop table if exists tb_file;
CREATE TABLE tb_file
(
    file_id serial,
    file_name VARCHAR(200) NOT NULL,
    file_location text, 
    file_size NUMERIC,
    file_regdate timestamp DEFAULT now() NOT NULL, 
    file_state VARCHAR(1) DEFAULT 'F' NOT NULL,
    PRIMARY KEY(file_id)
);

ALTER TABLE tb_file  ADD COLUMN prdt_id int NOT NULL;

ALTER TABLE tb_file ADD FOREIGN KEY(prdt_id)
REFERENCES tb_product(prdt_id) ON DELETE CASCADE;

SELECT * FROM tb_file
;

truncate table tb_file restart IDENTITY; 