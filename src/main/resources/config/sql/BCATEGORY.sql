drop table board_category;

create table board_category(
    bcg_code number(8) primary key,
    bcg_name varchar(40)
);
insert into board_category(bcg_code, bcg_name) values(1,'ȸ������');
insert into board_category(bcg_code, bcg_name) values(2,'�ֹ�/����');
insert into board_category(bcg_code, bcg_name) values(3,'���/ȯ��');
insert into board_category(bcg_code, bcg_name) values(4,'��۰���');
insert into board_category(bcg_code, bcg_name) values(5,'�ý��ۿ���');
insert into board_category(bcg_code, bcg_name) values(6,'��Ÿ����');
select * from board_category;

