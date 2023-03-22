package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
	   
	   public String cartSearchItem(String member_num, String item_num) 
	   {
		   String cart_num = "";
		   Connection conn=db.getConnection();
		   PreparedStatement pstmt=null;
		   ResultSet rs = null;
		   
		   String sql = "select i.item_num,c.cart_num\r\n"
		   		+ "from item i,cart c,member m\r\n"
		   		+ "where c.item_num=i.item_num and c.member_num=m.member_num and m.member_num=? and i.item_num=?";
		   
		   try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_num);
			pstmt.setString(2, item_num);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				cart_num = (rs.getString("cart_num"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		   return cart_num;
	   }
	   
	   public void cartPlus(CartDto dto)
	   {
		   Connection conn=db.getConnection();
		   PreparedStatement pstmt=null;
		   
		   String sql = "update cart set cart_cnt=? where cart_num = ?";
		   
		   try {
			 pstmt = conn.prepareStatement(sql);
			
			 pstmt.setInt(1, dto.getCart_cnt());
			 pstmt.setString(2, dto.getCart_num());
	        
	         
	         pstmt.execute();
	         
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	  }
	   
	  public CartDto getCart(String cart_num)
	  {
		   CartDto dto = new CartDto();
		   Connection conn=db.getConnection();
		   PreparedStatement pstmt=null;
		   ResultSet rs = null;
		   
		   String sql = "select * from cart where cart_num=?";
		   try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cart_num);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				dto.setCart_num(cart_num);
				dto.setCart_cnt(rs.getInt("cart_cnt"));
				dto.setMember_num(rs.getString("member_num"));
				dto.setItem_num(rs.getString("item_num"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	  }
}
