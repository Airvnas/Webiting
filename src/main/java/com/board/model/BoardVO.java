package com.board.model;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private String mode;  

	private String bcg_code;//�Խ��� ���Ǳ� �ڵ��ȣ
	private String bcg_name;//�Խ��� ���Ǳ� �ڵ� �̸�
	
	private int num;//�����Խ��� �۹�ȣ
	private String name;//�Խ��� ���̸�
	private String passwd;//�Խ��� ��й�ȣ
	private String subject;//�Խ��� ����
	private String content;//�Խ��� ����
	
	private Date wdate;//�ۼ��� ��¥(���� �ð�)
	private int readnum;//��ȸ��
	
	private String filename;//���� ��ο� �ߺ� ������ ���� ���� �����̸�(������+���Ͽ����̸�)
	private String originFilename;//���� ���� �̸�
	private long filesize;//���� ������
	private String old_filename;//�����Ͽ� ���� �߰��� ���� ���� �̸��� ������ ����
	
	
	private int refer;//�Խ��� �θ��ȣ(�Խ��� ����Ʈ ���Ľ� �����̵�)
	private int lev;//�Խ��� �θ��ȣ�� ���� �亯��ȣ(�Խ��� ����Ʈ ���Ľ� �����̵�)
	private int adminSunbun;//�������� ����
	
	
	
	private String secret;//��б� ����
	
}