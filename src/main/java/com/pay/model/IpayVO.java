package com.pay.model;

import lombok.Data;

@Data
public class IpayVO {
	//���� �ý������� ���� ������
	
	private int merchant_uid;//�ֹ���ȣ
	private String name;//�̸�
	private int amount;//���� �ѱݾ�
	private String buyer_email;//�̸���
	private String buyer_name;//�̸�
	private String buyer_tel;//����ó
	private String buyer_addr;//�ּ�
	private String buyer_postcode;//�����ȣ
	
}
