--
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE purplaying;
--
-- Name: purplaying; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE purplaying WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Korean_Korea.949';


ALTER DATABASE purplaying OWNER TO postgres;

\connect purplaying

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: tb_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_address (
    address_id integer NOT NULL,
    address_name character varying(100),
    address character varying(100) NOT NULL,
    address_detail character varying(100) NOT NULL,
    receiver_name character varying(100) NOT NULL,
    receiver_phonenum character varying(100) NOT NULL,
    default_address boolean,
    user_no integer NOT NULL,
    address_num character(5) NOT NULL
);


ALTER TABLE public.tb_address OWNER TO postgres;

--
-- Name: tb_address_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_address_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_address_address_id_seq OWNER TO postgres;

--
-- Name: tb_address_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_address_address_id_seq OWNED BY public.tb_address.address_id;


--
-- Name: tb_agreement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_agreement (
    agree_no integer NOT NULL,
    agree_age boolean DEFAULT false NOT NULL,
    agree_terms boolean DEFAULT false NOT NULL,
    agree_inform boolean DEFAULT false NOT NULL,
    agree_inform_third boolean DEFAULT false NOT NULL,
    agree_marketing boolean DEFAULT false NOT NULL,
    user_no integer NOT NULL
);


ALTER TABLE public.tb_agreement OWNER TO postgres;

--
-- Name: tb_agreement_agree_no_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_agreement_agree_no_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_agreement_agree_no_seq OWNER TO postgres;

--
-- Name: tb_agreement_agree_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_agreement_agree_no_seq OWNED BY public.tb_agreement.agree_no;


--
-- Name: tb_alarm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_alarm (
    alarm_no integer NOT NULL,
    alarm_cnt integer DEFAULT 0,
    alarm_regdate timestamp without time zone DEFAULT now(),
    like_id integer NOT NULL
);


ALTER TABLE public.tb_alarm OWNER TO postgres;

--
-- Name: tb_alarm_alarm_no_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_alarm_alarm_no_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_alarm_alarm_no_seq OWNER TO postgres;

--
-- Name: tb_alarm_alarm_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_alarm_alarm_no_seq OWNED BY public.tb_alarm.alarm_no;


