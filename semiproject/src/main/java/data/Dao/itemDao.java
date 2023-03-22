package data.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Vector;

import data.Dto.CartDto;
import data.Dto.itemDto;
import mysql.db.dbConnect;

public class itemDao {

	
   dbConnect db=new dbConnect();
   
   //insert
   public void insertitem(itemDto dto)
   {
	   Connection conn=db.getConnection();
	   PreparedStatement pstmt=null;
	   
	   String sql="insert into item values(null,?,?,?,?,?,?,?,?,?,?,?,?,?)";

	   
	   try {
		pstmt=conn.prepareStatement(sql);
		
		pstmt.setString(1, dto.getItem_name());
		pstmt.setInt(2, dto.getItem_price());
		pstmt.setString(3, dto.getItem_img());
		pstmt.setString(4, dto.getItem_sub_title());
		pstmt.setString(6, dto.getItem_seller());
		pstmt.setString(7, dto.getItem_package_type());
		pstmt.setString(8, dto.getItem_package_detail());
		pstmt.setString(9, dto.getItem_sell_unit());
		pstmt.setString(10, dto.getItem_weight());
		pstmt.setString(11, dto.getItem_origin());
		pstmt.setString(12, dto.getItem_warning());
		pstmt.setString(13, dto.getItem_detail());
		pstmt.setString(14, dto.getItem_category());
		
		pstmt.execute();
		
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		db.dbClose(pstmt, conn);
	}
	   
   }
	
   
 //전체목록
 	public List<itemDto> getAllItem()
 	{
 		List<itemDto> list=new Vector<>();
 		
 		Connection conn=db.getConnection();
 		PreparedStatement pstmt=null;
 		ResultSet rs=null;
 		
 		String sql="select * from item order by item_num desc";
 		
 		try {
 			pstmt=conn.prepareStatement(sql);
 			rs=pstmt.executeQuery();
 			
 			while(rs.next())
 			{
 				itemDto dto=new itemDto();
 				dto.setItem_num(rs.getString("item_num"));
 				dto.setItem_name(rs.getString("item_name"));
 				dto.setItem_price(rs.getInt("item_price"));
 				dto.setItem_img(rs.getString("item_img"));
 				dto.setItem_sub_title(rs.getString("item_sub_title"));
 				dto.setItem_seller(rs.getString("item_seller"));
 				dto.setItem_package_type(rs.getString("item_package_type"));
 				dto.setItem_package_detail(rs.getString("item_package_detail"));
 				dto.setItem_sell_unit(rs.getString("item_sell_unit"));
 				dto.setItem_weight(rs.getString("item_weight"));
 				dto.setItem_origin(rs.getString("item_origin"));
 				dto.setItem_allergy(rs.getString("item_allergy"));
 				dto.setItem_warning(rs.getString("item_warning"));
 				dto.setItem_detail(rs.getString("item_detail"));
 				dto.setItem_category(rs.getString("item_category"));

 				list.add(dto);
 				
 			}
 		} catch (SQLException e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		}finally {
 			
 		}
 		
 		return list;
 	}
   
 	//item_num의 dto얻기
 		public itemDto getItemData(String item_num)
 		{
 			itemDto dto=new itemDto();
 			
 			Connection conn=db.getConnection();
 			PreparedStatement pstmt=null;
 			ResultSet rs=null;
 			
 			String sql="select * from item where item_num=?";
 			
 			try {
 				pstmt=conn.prepareStatement(sql);
 				pstmt.setString(1, item_num);
 				
 				rs=pstmt.executeQuery();
 				
 				if(rs.next())
 				{
 					dto.setItem_num(rs.getString("item_num"));
 	 				dto.setItem_name(rs.getString("item_name"));
 	 				dto.setItem_price(rs.getInt("item_price"));
 	 				dto.setItem_img(rs.getString("item_img"));
 	 				dto.setItem_sub_title(rs.getString("item_sub_title"));
 	 				dto.setItem_seller(rs.getString("item_seller"));
 	 				dto.setItem_package_type(rs.getString("item_package_type"));
 	 				dto.setItem_package_detail(rs.getString("item_package_detail"));
 	 				dto.setItem_sell_unit(rs.getString("item_sell_unit"));
 	 				dto.setItem_weight(rs.getString("item_weight"));
 	 				dto.setItem_origin(rs.getString("item_origin"));
 	 				dto.setItem_allergy(rs.getString("item_allergy"));
 	 				dto.setItem_warning(rs.getString("item_warning"));
 	 				dto.setItem_detail(rs.getString("item_detail"));
 	 				dto.setItem_category(rs.getString("item_category"));
 				}
 			} catch (SQLException e) {
 				// TODO Auto-generated catch block
 				e.printStackTrace();
 			}finally {
 				db.dbClose(rs, pstmt, conn);
 			}
 			
 			
 			return dto;
 			
 		}
 		
