package com.app.model;

public class Payment {
	
	private int u_id;
		private int o_id;
		private double amount;
		private String name;
		private String email;

		public Payment () {
		}

		public Payment(int u_id, int o_id, double amount,String name , String email) {
			this. u_id =  u_id;
			this.o_id = o_id;
			this.amount = amount;
			this.name= name;
			this.email=email;
			
			
		}

		public int getUId() {
			return u_id;
		}

		public void setUId(int u_id) {
			this.u_id = u_id;
		}

		public int getOId() {
			return o_id;
		}

		public void setOId(int o_id) {
			this.o_id = o_id;
		}
		public String getName() {
			return name;
		}

		public void setName(String  name) {
			this.name = name;

		} 
		public void setEmail(String email) {
			this.email = email;
		}
		public String getEmail() {
			return email;
		}

		public double getAmount() {
			return amount;
		}

		public void setAmount(double amount) {
			this.amount = amount;
		}

		@Override
		public String toString() {
			return "User [u_id=" +u_id + ", o_id=" + o_id +", name="+name+", email="+email+", amount=" + amount + "]";
		}
	}


