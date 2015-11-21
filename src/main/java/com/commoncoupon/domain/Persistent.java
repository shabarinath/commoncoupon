package com.commoncoupon.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

/**
 * @author SHABARINATH
 * 21-Nov-2015 3:02:15 pm 2015 
 */

@MappedSuperclass
public class Persistent implements Serializable {
	
	private static final long serialVersionUID = 8416378830324518040L;
	
	@Id 
    @GeneratedValue
	@Column(name="id", nullable=false)
	private long id;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
}