--
-- Name: tb_bannerfile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_bannerfile (
    bannerfile_id integer NOT NULL,
    bannerfile_file text,
    bannerfile_prdt_id integer,
    bannerfile_regdate timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.tb_bannerfile OWNER TO postgres;

--
-- Name: tb_bannerfile_bannerfile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_bannerfile_bannerfile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_bannerfile_bannerfile_id_seq OWNER TO postgres;

--
-- Name: tb_bannerfile_bannerfile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_bannerfile_bannerfile_id_seq OWNED BY public.tb_bannerfile.bannerfile_id;


--
-- Name: tb_chat_service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_chat_service (
    chat_no integer NOT NULL,
    prdt_id integer NOT NULL,
    chat_writer character varying(30) NOT NULL,
    chat_context character varying(3000),
    chat_date date DEFAULT now(),
    user_no integer NOT NULL,
    user_nickname character varying(100)
);


ALTER TABLE public.tb_chat_service OWNER TO postgres;

--
-- Name: tb_chat_service_chat_no_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_chat_service_chat_no_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_chat_service_chat_no_seq OWNER TO postgres;

--
-- Name: tb_chat_service_chat_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_chat_service_chat_no_seq OWNED BY public.tb_chat_service.chat_no;


--
-- Name: tb_file; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_file (
    file_id integer NOT NULL,
    file_name character varying(200) NOT NULL,
    file_location text,
    file_size numeric,
    file_regdate timestamp without time zone DEFAULT now() NOT NULL,
    file_state character varying(1) DEFAULT 'F'::character varying NOT NULL,
    prdt_id integer,
    user_no integer,
    isbannerimg integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.tb_file OWNER TO postgres;

--
-- Name: tb_file_file_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_file_file_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_file_file_id_seq OWNER TO postgres;

--
-- Name: tb_file_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_file_file_id_seq OWNED BY public.tb_file.file_id;


--
-- Name: tb_image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_image (
    img_no numeric NOT NULL,
    img_type character(1) NOT NULL,
    img_path character varying(200) NOT NULL,
    img_nm character varying(200) NOT NULL
);


ALTER TABLE public.tb_image OWNER TO postgres;

--
-- Name: tb_inquiry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_inquiry (
    inquiry_no integer NOT NULL,
    inquiry_state integer DEFAULT 0 NOT NULL,
    writer character varying(100) NOT NULL,
    inquiry_title character varying(30) NOT NULL,
    inquiry_context text,
    inquiry_private boolean DEFAULT false NOT NULL,
    inquiry_regdate date DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.tb_inquiry OWNER TO postgres;

--
-- Name: tb_inquiry_ans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_inquiry_ans (
    ans_no integer NOT NULL,
    ans_state integer NOT NULL,
    admin_id character varying(100) NOT NULL,
    ans_context text,
    ans_regdate date DEFAULT CURRENT_TIMESTAMP,
    inquiry_no integer NOT NULL
);


ALTER TABLE public.tb_inquiry_ans OWNER TO postgres;

--
-- Name: tb_inquiry_ans_ans_no_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_inquiry_ans_ans_no_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_inquiry_ans_ans_no_seq OWNER TO postgres;

--
-- Name: tb_inquiry_ans_ans_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_inquiry_ans_ans_no_seq OWNED BY public.tb_inquiry_ans.ans_no;


--
-- Name: tb_inquiry_inquiry_no_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_inquiry_inquiry_no_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_inquiry_inquiry_no_seq OWNER TO postgres;

--
-- Name: tb_inquiry_inquiry_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_inquiry_inquiry_no_seq OWNED BY public.tb_inquiry.inquiry_no;


--
-- Name: tb_leave; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_leave (
    leave_no integer NOT NULL,
    leave_category integer NOT NULL,
    leave_reason text,
    user_no integer NOT NULL
);


ALTER TABLE public.tb_leave OWNER TO postgres;

--
-- Name: tb_leave_leave_no_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_leave_leave_no_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_leave_leave_no_seq OWNER TO postgres;

--
-- Name: tb_leave_leave_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_leave_leave_no_seq OWNED BY public.tb_leave.leave_no;


--
-- Name: tb_like; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_like (
    like_id integer NOT NULL,
    like_regdate date,
    user_id character varying(100),
    prdt_id integer
);


ALTER TABLE public.tb_like OWNER TO postgres;

--
-- Name: tb_like_like_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_like_like_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_like_like_id_seq OWNER TO postgres;

--
-- Name: tb_like_like_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_like_like_id_seq OWNED BY public.tb_like.like_id;


--
-- Name: tb_mypage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_mypage (
    user_no integer NOT NULL,
    prdt_id integer NOT NULL,
    product_like boolean DEFAULT false
);


ALTER TABLE public.tb_mypage OWNER TO postgres;

--
-- Name: tb_notice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_notice (
    notice_id integer NOT NULL,
    writer character varying(100) NOT NULL,
    notice_title character varying(200) NOT NULL,
    notice_context text,
    notice_regdate timestamp without time zone,
    notice_category integer DEFAULT 1 NOT NULL,
    notice_private boolean DEFAULT false NOT NULL,
    view_cnt integer DEFAULT 0
);


ALTER TABLE public.tb_notice OWNER TO postgres;

--
-- Name: tb_notice_notice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_notice_notice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_notice_notice_id_seq OWNER TO postgres;

--
-- Name: tb_notice_notice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_notice_notice_id_seq OWNED BY public.tb_notice.notice_id;


--
-- Name: tb_payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_payment (
    pay_no integer NOT NULL,
    pay_time timestamp without time zone DEFAULT now(),
    user_no integer,
    prdt_id integer,
    reward_id character varying[],
    reward_user_cnt character varying[],
    pay_total numeric NOT NULL,
    delivery_reciever character varying(100) NOT NULL,
    delivery_phone character varying(100) NOT NULL,
    delivery_postcode character varying(100) NOT NULL,
    delivery_address character varying(500) NOT NULL,
    delivery_addressdetail character varying(500),
    delivery_memo character varying(1000)
);


ALTER TABLE public.tb_payment OWNER TO postgres;

--
-- Name: tb_payment_pay_no_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_payment_pay_no_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_payment_pay_no_seq OWNER TO postgres;

--
-- Name: tb_payment_pay_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_payment_pay_no_seq OWNED BY public.tb_payment.pay_no;


--
-- Name: tb_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_product (
    prdt_id integer NOT NULL,
    prdt_name character varying(30),
    prdt_desc character varying(2000),
    prdt_desc_detail text,
    prdt_regdate timestamp without time zone DEFAULT now(),
    prdt_opendate date,
    prdt_enddate date,
    prdt_goal numeric,
    prdt_currenttotal numeric,
    prdt_open boolean,
    prdt_desc_policy text,
    writer character varying(100),
    prdt_genre integer,
    prdt_thumbnail text,
    prdt_img text,
    prdt_buyercnt integer DEFAULT 0,
    user_id character varying(100),
    update_regdate timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.tb_product OWNER TO postgres;

--
-- Name: tb_product_prdt_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_product_prdt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_product_prdt_id_seq OWNER TO postgres;

--
-- Name: tb_product_prdt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_product_prdt_id_seq OWNED BY public.tb_product.prdt_id;


--
-- Name: tb_reply; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_reply (
    rno integer NOT NULL,
    prdt_id integer,
    chat_no integer,
    chat_writer character varying(30) NOT NULL,
    chat_context character varying(3000),
    chat_date date DEFAULT now(),
    user_no integer,
    user_nickname character varying(100)
);


ALTER TABLE public.tb_reply OWNER TO postgres;

--
-- Name: tb_reply_rno_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_reply_rno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_reply_rno_seq OWNER TO postgres;

--
-- Name: tb_reply_rno_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_reply_rno_seq OWNED BY public.tb_reply.rno;


--
-- Name: tb_reward; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_reward (
    reward_id integer NOT NULL,
    reward_name character varying(100) NOT NULL,
    reward_desc text NOT NULL,
    reward_price numeric DEFAULT 1000,
    reward_stock integer,
    reward_category integer DEFAULT 0 NOT NULL,
    prdt_id integer NOT NULL
);


ALTER TABLE public.tb_reward OWNER TO postgres;

--
-- Name: tb_reward_reward_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_reward_reward_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_reward_reward_id_seq OWNER TO postgres;

--
-- Name: tb_reward_reward_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_reward_reward_id_seq OWNED BY public.tb_reward.reward_id;


--
-- Name: tb_setting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_setting (
    setting_no integer NOT NULL,
    msg_agree boolean DEFAULT false NOT NULL,
    update_agree boolean DEFAULT false NOT NULL,
    favor_agree boolean DEFAULT false NOT NULL,
    marketing_agree boolean DEFAULT false NOT NULL,
    user_introduce text,
    user_no integer NOT NULL
);


ALTER TABLE public.tb_setting OWNER TO postgres;

--
-- Name: tb_setting_setting_no_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_setting_setting_no_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_setting_setting_no_seq OWNER TO postgres;

--
-- Name: tb_setting_setting_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_setting_setting_no_seq OWNED BY public.tb_setting.setting_no;


--
-- Name: tb_update; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_update (
    update_id integer NOT NULL,
    update_regdate timestamp without time zone DEFAULT now() NOT NULL,
    update_title character varying(30) NOT NULL,
    update_desc text NOT NULL,
    user_id character varying(100) NOT NULL,
    prdt_id integer NOT NULL
);


ALTER TABLE public.tb_update OWNER TO postgres;

--
-- Name: tb_update_update_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_update_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_update_update_id_seq OWNER TO postgres;

--
-- Name: tb_update_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_update_update_id_seq OWNED BY public.tb_update.update_id;


--
-- Name: tb_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_user (
    user_no integer NOT NULL,
    user_id character varying(100) NOT NULL,
    user_pwd character varying(100) NOT NULL,
    user_name character varying(100) NOT NULL,
    user_phone character varying(100) DEFAULT '010-0000-0000'::character varying NOT NULL,
    user_regdate timestamp without time zone DEFAULT now(),
    user_activate integer DEFAULT 1 NOT NULL,
    user_role integer DEFAULT 0 NOT NULL,
    user_profile character varying(300) DEFAULT '/purplaying/file/profile/display?file_name=/2022%5C12%5C02%2Fac892600-b007-46ce-bdac-5ec0ff7b1e3d_%EA%B8%B0%EB%B3%B8%EC%9D%B4%EB%AF%B8%EC%A7%80.jfif'::character varying,
    user_point integer DEFAULT 0,
    user_nickname character varying(100) DEFAULT NULL::character varying
);


ALTER TABLE public.tb_user OWNER TO postgres;

--
-- Name: tb_user_user_no_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_user_user_no_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_user_user_no_seq OWNER TO postgres;

--
-- Name: tb_user_user_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_user_user_no_seq OWNED BY public.tb_user.user_no;


--
-- Name: tb_address address_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_address ALTER COLUMN address_id SET DEFAULT nextval('public.tb_address_address_id_seq'::regclass);


--
-- Name: tb_agreement agree_no; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_agreement ALTER COLUMN agree_no SET DEFAULT nextval('public.tb_agreement_agree_no_seq'::regclass);


--
-- Name: tb_alarm alarm_no; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_alarm ALTER COLUMN alarm_no SET DEFAULT nextval('public.tb_alarm_alarm_no_seq'::regclass);


--
-- Name: tb_bannerfile bannerfile_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_bannerfile ALTER COLUMN bannerfile_id SET DEFAULT nextval('public.tb_bannerfile_bannerfile_id_seq'::regclass);


--
-- Name: tb_chat_service chat_no; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_chat_service ALTER COLUMN chat_no SET DEFAULT nextval('public.tb_chat_service_chat_no_seq'::regclass);


--
-- Name: tb_file file_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_file ALTER COLUMN file_id SET DEFAULT nextval('public.tb_file_file_id_seq'::regclass);


--
-- Name: tb_inquiry inquiry_no; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_inquiry ALTER COLUMN inquiry_no SET DEFAULT nextval('public.tb_inquiry_inquiry_no_seq'::regclass);


--
-- Name: tb_inquiry_ans ans_no; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_inquiry_ans ALTER COLUMN ans_no SET DEFAULT nextval('public.tb_inquiry_ans_ans_no_seq'::regclass);


--
-- Name: tb_leave leave_no; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_leave ALTER COLUMN leave_no SET DEFAULT nextval('public.tb_leave_leave_no_seq'::regclass);


--
-- Name: tb_like like_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_like ALTER COLUMN like_id SET DEFAULT nextval('public.tb_like_like_id_seq'::regclass);


--
-- Name: tb_notice notice_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_notice ALTER COLUMN notice_id SET DEFAULT nextval('public.tb_notice_notice_id_seq'::regclass);


--
-- Name: tb_payment pay_no; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_payment ALTER COLUMN pay_no SET DEFAULT nextval('public.tb_payment_pay_no_seq'::regclass);


--
-- Name: tb_product prdt_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_product ALTER COLUMN prdt_id SET DEFAULT nextval('public.tb_product_prdt_id_seq'::regclass);


--
-- Name: tb_reply rno; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_reply ALTER COLUMN rno SET DEFAULT nextval('public.tb_reply_rno_seq'::regclass);


--
-- Name: tb_reward reward_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_reward ALTER COLUMN reward_id SET DEFAULT nextval('public.tb_reward_reward_id_seq'::regclass);


--
-- Name: tb_setting setting_no; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_setting ALTER COLUMN setting_no SET DEFAULT nextval('public.tb_setting_setting_no_seq'::regclass);


--
-- Name: tb_update update_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_update ALTER COLUMN update_id SET DEFAULT nextval('public.tb_update_update_id_seq'::regclass);


--
-- Name: tb_user user_no; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_user ALTER COLUMN user_no SET DEFAULT nextval('public.tb_user_user_no_seq'::regclass);


--
-- Data for Name: tb_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_address (address_id, address_name, address, address_detail, receiver_name, receiver_phonenum, default_address, user_no, address_num) FROM stdin;
\.
COPY public.tb_address (address_id, address_name, address, address_detail, receiver_name, receiver_phonenum, default_address, user_no, address_num) FROM '$$PATH$$/3525.dat';

--
-- Data for Name: tb_agreement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_agreement (agree_no, agree_age, agree_terms, agree_inform, agree_inform_third, agree_marketing, user_no) FROM stdin;
\.
COPY public.tb_agreement (agree_no, agree_age, agree_terms, agree_inform, agree_inform_third, agree_marketing, user_no) FROM '$$PATH$$/3527.dat';

--
-- Data for Name: tb_alarm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_alarm (alarm_no, alarm_cnt, alarm_regdate, like_id) FROM stdin;
\.
COPY public.tb_alarm (alarm_no, alarm_cnt, alarm_regdate, like_id) FROM '$$PATH$$/3555.dat';

--
-- Data for Name: tb_bannerfile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_bannerfile (bannerfile_id, bannerfile_file, bannerfile_prdt_id, bannerfile_regdate) FROM stdin;
\.
COPY public.tb_bannerfile (bannerfile_id, bannerfile_file, bannerfile_prdt_id, bannerfile_regdate) FROM '$$PATH$$/3551.dat';

--
-- Data for Name: tb_chat_service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_chat_service (chat_no, prdt_id, chat_writer, chat_context, chat_date, user_no, user_nickname) FROM stdin;
\.
COPY public.tb_chat_service (chat_no, prdt_id, chat_writer, chat_context, chat_date, user_no, user_nickname) FROM '$$PATH$$/3529.dat';

--
-- Data for Name: tb_file; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_file (file_id, file_name, file_location, file_size, file_regdate, file_state, prdt_id, user_no, isbannerimg) FROM stdin;
\.
COPY public.tb_file (file_id, file_name, file_location, file_size, file_regdate, file_state, prdt_id, user_no, isbannerimg) FROM '$$PATH$$/3531.dat';

--
-- Data for Name: tb_image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_image (img_no, img_type, img_path, img_nm) FROM stdin;
\.
COPY public.tb_image (img_no, img_type, img_path, img_nm) FROM '$$PATH$$/3532.dat';

--
-- Data for Name: tb_inquiry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_inquiry (inquiry_no, inquiry_state, writer, inquiry_title, inquiry_context, inquiry_private, inquiry_regdate) FROM stdin;
\.
COPY public.tb_inquiry (inquiry_no, inquiry_state, writer, inquiry_title, inquiry_context, inquiry_private, inquiry_regdate) FROM '$$PATH$$/3534.dat';

--
-- Data for Name: tb_inquiry_ans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_inquiry_ans (ans_no, ans_state, admin_id, ans_context, ans_regdate, inquiry_no) FROM stdin;
\.
COPY public.tb_inquiry_ans (ans_no, ans_state, admin_id, ans_context, ans_regdate, inquiry_no) FROM '$$PATH$$/3536.dat';

--
-- Data for Name: tb_leave; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_leave (leave_no, leave_category, leave_reason, user_no) FROM stdin;
\.
COPY public.tb_leave (leave_no, leave_category, leave_reason, user_no) FROM '$$PATH$$/3538.dat';

--
-- Data for Name: tb_like; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_like (like_id, like_regdate, user_id, prdt_id) FROM stdin;
\.
COPY public.tb_like (like_id, like_regdate, user_id, prdt_id) FROM '$$PATH$$/3553.dat';

--
-- Data for Name: tb_mypage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_mypage (user_no, prdt_id, product_like) FROM stdin;
\.
COPY public.tb_mypage (user_no, prdt_id, product_like) FROM '$$PATH$$/3539.dat';

--
-- Data for Name: tb_notice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_notice (notice_id, writer, notice_title, notice_context, notice_regdate, notice_category, notice_private, view_cnt) FROM stdin;
\.
COPY public.tb_notice (notice_id, writer, notice_title, notice_context, notice_regdate, notice_category, notice_private, view_cnt) FROM '$$PATH$$/3541.dat';

--
-- Data for Name: tb_payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_payment (pay_no, pay_time, user_no, prdt_id, reward_id, reward_user_cnt, pay_total, delivery_reciever, delivery_phone, delivery_postcode, delivery_address, delivery_addressdetail, delivery_memo) FROM stdin;
\.
COPY public.tb_payment (pay_no, pay_time, user_no, prdt_id, reward_id, reward_user_cnt, pay_total, delivery_reciever, delivery_phone, delivery_postcode, delivery_address, delivery_addressdetail, delivery_memo) FROM '$$PATH$$/3543.dat';

--
-- Data for Name: tb_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_product (prdt_id, prdt_name, prdt_desc, prdt_desc_detail, prdt_regdate, prdt_opendate, prdt_enddate, prdt_goal, prdt_currenttotal, prdt_open, prdt_desc_policy, writer, prdt_genre, prdt_thumbnail, prdt_img, prdt_buyercnt, user_id, update_regdate) FROM stdin;
\.
COPY public.tb_product (prdt_id, prdt_name, prdt_desc, prdt_desc_detail, prdt_regdate, prdt_opendate, prdt_enddate, prdt_goal, prdt_currenttotal, prdt_open, prdt_desc_policy, writer, prdt_genre, prdt_thumbnail, prdt_img, prdt_buyercnt, user_id, update_regdate) FROM '$$PATH$$/3521.dat';

--
-- Data for Name: tb_reply; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_reply (rno, prdt_id, chat_no, chat_writer, chat_context, chat_date, user_no, user_nickname) FROM stdin;
\.
COPY public.tb_reply (rno, prdt_id, chat_no, chat_writer, chat_context, chat_date, user_no, user_nickname) FROM '$$PATH$$/3557.dat';

--
-- Data for Name: tb_reward; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_reward (reward_id, reward_name, reward_desc, reward_price, reward_stock, reward_category, prdt_id) FROM stdin;
\.
COPY public.tb_reward (reward_id, reward_name, reward_desc, reward_price, reward_stock, reward_category, prdt_id) FROM '$$PATH$$/3545.dat';

--
-- Data for Name: tb_setting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_setting (setting_no, msg_agree, update_agree, favor_agree, marketing_agree, user_introduce, user_no) FROM stdin;
\.
COPY public.tb_setting (setting_no, msg_agree, update_agree, favor_agree, marketing_agree, user_introduce, user_no) FROM '$$PATH$$/3547.dat';

--
-- Data for Name: tb_update; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_update (update_id, update_regdate, update_title, update_desc, user_id, prdt_id) FROM stdin;
\.
COPY public.tb_update (update_id, update_regdate, update_title, update_desc, user_id, prdt_id) FROM '$$PATH$$/3549.dat';

--
-- Data for Name: tb_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tb_user (user_no, user_id, user_pwd, user_name, user_phone, user_regdate, user_activate, user_role, user_profile, user_point, user_nickname) FROM stdin;
\.
COPY public.tb_user (user_no, user_id, user_pwd, user_name, user_phone, user_regdate, user_activate, user_role, user_profile, user_point, user_nickname) FROM '$$PATH$$/3523.dat';

--
-- Name: tb_address_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_address_address_id_seq', 11, true);


--
-- Name: tb_agreement_agree_no_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_agreement_agree_no_seq', 19, true);


--
-- Name: tb_alarm_alarm_no_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_alarm_alarm_no_seq', 14, true);


--
-- Name: tb_bannerfile_bannerfile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_bannerfile_bannerfile_id_seq', 4, true);


--
-- Name: tb_chat_service_chat_no_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_chat_service_chat_no_seq', 4, true);


--
-- Name: tb_file_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_file_file_id_seq', 153, true);


--
-- Name: tb_inquiry_ans_ans_no_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_inquiry_ans_ans_no_seq', 1, true);


--
-- Name: tb_inquiry_inquiry_no_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_inquiry_inquiry_no_seq', 1, true);


--
-- Name: tb_leave_leave_no_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_leave_leave_no_seq', 3, true);


--
-- Name: tb_like_like_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_like_like_id_seq', 18, true);


--
-- Name: tb_notice_notice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_notice_notice_id_seq', 4, true);


--
-- Name: tb_payment_pay_no_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_payment_pay_no_seq', 318, true);


--
-- Name: tb_product_prdt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_product_prdt_id_seq', 234, true);


--
-- Name: tb_reply_rno_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_reply_rno_seq', 1, false);


--
-- Name: tb_reward_reward_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_reward_reward_id_seq', 457, true);


--
-- Name: tb_setting_setting_no_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_setting_setting_no_seq', 19, true);


--
-- Name: tb_update_update_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_update_update_id_seq', 238, true);


--
-- Name: tb_user_user_no_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_user_user_no_seq', 21, true);


--
-- Name: tb_user constraintname; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_user
    ADD CONSTRAINT constraintname UNIQUE (user_id);


--
-- Name: tb_address tb_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_address
    ADD CONSTRAINT tb_address_pkey PRIMARY KEY (address_id);


--
-- Name: tb_agreement tb_agreement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_agreement
    ADD CONSTRAINT tb_agreement_pkey PRIMARY KEY (agree_no);


--
-- Name: tb_alarm tb_alarm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_alarm
    ADD CONSTRAINT tb_alarm_pkey PRIMARY KEY (alarm_no);


--
-- Name: tb_bannerfile tb_bannerfile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_bannerfile
    ADD CONSTRAINT tb_bannerfile_pkey PRIMARY KEY (bannerfile_id);


--
-- Name: tb_chat_service tb_chat_service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_chat_service
    ADD CONSTRAINT tb_chat_service_pkey PRIMARY KEY (chat_no);


--
-- Name: tb_file tb_file_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_file
    ADD CONSTRAINT tb_file_pkey PRIMARY KEY (file_id);


--
-- Name: tb_image tb_image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_image
    ADD CONSTRAINT tb_image_pkey PRIMARY KEY (img_no);


--
-- Name: tb_inquiry_ans tb_inquiry_ans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_inquiry_ans
    ADD CONSTRAINT tb_inquiry_ans_pkey PRIMARY KEY (ans_no);


--
-- Name: tb_inquiry tb_inquiry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_inquiry
    ADD CONSTRAINT tb_inquiry_pkey PRIMARY KEY (inquiry_no);


--
-- Name: tb_leave tb_leave_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_leave
    ADD CONSTRAINT tb_leave_pkey PRIMARY KEY (leave_no);


--
-- Name: tb_like tb_like_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_like
    ADD CONSTRAINT tb_like_pk PRIMARY KEY (like_id);


--
-- Name: tb_mypage tb_mypage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_mypage
    ADD CONSTRAINT tb_mypage_pkey PRIMARY KEY (user_no);


--
-- Name: tb_notice tb_notice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_notice
    ADD CONSTRAINT tb_notice_pkey PRIMARY KEY (notice_id);


--
-- Name: tb_payment tb_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_payment
    ADD CONSTRAINT tb_payment_pkey PRIMARY KEY (pay_no);


--
-- Name: tb_product tb_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_product
    ADD CONSTRAINT tb_product_pkey PRIMARY KEY (prdt_id);


--
-- Name: tb_reply tb_reply_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_reply
    ADD CONSTRAINT tb_reply_pkey PRIMARY KEY (rno);


--
-- Name: tb_reward tb_reward_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_reward
    ADD CONSTRAINT tb_reward_pkey PRIMARY KEY (reward_id);


--
-- Name: tb_setting tb_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_setting
    ADD CONSTRAINT tb_setting_pkey PRIMARY KEY (setting_no);


--
-- Name: tb_update tb_update_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_update
    ADD CONSTRAINT tb_update_pkey PRIMARY KEY (update_id);


--
-- Name: tb_user tb_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_user
    ADD CONSTRAINT tb_user_pkey PRIMARY KEY (user_no);


--
-- Name: tb_chat_service prdt_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_chat_service
    ADD CONSTRAINT prdt_id FOREIGN KEY (prdt_id) REFERENCES public.tb_product(prdt_id) ON DELETE CASCADE;


--
-- Name: tb_file prdt_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_file
    ADD CONSTRAINT prdt_id FOREIGN KEY (prdt_id) REFERENCES public.tb_product(prdt_id) ON DELETE CASCADE;


--
-- Name: tb_mypage prdt_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_mypage
    ADD CONSTRAINT prdt_id FOREIGN KEY (prdt_id) REFERENCES public.tb_product(prdt_id) ON DELETE CASCADE;


--
-- Name: tb_payment prdt_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_payment
    ADD CONSTRAINT prdt_id FOREIGN KEY (prdt_id) REFERENCES public.tb_product(prdt_id) ON DELETE CASCADE;


--
-- Name: tb_reward prdt_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_reward
    ADD CONSTRAINT prdt_id FOREIGN KEY (prdt_id) REFERENCES public.tb_product(prdt_id) ON DELETE CASCADE;


--
-- Name: tb_update prdt_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_update
    ADD CONSTRAINT prdt_id FOREIGN KEY (prdt_id) REFERENCES public.tb_product(prdt_id) ON DELETE CASCADE;


--
-- Name: tb_address tb_address_user_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_address
    ADD CONSTRAINT tb_address_user_no_fkey FOREIGN KEY (user_no) REFERENCES public.tb_user(user_no) ON DELETE CASCADE;


--
-- Name: tb_agreement tb_agreement_user_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_agreement
    ADD CONSTRAINT tb_agreement_user_no_fkey FOREIGN KEY (user_no) REFERENCES public.tb_user(user_no) ON DELETE CASCADE;


--
-- Name: tb_alarm tb_alarm_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_alarm
    ADD CONSTRAINT tb_alarm_fk FOREIGN KEY (like_id) REFERENCES public.tb_like(like_id) ON DELETE CASCADE;


--
-- Name: tb_chat_service tb_chat_service_prdt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_chat_service
    ADD CONSTRAINT tb_chat_service_prdt_id_fkey FOREIGN KEY (prdt_id) REFERENCES public.tb_product(prdt_id) ON DELETE CASCADE;


--
-- Name: tb_chat_service tb_chat_service_user_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_chat_service
    ADD CONSTRAINT tb_chat_service_user_no_fkey FOREIGN KEY (user_no) REFERENCES public.tb_user(user_no) ON DELETE CASCADE;


--
-- Name: tb_inquiry_ans tb_inquiry_ans_inquiry_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_inquiry_ans
    ADD CONSTRAINT tb_inquiry_ans_inquiry_no_fkey FOREIGN KEY (inquiry_no) REFERENCES public.tb_inquiry(inquiry_no) ON DELETE CASCADE;


--
-- Name: tb_leave tb_leave_user_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_leave
    ADD CONSTRAINT tb_leave_user_no_fkey FOREIGN KEY (user_no) REFERENCES public.tb_user(user_no) ON DELETE CASCADE;


--
-- Name: tb_like tb_like_prdt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_like
    ADD CONSTRAINT tb_like_prdt_id_fkey FOREIGN KEY (prdt_id) REFERENCES public.tb_product(prdt_id) ON DELETE CASCADE;


--
-- Name: tb_like tb_like_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_like
    ADD CONSTRAINT tb_like_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.tb_user(user_id) ON DELETE CASCADE;


--
-- Name: tb_mypage tb_mypage_user_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_mypage
    ADD CONSTRAINT tb_mypage_user_no_fkey FOREIGN KEY (user_no) REFERENCES public.tb_user(user_no) ON DELETE CASCADE;


--
-- Name: tb_product tb_product_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_product
    ADD CONSTRAINT tb_product_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.tb_user(user_id) ON DELETE CASCADE;


--
-- Name: tb_reply tb_reply_chat_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_reply
    ADD CONSTRAINT tb_reply_chat_no_fkey FOREIGN KEY (chat_no) REFERENCES public.tb_chat_service(chat_no) ON DELETE CASCADE;


--
-- Name: tb_reply tb_reply_prdt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_reply
    ADD CONSTRAINT tb_reply_prdt_id_fkey FOREIGN KEY (prdt_id) REFERENCES public.tb_product(prdt_id) ON DELETE CASCADE;


--
-- Name: tb_reply tb_reply_user_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_reply
    ADD CONSTRAINT tb_reply_user_no_fkey FOREIGN KEY (user_no) REFERENCES public.tb_user(user_no) ON DELETE CASCADE;


--
-- Name: tb_setting tb_setting_user_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_setting
    ADD CONSTRAINT tb_setting_user_no_fkey FOREIGN KEY (user_no) REFERENCES public.tb_user(user_no) ON DELETE CASCADE;


--
-- Name: tb_notice user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_notice
    ADD CONSTRAINT user_id FOREIGN KEY (writer) REFERENCES public.tb_user(user_id) ON DELETE CASCADE;


--
-- Name: tb_update user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_update
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public.tb_user(user_id) ON DELETE CASCADE;


--
-- Name: tb_payment user_no; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_payment
    ADD CONSTRAINT user_no FOREIGN KEY (user_no) REFERENCES public.tb_user(user_no) ON DELETE CASCADE;


--
-- Name: tb_file user_no; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_file
    ADD CONSTRAINT user_no FOREIGN KEY (user_no) REFERENCES public.tb_user(user_no) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

