package com.pay.model;

import lombok.Data;

@Data
public class kakaoPayVO {
	String partner_order_id;//�ֹ���ȣ
	String partner_user_id;//ȸ�� ���̵�
	String item_name;//�� ��ǰ �̸�(����: ���� �� 10��)
	int quantity;//��ǰ ����
	int total_amount;//��ǰ�Ѿ�
	int tax_free_amount;//��ǰ �����
	String approval_url;//���� ������ url
	String cancel_url;//���� ��ҽ�url
	String fail_url;//���� ���н� url
}
