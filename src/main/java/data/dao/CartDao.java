package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import data.dto.CartDto;
import mysql.db.DbConnect;

public class CartDao {
	DbConnect db=new DbConnect();
	
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
	
	//getAllData-유저에 따라 해당 장바구니에 담긴 상품 정보 등을 출력
	public List<HashMap<String, String>> getAllUserCart(String member_num)
	{
		List<HashMap<String, String>> list=new ArrayList<>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select m.member_num,c.cart_num,i.item_num,i.item_name,i.item_package_type,i.item_img,i.item_price,c.cart_cnt "
				+ "from cart c,item i,member m "
				+ "where c.member_num=? and m.member_num=c.member_num and i.item_num=c.item_num "
				+ "order by cart_num";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, member_num);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				HashMap<String, String> map=new HashMap<>();
				
				map.put("member_num", rs.getString("member_num"));
				map.put("cart_num", rs.getString("cart_num"));
				map.put("item_num", rs.getString("item_num"));
				map.put("item_name", rs.getString("item_name"));
				map.put("item_package_type", rs.getString("item_package_type"));
				map.put("item_img", rs.getString("item_img"));
				map.put("item_price", rs.getString("item_price"));
				map.put("cart_cnt", rs.getString("cart_cnt"));
				
				list.add(map);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}

	//getData-해당 카트항목에 해당하는 item_num을 가져오기(상품 상세페이지로 이동)
	public String getItemNum(String cart_num)
	{
		String item_num="";
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from cart where cart_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, cart_num);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				item_num=rs.getString("item_num");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return item_num;
	}
	
	//카드 수량 수정(update)
	public void updateCartCnt(String cart_num,int cart_cnt)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update cart set cart_cnt=? where cart_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, cart_cnt);
			pstmt.setString(2, cart_num);
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//delete
	public void deleteCart(String cart_num)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from cart where cart_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, cart_num);
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//selectAll
	public CartDto getCart(String cart_num) {
		CartDto dto=new CartDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from cart where cart_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, cart_num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setCart_num(rs.getString("cart_num"));
				dto.setItem_num(rs.getString("item_num"));
				dto.setCart_cnt(rs.getInt("cart_cnt"));
				dto.setMember_num(rs.getString("member_num"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return dto;
	}

}















