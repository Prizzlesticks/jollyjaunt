package com.mpjr.jollyjaunt;

import java.util.List;
//class created to access classification objects from ticketmaster API
public class Attractions {
	List<Classifications> classifications;

	public List<Classifications> getClassifications() {
		return classifications;
	}

	public void setClassifications(List<Classifications> classifications) {
		this.classifications = classifications;
	}
}