 		//장바구니 추가
 		public void insertCart(CartDto dto)
 		{
 			Connection conn=db.getConnection();
 			PreparedStatement pstmt=null;
 			
 			String sql="insert into cart values(null,?,?,?,now())";
 			
 			try {
 				pstmt=conn.prepareStatement(sql);
 				
 				
 				pstmt.setInt(1, dto.getMember_num());
 				pstmt.setInt(2, dto.getItem_num());
 				pstmt.setInt(3, dto.getCart_cnt());
 				
 				
 				
 				pstmt.execute();
 				
 			} catch (SQLException e) {
 				// TODO Auto-generated catch block
 				e.printStackTrace();
 			}finally {
 				db.dbClose(pstmt, conn);
 			}
 			
 		}
   
   
 		//장바구니 출력
//// 		public List<HashMap<String, String>> getCartList(String id)
//// 		{
//// 			List<HashMap<String, String>> list=new ArrayList<>();
//// 			
//// 			Connection conn=db.getConnection();
//// 			PreparedStatement pstmt=null;
//// 			ResultSet rs=null;
//// 			
//// 			String sql="select c.cart_num,i.item_name,i.item_num,i.item_info_img,i.item_weight,i.item_price,c.cart_cnt"
//// 					+ " from cart c,item i,member m"
//// 					+ " where c.item_num=i.item_num and c.member_num=m.member_num and m.member_id=?";
//// 			
//// 			try {
//// 				pstmt=conn.prepareStatement(sql);
//// 				
//// 				pstmt.setString(1, id);
//// 				rs=pstmt.executeQuery();
//// 				
//// 				while(rs.next())
//// 				{
//// 					HashMap<String, String> map=new HashMap<>();
//// 					
//// 					map.put("cart_num", rs.getString("cart_num"));
//// 					map.put("item_name", rs.getString("item_name"));
//// 					map.put("item_num", rs.getString("item_num"));
//// 					map.put("item_num", rs.getString("item_num"));
//// 					map.put("item_info_img", rs.getString("item_info_img"));
//// 					map.put("item_weight", rs.getString("item_weight"));
//// 					map.put("item_price", rs.getString("item_price"));
//// 					map.put("cart_cnt", rs.getString("cart_cnt"));
//// 					
//// 					
//// 					list.add(map);
//// 				}
//// 				
//// 			} catch (SQLException e) {
//// 				// TODO Auto-generated catch block
//// 				e.printStackTrace();
//// 			}finally {
//// 				db.dbClose(rs, pstmt, conn);
//// 			}
// 			
// 			
// 			
// 			
//// 			return list;
//// 		}
 		
 		
 		//삭제
 		public void deleteCart(String num)
 		{
 			Connection conn=db.getConnection();
 			PreparedStatement pstmt=null;
 			
 			String sql="delete from cart where num=?";
 			
 			try {
 				pstmt=conn.prepareStatement(sql);
 				
 				pstmt.setString(1, num);
 				pstmt.execute();
 				
 			} catch (SQLException e) {
 				// TODO Auto-generated catch block
 				e.printStackTrace();
 			}finally {
 				db.dbClose(pstmt, conn);
 			}
 			
 		}
 		
 		
   
	
}


