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

	DbConnect db = new DbConnect();

	//페이징처리 list
	public List<ItemDto> getList(int start, int perpage)
	{
		List<ItemDto> list = new Vector<>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from item order by item_num asc limit ?,?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, perpage);
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				ItemDto dto = new ItemDto();
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
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	//item_num의 dto얻기
		public ItemDto getItemData(String item_num)
		{
			ItemDto dto=new ItemDto();
			
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
	 				dto.setItem_img(rs.getString("item_img"));
	 				dto.setItem_price(rs.getInt("item_price"));
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
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			return dto;
			
		}
	
	//페이징처리 카테고리별 리스트
		public List<ItemDto> getListCategory(String category, int start, int perpage)
		{
			List<ItemDto> list = new Vector<>();
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "select * from item where item_category = ? order by item_num asc limit ?,?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, category);
				pstmt.setInt(2, start);
				pstmt.setInt(3, perpage);
				rs = pstmt.executeQuery();
				
				while(rs.next())
				{
					ItemDto dto = new ItemDto();
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
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			return list;
		}
	
		
	//카테고리바 해당 메뉴 클릭 시 이동
	public List<ItemDto> getAllCategory(String item_category)
	{
		List<ItemDto> list = new Vector<>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from item where item_category=? order by item_num desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, item_category);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ItemDto dto = new ItemDto();

				dto.setItem_num(rs.getString("item_num"));
				dto.setItem_category(rs.getString("item_category"));
				dto.setItem_name(rs.getString("item_name"));
				dto.setItem_img(rs.getString("item_img"));
				dto.setItem_price(rs.getInt("item_price"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}

	//카테고리 신상품 클릭 시 이동
	public List<ItemDto> getAllSinsang()
	{
		List<ItemDto> list = new Vector<>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from item order by item_num desc limit 0,16";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				ItemDto dto = new ItemDto();
				
				
				dto.setItem_num(rs.getString("item_num"));
				dto.setItem_category(rs.getString("item_category"));
				dto.setItem_name(rs.getString("item_name"));
				dto.setItem_img(rs.getString("item_img"));
				dto.setItem_price(rs.getInt("item_price"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}

	 	//num으로 상품명 가져오기
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
