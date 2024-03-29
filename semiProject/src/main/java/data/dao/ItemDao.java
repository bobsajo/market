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
	public void insertitem(ItemDto dto)
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	//카테고리 베스트 클릭 시 이동
		public List<ItemDto> getAllBest()
		{
			List<ItemDto> list = new Vector<>();
			
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "select item_num, count(item_num) from jjim group by item_num order by item_num desc";
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				rs=pstmt.executeQuery();
				
				while(rs.next())
				{
					ItemDto dto = new ItemDto();
					ItemDao dao = new ItemDao();
					
					String item_num = rs.getString("item_num");
					dto = dao.getItemData(item_num);
					
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
	
	
	
	//////////////////////////////
	
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
	 	
		/*
		 * //장바구니 추가 public void insertCart(CartDto dto) { Connection
		 * conn=db.getConnection(); PreparedStatement pstmt=null;
		 * 
		 * String sql="insert into cart values(null,?,?,?,now())";
		 * 
		 * try { pstmt=conn.prepareStatement(sql);
		 * 
		 * 
		 * pstmt.setInt(1, dto.getMember_num()); pstmt.setInt(2, dto.getItem_num());
		 * pstmt.setInt(3, dto.getCart_cnt());
		 * 
		 * 
		 * 
		 * pstmt.execute();
		 * 
		 * } catch (SQLException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }finally { db.dbClose(pstmt, conn); }
		 * 
		 * }
		 */
   
   
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
		
		
		///예지
		
		//////////////////////////////
		
		 	
			/*
			 * //장바구니 추가 public void insertCart(CartDto dto) { Connection
			 * conn=db.getConnection(); PreparedStatement pstmt=null;
			 * 
			 * String sql="insert into cart values(null,?,?,?,now())";
			 * 
			 * try { pstmt=conn.prepareStatement(sql);
			 * 
			 * 
			 * pstmt.setInt(1, dto.getMember_num()); pstmt.setInt(2, dto.getItem_num());
			 * pstmt.setInt(3, dto.getCart_cnt());
			 * 
			 * 
			 * 
			 * pstmt.execute();
			 * 
			 * } catch (SQLException e) { // TODO Auto-generated catch block
			 * e.printStackTrace(); }finally { db.dbClose(pstmt, conn); }
			 * 
			 * }
			 */
	   
	   
	 		//장바구니 출력
////	 		public List<HashMap<String, String>> getCartList(String id)
////	 		{
////	 			List<HashMap<String, String>> list=new ArrayList<>();
////	 			
////	 			Connection conn=db.getConnection();
////	 			PreparedStatement pstmt=null;
////	 			ResultSet rs=null;
////	 			
////	 			String sql="select c.cart_num,i.item_name,i.item_num,i.item_info_img,i.item_weight,i.item_price,c.cart_cnt"
////	 					+ " from cart c,item i,member m"
////	 					+ " where c.item_num=i.item_num and c.member_num=m.member_num and m.member_id=?";
////	 			
////	 			try {
////	 				pstmt=conn.prepareStatement(sql);
////	 				
////	 				pstmt.setString(1, id);
////	 				rs=pstmt.executeQuery();
////	 				
////	 				while(rs.next())
////	 				{
////	 					HashMap<String, String> map=new HashMap<>();
////	 					
////	 					map.put("cart_num", rs.getString("cart_num"));
////	 					map.put("item_name", rs.getString("item_name"));
////	 					map.put("item_num", rs.getString("item_num"));
////	 					map.put("item_num", rs.getString("item_num"));
////	 					map.put("item_info_img", rs.getString("item_info_img"));
////	 					map.put("item_weight", rs.getString("item_weight"));
////	 					map.put("item_price", rs.getString("item_price"));
////	 					map.put("cart_cnt", rs.getString("cart_cnt"));
////	 					
////	 					
////	 					list.add(map);
////	 				}
////	 				
////	 			} catch (SQLException e) {
////	 				// TODO Auto-generated catch block
////	 				e.printStackTrace();
////	 			}finally {
////	 				db.dbClose(rs, pstmt, conn);
////	 			}
//	 			
//	 			
//	 			
//	 			
////	 			return list;
////	 		}
			
			
			///권예지 추가////
			
			//해당 아이템이 세일 목록에 해당하는지 확인
			public boolean itemIsSale(String item_num) {
				boolean issale=false;
				
				Connection conn=db.getConnection();
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				
				String sql="select i.item_num from item i,timesale t where i.item_num=t.item_num and i.item_num=?";
				
				try {
					pstmt=conn.prepareStatement(sql);
					
					pstmt.setString(1, item_num);
					rs=pstmt.executeQuery();
					
					if(rs.next()){
						//해당 아이템이 세일하는 아이템이라면
						issale=true;
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					db.dbClose(rs, pstmt, conn);
				}
				
				return issale;
			}
			
			
			//세일값 가져오기
			public int getSalePrice(String item_num) {
				int sale_price=0;
				
				Connection conn=db.getConnection();
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				
				String sql="select sale_price from timesale where item_num=?";
				
				try {
					pstmt=conn.prepareStatement(sql);
					
					pstmt.setString(1, item_num);
					rs=pstmt.executeQuery();
					
					if(rs.next()) {
						sale_price=rs.getInt("sale_price");
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					db.dbClose(rs, pstmt, conn); 
				}
				
				return sale_price;
			}
			
			
			//////////////
			
			
			//item_price만 불러오는 메소드
			public int getItemPrice(String item_num) {
				int item_price=0;

				Connection conn=db.getConnection();
				PreparedStatement pstmt=null;
				ResultSet rs=null;

				String sql="select item_price from item where item_num=?";

				try {
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1,item_num);
					rs=pstmt.executeQuery();

					if(rs.next()) {
						item_price=rs.getInt("item_price");
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					db.dbClose(rs,pstmt,conn);
				}
				return item_price;
			}
}
