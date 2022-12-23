drop table spring_board;

create table spring_board(
   num number(8) primary key, --�۹�ȣ
   name varchar2(30) not null, --�ۼ���
   passwd varchar2(20) not null, --�ۺ�й�ȣ
   subject varchar2(200) not null,--������
   content varchar2(2000), --�۳���
   wdate date default sysdate, --�ۼ���
   readnum number(8) default 0, --��ȸ��
   filename varchar2(500),--÷�����ϸ�[uuid_a.txt] ==> ������ ���ϸ�(���� ���ε�� ���ϸ�)
   originFilename varchar2(500),--�������ϸ� [a.txt]==> ���� ���ϸ�
   filesize number(8),--÷������ ũ��
   refer number(8), --�� �׷��ȣ[�亯�� �Խ����϶� �ʿ��� �÷�]
   lev number(8), --�亯 ����[�亯�� �Խ����϶� �ʿ��� �÷�]
   sunbun number(8) -- ���� �� �׷� ���� ���� ���Ľ� �ʿ��� �÷� [�亯�� �Խ����϶� �ʿ��� �÷�]
);

drop sequence spring_board_seq;

create sequence spring_board_seq
start with 1
increment by 1
nocache;

