package com.common.domain;

import java.io.Serializable;
import java.util.Date;

public class ProductDTO implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private String productId;
	private String productName;
	private int price;
	private int pqty;
	private String pcontents;
	private Date pindate;
	private Date updateDate;
	
	public ProductDTO() {
		// TODO Auto-generated constructor stub
	}

	public ProductDTO(String productId, String pName, int price, int pqty, String pcontents,
			Date pindate, Date updateDate) {
		super();
		this.productId = productId;
		this.productName = pName;
		this.price = price;
		this.pqty = pqty;
		this.pcontents = pcontents;
		this.pindate = pindate;
		this.updateDate = updateDate;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPqty() {
		return pqty;
	}

	public void setPqty(int pqty) {
		this.pqty = pqty;
	}

	public String getPContents() {
		return pcontents;
	}

	public void setPContents(String pcontents) {
		this.pcontents = pcontents;
	}

	public Date getPIndate() {
		return pindate;
	}

	public void setPIndate(Date pindate) {
		this.pindate = pindate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((productId == null) ? 0 : productId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ProductDTO other = (ProductDTO) obj;
		if (productId == null) {
			if (other.productId != null)
				return false;
		} else if (!productId.equals(other.productId))
			return false;
		return true;
	}
	
	

}
