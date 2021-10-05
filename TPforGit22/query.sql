create table tpTeacher(
    tc_num number not null
    ,tc_id varchar2(20) primary key
    ,tc_pw varchar2(20) not null
    ,tc_gender varchar2(10) not null
    ,tc_age number not null
    ,tc_teachLan varchar2(20) not null
    ,tc_lan1 varchar2(20)
    ,tc_lan2 varchar2(20)
    ,tc_lan3 varchar2(20)
    ,tc_phone varchar2(20) not null
    ,tc_loc varchar2(20) not null
    ,tc_pic varchar2(50)
    ,tc_intro varchar2(500)
    ,tc_price number default 0
    ,tc_req number(1) default 0
    ,tc_avg number default 0
    );
    
create sequence tcSeq;

insert into tpTeacher values(tcSeq.nextval, 'aaaa', '1111', 'male', '1', 'eng', '1', '2', '3', 
'12341234', '삼성동', '', '', 111, 0, 5);
insert into tpTeacher values(tcSeq.nextval, 'bbbb', '1111', 'male', '1', 'eng', '1', '2', '3', 
'12341234', '삼성동', '', '', 111, 0, 5);
insert into tpTeacher values(tcSeq.nextval, 'cccc', '1111', 'male', '1', 'eng', '1', '2', '3', 
'12341234', '역삼동', '', '', 111, 0, 5);
insert into tpTeacher values(tcSeq.nextval, 'dddd', '1111', 'male', '1', 'eng', '1', '2', '3', 
'12341234', '대치동', '', '', 111, 0, 5);
insert into tpTeacher values(tcSeq.nextval, 'eeee', '1111', 'male', '1', 'eng', '1', '2', '3', 
'12341234', '천호동', 'abc.png', '', 111, 0, 5);
insert into tpTeacher values(tcSeq.nextval, 'ffff', '1111', 'male', '1', 'eng', '1', '2', '3', 
'12341234', '압구정동', 'abc.png', 'ㅇㄻㄴㅇㄿㅎㅁㄴㅇ픁츈ㅇㅀㅁㄴㅇㅀㄴㅁㅍㅌㅊ픀ㅌㅊ픂ㄴㅇㄻㄴㅇㄻㄴ', 111, 0, 5);
insert into tpTeacher values(tcSeq.nextval, 'gggg', '1111', 'female', '1', 'eng', '1', '2', '3', 
'12341234', '장지동', 'abc.png', 'ㅇㄻㄴㅇㄿㅎㅁㄴㅇ픁츈ㅇㅀㅁㄴㅇㅀㄴㅁㅍㅌㅊ픀ㅌㅊ픂ㄴㅇㄻㄴㅇㄻㄴ', 111, 0, 5);

insert into tpTeacher values(tcSeq.nextval, 'hhhh', '1111', 'female', '1', 'jap', '1', '2', '3', 
'12341234', '테헤란로 538', 'abc.png', 'ㅇㄻㄴㅇㄿㅎㅁㄴㅇ픁츈ㅇㅀㅁㄴㅇㅀㄴㅁㅍㅌㅊ픀ㅌㅊ픂ㄴㅇㄻㄴㅇㄻㄴ', 111, 0, 5);

commit;