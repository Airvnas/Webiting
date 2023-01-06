package com.product.model;

import java.sql.Date;

import lombok.Data;

@Data
public class OrderedDetailVO {
	
	private int orderedDetail_no;//primary key
	//������ ��ǰ ����(���ι� ȸ��) ���� 
	private String orderedDetail_from_tel="1000-1000";
	private String ordered_from_adr="���� ������";
	private String ordered_from_post="39311";	
	private String ordered_delivnum;
	
	
	//��ۻ���
	private int ordered_delivstateNum_fk;
	private String orderedDetail_delivstate;
	
	
	
	//�ֹ��� ��������(OrderedVO_fk)	
	private int ordered_no_fk;//Ordered_fk
	private String ordered_to_tel;
	private String ordered_to_email;
	private String ordered_to_adr;
	private String ordered_to_post;	
	private Date ordered_date;
	private int ordered_orderprice;
	
	
	//�Ƹ� ��ٱ��� vo�� ������ ������ ������.
	//�ֹ��ڰ� �ֹ��� ��ǰ�� ����(īƮ vo ó�� �ֹ� ���vo ���� �ʿ亯��)
	private int idx_fk;
	private String userid;
	private String name;
	
	//productvo
	private int pnum_fk;//(productVO_fk)
	private String pname;
	private int oqty;
	private int price;
	private int saleprice;
	private String pcompany;
	private int totalPrice;
	private int totalPoint;	
	//�߰���
	private String onum;//�ֹ���ȣ-----------	
	
	/**�������� ��ȯ�ϴ� �޼���*/
	public int getPercent() {
		//   (����-�ǸŰ�)*100/����
		int percent=(price-saleprice)*100/price;
		return percent;
	}
	
	
	
	
	

	
}
