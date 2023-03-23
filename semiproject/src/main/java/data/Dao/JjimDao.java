package data.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import data.Dto.JjimDto;


import mysql.db.dbConnect;

public class JjimDao {
	dbConnect db=new dbConnect();
	


    //전체 갯수 받아오기(페이징 기법)
    //페이징처리_#1_totalCount
    //n값을 두고 n이 몇 개인지 추출하는 코드, n은 db에 있는 데이터 수(글 수)
    public int getTotalCount(String member_num) {
        int n=0;
        Connection conn=db.getConnection();
        PreparedStatement pstmt=null;
        ResultSet rs=null;

        String sql="select count(*) from jjim where member_num=?";

        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,member_num);
            rs=pstmt.executeQuery();

            if(rs.next()) {
                n=rs.getInt(1); //어떤 열을 넣어도 상관 없음, 상징적으로 1 넣어둔 것
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.dbClose(rs,pstmt,conn);
        }
        return n;
    }

    //페이징처리_#2_List(start,perpage) //페이지를 어떻게 줄 건지:perpage
    //추천순으로 정렬
    public List<JjimDto> getJjimLike(String member_num, int start,int perpage) {
        List<JjimDto> list=new Vector<>();

        Connection conn=db.getConnection();
        PreparedStatement pstmt=null;
        ResultSet rs=null;

        //많이 쓰는 코드, limit 0,5하면 0~5개를 보여주는 것
        String sql="select * from jjim where member_num=? order by jjim_num desc limit ?,?";

        try {
            pstmt=conn.prepareStatement(sql);

            //바인딩
            pstmt.setString(1,member_num);
            pstmt.setInt(2,start);
            pstmt.setInt(3,perpage);

            rs=pstmt.executeQuery();

            //몇 번째부터 몇 번째까지라는 제한만 있을 뿐, 그 사이에서 전체 데이터를 불러 오는 건 똑같음
            //그래서 이 부분은 getAllData()와 코드가 일치
            while(rs.next()) {
                JjimDto dto=new JjimDto();

                dto.setJjim_num(rs.getString("jjim_num"));
                dto.setMember_num(rs.getString("member_num"));
                dto.setItem_num(rs.getString("item_num"));

                //리스트에 추가
                list.add(dto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            db.dbClose(rs,pstmt,conn);
        }
        return list;
    }


    //getData --> multi form으로 데이터 삭제 시 사용 가능
    public JjimDto getData(String jjim_num) {
        JjimDto dto=new JjimDto();

        Connection conn=db.getConnection();
        PreparedStatement pstmt=null;
        ResultSet rs=null;

        String sql="select * from jjim where jjim_num=?";

        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, jjim_num);
            rs=pstmt.executeQuery();

            //하나의 데이터만 필요하니까 if
            if(rs.next()) {
                dto.setJjim_num(rs.getString("jjim_num"));
                dto.setMember_num(rs.getString("member_num"));
                dto.setItem_num(rs.getString("item_num"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            db.dbClose(rs, pstmt, conn);
        }
        return dto;
    }

    
    //member_num,item_num,review_num 넘겨주면 jjim 테이블에 저장하기
    //insert
    public void insertJjimLike(String jjim_num,String member_num, String item_num) {
        Connection conn=db.getConnection();
        PreparedStatement pstmt=null;

        String sql="insert into jjim values(?,?,?)";

        try {
            pstmt= conn.prepareStatement(sql);
            pstmt.setString(1,jjim_num);
            pstmt.setString(2,member_num);
            pstmt.setString(3,item_num);

            pstmt.execute();
        } catch (SQLException e) {
            e.getMessage();
        } finally {
            db.dbClose(pstmt,conn);
        }
    }

    //삭제 -> jjim에 있는 아이템 삭제(찜 취소)
    public void deleteJjimLike(String member_num, String item_num) {
        Connection conn=db.getConnection();
        PreparedStatement pstmt=null;

        String sql="delete from jjim where member_num=? and item_num=?";

        try {
            pstmt=conn.prepareStatement(sql);

            pstmt.setString(1,member_num);
            pstmt.setString(2,item_num);

            pstmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.dbClose(pstmt,conn);
        }
    }

    //jjim테이블에 있는지
    public boolean hasJjim(String member_num, String item_num) {
        boolean has=false;

        Connection conn=db.getConnection();
        PreparedStatement pstmt=null;
        ResultSet rs=null;

        String sql="select count(*) from jjim where member_num=? and item_num=?";

        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,member_num);
            pstmt.setString(2,item_num);
            rs=pstmt.executeQuery();

            if(rs.next()) {
                has=true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.dbClose(rs,pstmt,conn);
        }
        return has;
    }
    
    //member_num과 item_num에 따른 jjim_num 들고오는 메소드
    public List<String> selectJjimNum(String member_num, String item_num) {
        List<String> jjimArr=new ArrayList<>();

        Connection conn=db.getConnection();
        PreparedStatement pstmt=null;
        ResultSet rs=null;

        String sql="select jjim_num from jjim where member_num=? and item_num=?";

        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,member_num);
            pstmt.setString(2,item_num);
            rs=pstmt.executeQuery();

            while(rs.next()) {
                jjimArr.add(rs.getString(" jjim_num"));
//                reviewArr.add("1");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.dbClose(rs,pstmt,conn);
        }
        return jjimArr;
    }

    
    
    public String getItemImg(String item_num) {
    	String item_img="";
    	
    	 Connection conn=db.getConnection();
         PreparedStatement pstmt=null;
         ResultSet rs=null;
    	
         String sql="select item_img from item where item_num=? ";
         
         try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, item_num);
			rs=pstmt.executeQuery();

			if(rs.next()) {
				item_img=rs.getString("item_img");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
            db.dbClose(rs,pstmt,conn);
         
    	
    }
         return item_img;
}
}


