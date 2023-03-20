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
	private String item_num;
	
	//insert
	public void MemberInsert(ItemDto dto)
	{
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into item(item_name, item_price, item_img, item_sub_title, item_info_img,"
				+ ", item_seller, item_package_type, item_package_detail, item_sell_unit, item_weight,"
				+ ", item_origin, item_allergy, item_warning, item_detail, item_category) values(null,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getItem_name());
			pstmt.setInt(2, dto.getItem_price());
			pstmt.setString(3, dto.getItem_img());
			pstmt.setString(4, dto.getItem_sub_title());
			pstmt.setString(5, dto.getItem_seller());
			pstmt.setString(6, dto.getItem_package_type());
			pstmt.setString(7, dto.getItem_package_detail());
			pstmt.setString(8, dto.getItem_sell_unit());
			pstmt.setString(9, dto.getItem_weight());
			pstmt.setString(10, dto.getItem_origin());
			pstmt.setString(11, dto.getItem_allergy());
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
			// TODO Auto-generated catch block
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
				// TODO Auto-generated catch block
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
				// TODO Auto-generated catch block
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	
	
	//카테고리 신상품 클릭 시 이동
	
	public List<ItemDto> getAllSinsang(String item_category)
	{
		List<ItemDto> list = new Vector<>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from item where item_num=? order by item_num asc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, item_num);
			
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
}
