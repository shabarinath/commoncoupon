package com.commoncoupon.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * @author SHABARINATH 30-Apr-2016 10:55:53 am 2016
 */

@SuppressWarnings("serial")
@Entity
@Table(name = "coupons_catalogue")
public class CouponsCatalogue extends Persistent {

	@Column(name = "name")
	private String name;

	@Column(name = "description")
	private String description;
	
	@Column(name = "image_b_url")
	private String imageUrlBig;
	
	@Column(name = "image_m_url")
	private String imageUrlMedium;
	
	@Column(name = "image_s_url")
	private String imageUrlSmall;

	@Transient
	private long amount;

	public String getName() {
		return name;
	}

	public String getImageUrlBig() {
		return imageUrlBig;
	}

	public String getImageUrlMedium() {
		return imageUrlMedium;
	}

	public String getImageUrlSmall() {
		return imageUrlSmall;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setImageUrlBig(String imageUrlBig) {
		this.imageUrlBig = imageUrlBig;
	}

	public void setImageUrlMedium(String imageUrlMedium) {
		this.imageUrlMedium = imageUrlMedium;
	}

	public void setImageUrlSmall(String imageUrlSmall) {
		this.imageUrlSmall = imageUrlSmall;
	}

	public long getAmount() {
		return amount;
	}

	public void setAmount(long amount) {
		this.amount = amount;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
