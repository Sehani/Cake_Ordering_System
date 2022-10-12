package com.app.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.app.model.Payment;


public class PaymentDao {
	int x = 0;
	private Connection con;

	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	public PaymentDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean insertPayment(Payment model) {
        boolean result = false;
        try {
            query = "insert into payment (pay_id,u_id,o_id,amount,name,email) values(?,?,?,?,?,?)";
            pst = this.con.prepareStatement(query);
            pst.setInt(1,x);
            pst.setInt(2, model.getUId());
            pst.setInt(3, model.getOId());
            pst.setDouble(4, model.getAmount());
            pst.setString(5, model.getName());
            pst.setString(6, model.getEmail());
            
            pst.executeUpdate();
            result = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }
	
}
