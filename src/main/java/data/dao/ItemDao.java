package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.ItemDto;
import mysql.db.DbConnect;

public class ItemDao {

	
   DbConnect db=new DbConnect();
   
   //insert
   public void insertitem(ItemDto dto)
   {
	   Connection conn=db.getConnection();
	   PreparedStatement pstmt=null;
	   
	   String sql="insert into item values(null,?,?,?,?,?,?,?,?,?,?,?,?)";

	   
	   try {
		pstmt=conn.prepareStatement(sql);
		
		pstmt.setString(1, dto.getItem_name());
		pstmt.setInt(2, dto.getItem_price());
		pstmt.setString(3, dto.getItem_sub_title());
		pstmt.setString(4, dto.getItem_seller());
		pstmt.setString(5, dto.getItem_package_type());
		pstmt.setString(6, dto.getItem_package_detail());
		pstmt.setString(7, dto.getItem_sell_unit());
		pstmt.setString(8, dto.getItem_weight());
		pstmt.setString(9, dto.getItem_origin());
		pstmt.setString(10, dto.getItem_warning());
		pstmt.setString(11, dto.getItem_detail());
		pstmt.setString(12, dto.getItem_category());
		
		pstmt.execute();
		
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		db.dbClose(pstmt, conn);
	}
	   
   }
	
   
 //전체목록
 	public List<ItemDto> getAllItem()
 	{
 		List<ItemDto> list=new Vector<>();
 		
 		Connection conn=db.getConnection();
 		PreparedStatement pstmt=null;
 		ResultSet rs=null;
 		
 		String sql="select * from item order by item_num desc";
 		
 		try {
 			pstmt=conn.prepareStatement(sql);
 			rs=pstmt.executeQuery();
 			
 			while(rs.next())
 			{
 				ItemDto dto=new ItemDto();
 				dto.setItem_num(rs.getString("item_num"));
 				dto.setItem_name(rs.getString("item_name"));
 				dto.setItem_price(rs.getInt("item_price"));
 				dto.setItem_sub_title(rs.getString("sub_title"));
 				dto.setItem_seller(rs.getString("item_seller"));
 				dto.setItem_package_type(rs.getString("item_package_type"));
 				dto.setItem_package_detail(rs.getString("package_detail"));
 				dto.setItem_sell_unit(rs.getString("item_sell_unit"));
 				dto.setItem_weight(rs.getString("tem_weight"));
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
   
 	//shopnum의 dto얻기
 		public ItemDto getItemData(String Item_num)
 		{
 			ItemDto dto=new ItemDto();
 			
 			Connection conn=db.getConnection();
 			PreparedStatement pstmt=null;
 			ResultSet rs=null;
 			
 			String sql="select * from Item where item_num=?";
 			
 			try {
 				pstmt=conn.prepareStatement(sql);
 				pstmt.setString(1, Item_num);
 				
 				rs=pstmt.executeQuery();
 				
 				if(rs.next())
 				{
 					dto.setItem_num(rs.getString("item_num"));
 	 				dto.setItem_name(rs.getString("item_name"));
 	 				dto.setItem_price(rs.getInt("item_price"));
 	 				dto.setItem_sub_title(rs.getString("sub_title"));
 	 				dto.setItem_seller(rs.getString("item_seller"));
 	 				dto.setItem_package_type(rs.getString("item_package_type"));
 	 				dto.setItem_package_detail(rs.getString("package_detail"));
 	 				dto.setItem_sell_unit(rs.getString("item_sell_unit"));
 	 				dto.setItem_weight(rs.getString("tem_weight"));
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

	 	//상품명 가져오기
		public String getItemName(String item_num) {
			String item_name="";

			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;

			String sql="select item_name from item where item_num=?";

			try {
				pstmt=conn.prepareStatement(sql);

				pstmt.setString(1,item_num);
				rs=pstmt.executeQuery();

				if(rs.next()) {
					item_name=rs.getString("item_name");
				}
			} catch (SQLException e) {
				e.getMessage();
			} finally {
				db.dbClose(rs,pstmt,conn);
			}

			return item_name;
		}
	
}


