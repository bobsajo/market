package data.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import data.Dto.JjimDto;
import data.Dto.itemDto;
import mysql.db.dbConnect;

public class JjimDao {
	dbConnect db=new dbConnect();
	


	   public JjimDao() {
	    }

	    public int getTotalCount(String member_num) {
	        int n = 0;
	        Connection conn = this.db.getConnection();
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        String sql = "select count(*) from jjim where member_num=?";

	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, member_num);
	            rs = pstmt.executeQuery();
	            if (rs.next()) {
	                n = rs.getInt(1);
	            }
	        } catch (SQLException var11) {
	            var11.printStackTrace();
	        } finally {
	            this.db.dbClose(rs, pstmt, conn);
	        }

	        return n;
	    }

	    public List<JjimDto> getJjimLike(String member_num) {
	        List<JjimDto> list = new Vector();
	        Connection conn = db.getConnection();
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        String sql = "select * from jjim where member_num=? order by jjim_num desc";

	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, member_num);
	            rs = pstmt.executeQuery();

	            while(rs.next()) {
	                JjimDto dto = new JjimDto();
	                dto.setJjim_num(rs.getString("jjim_num"));
	                dto.setMember_num(rs.getString("member_num"));
	                dto.setItem_num(rs.getString("item_num"));
	                list.add(dto);
	            }
	        } catch (SQLException var13) {
	            var13.printStackTrace();
	        } finally {
	            db.dbClose(rs, pstmt, conn);
	        }

	        return list;
	    }

	    public JjimDto getData(String jjim_num) {
	        JjimDto dto = new JjimDto();
	        Connection conn = this.db.getConnection();
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        String sql = "select * from jjim where jjim_num=?";

	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, jjim_num);
	            rs = pstmt.executeQuery();
	            if (rs.next()) {
	                dto.setJjim_num(rs.getString("jjim_num"));
	                dto.setMember_num(rs.getString("member_num"));
	                dto.setItem_num(rs.getString("item_num"));
	            }
	        } catch (SQLException var11) {
	            var11.printStackTrace();
	        } finally {
	            this.db.dbClose(rs, pstmt, conn);
	        }

	        return dto;
	    }

	    public void insertJjim(String jjim_num, String member_num, String item_num) {
	        Connection conn = this.db.getConnection();
	        PreparedStatement pstmt = null;
	        String sql = "insert into jjim values(?,?,?)";

	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, jjim_num);
	            pstmt.setString(2, member_num);
	            pstmt.setString(3, item_num);
	            pstmt.execute();
	        } catch (SQLException var11) {
	            var11.getMessage();
	        } finally {
	            this.db.dbClose(pstmt, conn);
	        }

	    }

	    public void deleteJjim(String member_num, String item_num) {
	        Connection conn = this.db.getConnection();
	        PreparedStatement pstmt = null;
	        String sql = "delete from jjim where member_num=? and item_num=?";

	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, member_num);
	            pstmt.setString(2, item_num);
	            pstmt.execute();
	        } catch (SQLException var10) {
	            var10.printStackTrace();
	        } finally {
	            this.db.dbClose(pstmt, conn);
	        }

	    }

	    public boolean hasJjim(String member_num, String item_num) {
	        boolean has = false;
	        Connection conn = this.db.getConnection();
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        String sql = "select count(*) from jjim where member_num=? and item_num=?";

	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, member_num);
	            pstmt.setString(2, item_num);
	            rs = pstmt.executeQuery();
	            if (rs.next()) {
	                has = true;
	            }
	        } catch (SQLException var12) {
	            var12.printStackTrace();
	        } finally {
	            this.db.dbClose(rs, pstmt, conn);
	        }

	        return has;
	    }

	    public List<String> selectJjimNum(String member_num, String item_num) {
	        List<String> jjimArr = new ArrayList();
	        Connection conn = this.db.getConnection();
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        String sql = "select jjim_num from jjim where member_num=? and item_num=?";

	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, member_num);
	            pstmt.setString(2, item_num);
	            rs = pstmt.executeQuery();

	            while(rs.next()) {
	                jjimArr.add(rs.getString(" jjim_num"));
	            }
	        } catch (SQLException var12) {
	            var12.printStackTrace();
	        } finally {
	            this.db.dbClose(rs, pstmt, conn);
	        }

	        return jjimArr;
	    }

	    public String getItemImg(String item_num) {
	        String item_img = "";
	        Connection conn = this.db.getConnection();
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        String sql = "select item_img from item where item_num=? ";

	        try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, item_num);
	            rs = pstmt.executeQuery();
	            if (rs.next()) {
	                item_img = rs.getString("item_img");
	            }
	        } catch (SQLException var11) {
	            var11.printStackTrace();
	        } finally {
	            this.db.dbClose(rs, pstmt, conn);
	        }

	        return item_img;
	    }

	    //member_num이 찜한 상품들의 item_num, item_name, item_img, item_price를 받아온다(서브쿼리 적용)
	    public List<itemDto> getJjimItem(String member_num, int start, int perpage) {
	        List<itemDto> list=new ArrayList<>();

	        Connection conn=db.getConnection();
	        PreparedStatement pstmt=null;
	        ResultSet rs=null;

	        String sql="select item_num, item_img, item_price, item_name from item where item_num in(select item_num from jjim where member_num=?) order by item_num limit ?,?";

	        try {
	            pstmt=conn.prepareStatement(sql);
	            pstmt.setString(1,member_num);
	            pstmt.setInt(2,start);
	            pstmt.setInt(3,perpage);
	            rs=pstmt.executeQuery();

	            while(rs.next()) {
	                itemDto dto=new itemDto();
	                dto.setItem_num(rs.getString("item_num"));
	                dto.setItem_img(rs.getString("item_img"));
	                dto.setItem_name(rs.getString("item_name"));
	                dto.setItem_price(rs.getInt("item_price"));

	                list.add(dto);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            db.dbClose(rs,pstmt,conn);
	        }

	        return list;
	    }

	}