create table tpStudent(
    st_num      number          not null
    ,st_id      varchar2(20)    primary key  
    ,st_pw      varchar2(30)    not null
    ,st_gender  CHAR            not null
    ,st_age     number          not null
    ,st_phone   varchar2(50)    not null
    ,st_loc     varchar2(100)   not null
    ,st_lan1    varchar2(20)    not null
    ,st_lan2    varchar2(20)
    ,st_lan3    varchar2(20)
    ,st_avg     number(2,1)
);
create sequence st_num_seq;

create table tpTeacher(
    tc_num          number          not null
    ,tc_id          varchar2(20)    primary key
    ,tc_pw          varchar2(30)    not null
    ,tc_gender      CHAR            not null
    ,tc_age         number          not null
    ,tc_teachLan    varchar2(10)    not null
    ,tc_lan1        varchar2(20)    not null
    ,tc_lan2        varchar2(20)
    ,tc_lan3        varchar2(20)
    ,tc_phone       varchar2(50)    not null
    ,tc_loc         varchar2(100)   not null
    ,tc_pic         varchar2(30)    default 'resources/images/default.png' not null
    ,tc_intro       varchar2(300)   
    ,tc_price       number          not null
    ,tc_req         varchar2(500)   
    ,tc_avg         number(2,1)
);
create sequence tc_num_seq;

create table tpReview(
    rv_num          number          primary key
    ,rv_target      varchar2(20)    not null
    ,rv_sender      varchar2(20)    not null
    ,rv_star        number          not null
    ,rv_review      varchar2(300)   
);
create sequence rv_num_seq;

create table tpSugang(
    sg_num          number          primary key
    ,sg_teacher     varchar2(20)    
    ,sg_student     varchar2(20)    
    ,sg_date        date            default sysdate
    ,sg_accept      number(1)       default 0 not null
);
create sequence sg_num_seq;

CREATE TABLE CMT (
   cmt_id              NUMBER          PRIMARY KEY     -- 댓글의 글번호
   ,subject        VARCHAR2(100)                   -- 댓글 제목
   ,content        CLOB                            -- 댓글 내용
       ,password       VARCHAR2(300)   NOT NULL
       ,writer         VARCHAR2(100)   constraint writer_fk references tpStudent(st_id) on delete cascade -- 댓글 작성자
       ,target         VARCHAR2(100)   constraint target_fk references tpTeacher(tc_id) on delete cascade -- 댓글의대상이되는아이디
   ,hits           NUMBER          DEFAULT 0
   ,indate         DATE            DEFAULT SYSDATE -- 댓글 등록일 
);

CREATE TABLE CMT_REPLY (
   reply_id             NUMBER(10)      PRIMARY KEY
      ,cmt_id              NUMBER(10)      constraint cmt_reply_fk references CMT(cmt_id) on delete cascade
      ,parent_id           NUMBER(10)
      ,depth               NUMBER(10)
      ,reply_content       CLOB
      ,reply_writer        VARCHAR2(100)   NOT NULL
      ,reply_password      VARCHAR2(300)   NOT NULL
      ,indate              DATE            DEFAULT SYSDATE
 );

create sequence cmt_seq start with 1 increment BY 1 maxvalue 1000000;
create sequence cmt_reply_seq start with 1 increment BY 1 maxvalue 1000000;

insert into tpTeacher(
tc_num
,tc_id
,tc_pw
,tc_gender
,tc_age
,tc_teachLan
,tc_lan1
,tc_lan2
,tc_lan3
,tc_phone
,tc_loc
,tc_intro
,tc_price
)
values(tcSeq.nextval, 'GIWON', '1111', 'm', '28', 'ENG', 'KOR', 'JPN', 'SPN', '010-2544-8742', '이문로 125', 
'테스트입니다', '10000');

commit;
