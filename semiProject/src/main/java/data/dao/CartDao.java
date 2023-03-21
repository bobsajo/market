package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import data.dto.CartDto;
import mysql.db.DbConnect;

public class CartDao {
	DbConnect db = new DbConnect();
	
	//insert 장바구니 담기
	   public void insertCart(CartDto dto)
	   {
	      Connection conn=db.getConnection();
	      PreparedStatement pstmt=null;
	      
	      String sql="insert into cart values(null,?,?,?)";
	      
	      try {
	         pstmt=conn.prepareStatement(sql);
	         
	         pstmt.setString(1, dto.getMember_num());
	         pstmt.setString(2, dto.getItem_num());
	         pstmt.setInt(3, dto.getCart_cnt());
	         
	         pstmt.execute();
	         
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally {
	         db.dbClose(pstmt, conn);
	      }
	   }
}
