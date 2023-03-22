package data.Dao;

import data.Dto.ReviewDto;
import data.Dto.ReviewLikeDto;
import mysql.db.dbConnect;

import java.sql.*;
import java.util.*;

public class ReviewDao {
    dbConnect db=new dbConnect();

    //검색 기능
    public ArrayList<ReviewDto> getAllReviewData(){ //특정한 리스트를 받아서 반환
        ArrayList<ReviewDto> list = new ArrayList<>();

        Connection conn=db.getConnection();
        PreparedStatement pstmt=null;
        ResultSet rs=null;

        String sql ="select * from review order by review_like desc";
        try {
                System.out.println(sql);

                pstmt=conn.prepareStatement(sql);
                rs=pstmt.executeQuery();//select

            while(rs.next()) {
                ReviewDto dto = new ReviewDto();
                dto.setItem_num(rs.getString("item_num"));
                dto.setReview_num(rs.getString("review_num"));
                dto.setMember_num(rs.getString("member_num"));
                dto.setReview_img(rs.getString("review_img"));
                dto.setReview_content(rs.getString("review_content"));
                dto.setReview_date(rs.getString("review_date"));
                dto.setReview_like(rs.getInt("review_like"));

                list.add(dto);  //list에 해당 인스턴스를 담는다.
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            db.dbClose(rs,pstmt,conn);
        }
        return list; //리스트 반환
    }

    //전체 갯수 받아오기(페이징 기법)
    //페이징처리_#1_totalCount
    //n값을 두고 n이 몇 개인지 추출하는 코드, n은 db에 있는 데이터 수(글 수)
    public int getTotalCount(String item_num) {
        int n=0;
        Connection conn=db.getConnection();
        PreparedStatement pstmt=null;
        ResultSet rs=null;

        String sql="select count(*) from review where item_num=?";

        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,item_num);
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
    public List<ReviewDto> getListLike(String item_num, int start,int perpage) {
        List<ReviewDto> list=new Vector<>();

        Connection conn=db.getConnection();
        PreparedStatement pstmt=null;
        ResultSet rs=null;

        //많이 쓰는 코드, limit 0,5하면 0~5개를 보여주는 것
        String sql="select * from review where item_num=? order by review_like desc limit ?,?";

        try {
            pstmt=conn.prepareStatement(sql);

            //바인딩
            pstmt.setString(1,item_num);
            pstmt.setInt(2,start);
            pstmt.setInt(3,perpage);

            rs=pstmt.executeQuery();

            //몇 번째부터 몇 번째까지라는 제한만 있을 뿐, 그 사이에서 전체 데이터를 불러 오는 건 똑같음
            //그래서 이 부분은 getAllData()와 코드가 일치
            while(rs.next()) {
                ReviewDto dto=new ReviewDto();

                dto.setItem_num(rs.getString("item_num"));
                dto.setReview_num(rs.getString("review_num"));
                dto.setMember_num(rs.getString("member_num"));
                dto.setReview_img(rs.getString("review_img"));
                dto.setReview_content(rs.getString("review_content"));
                dto.setReview_date(rs.getString("review_date"));
                dto.setReview_like(rs.getInt("review_like"));

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

    //최신순으로 정렬
    public List<ReviewDto> getListNew(String item_num, int start,int perpage) {
        List<ReviewDto> list=new Vector<>();

        Connection conn=db.getConnection();
        PreparedStatement pstmt=null;
        ResultSet rs=null;

        //많이 쓰는 코드, limit 0,5하면 0~5개를 보여주는 것
        String sql="select * from review where item_num=? order by review_num desc limit ?,?";

        try {
            pstmt=conn.prepareStatement(sql);

            //바인딩
            pstmt.setString(1,item_num);
            pstmt.setInt(2,start);
            pstmt.setInt(3,perpage);

            rs=pstmt.executeQuery();

            //몇 번째부터 몇 번째까지라는 제한만 있을 뿐, 그 사이에서 전체 데이터를 불러 오는 건 똑같음
            //그래서 이 부분은 getAllData()와 코드가 일치
            while(rs.next()) {
                ReviewDto dto=new ReviewDto();

                dto.setItem_num(rs.getString("item_num"));
                dto.setReview_num(rs.getString("review_num"));
                dto.setMember_num(rs.getString("member_num"));
                dto.setReview_img(rs.getString("review_img"));
                dto.setReview_content(rs.getString("review_content"));
                dto.setReview_date(rs.getString("review_date"));
                dto.setReview_like(rs.getInt("review_like"));

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
    public ReviewDto getData(String review_num) {
        ReviewDto dto=new ReviewDto();

        Connection conn=db.getConnection();
        PreparedStatement pstmt=null;
        ResultSet rs=null;

        String sql="select * from review where review_num=?";

        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, review_num);
            rs=pstmt.executeQuery();

            //하나의 데이터만 필요하니까 if
            if(rs.next()) {
                dto.setItem_num(rs.getString("item_num"));
                dto.setReview_num(rs.getString("review_num"));
                dto.setMember_num(rs.getString("member_num"));
                dto.setReview_img(rs.getString("review_img"));
                dto.setReview_content(rs.getString("review_content"));
                dto.setReview_date(rs.getString("review_date"));
                dto.setReview_like(rs.getInt("review_like"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            db.dbClose(rs, pstmt, conn);
        }
        return dto;
    }

    //추천수 증가(ajax)
    public void updateLike(String review_num) {
        Connection conn=db.getConnection();
        PreparedStatement pstmt=null;

        String sql="update review set review_like=review_like+1 where review_num=?";

        try {
            pstmt=conn.prepareStatement(sql);

            pstmt.setString(1,review_num);
            pstmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.dbClose(pstmt,conn);
        }
    }

    //추천 취소(ajax)
    public void deleteLike(String review_num) {
        Connection conn=db.getConnection();
        PreparedStatement pstmt=null;

        String sql="update review set review_like=review_like-1 where review_num=?";

        try {
            pstmt=conn.prepareStatement(sql);

            pstmt.setString(1,review_num);
            pstmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.dbClose(pstmt,conn);
        }
    }

    //member_num,item_num,review_num 넘겨주면 reviewlike에 저장하기
    //insert
    public void insertReviewLike(String member_num, String item_num, String review_num) {
        Connection conn=db.getConnection();
        PreparedStatement pstmt=null;

        String sql="insert into reviewlike values(?,?,?)";

        try {
            pstmt= conn.prepareStatement(sql);
            pstmt.setString(1,member_num);
            pstmt.setString(2,item_num);
            pstmt.setString(3,review_num);

            pstmt.execute();
        } catch (SQLException e) {
            e.getMessage();
        } finally {
            db.dbClose(pstmt,conn);
        }
    }

    //reviewlike getData
    public ReviewLikeDto getReviewLike(String member_num) {
        ReviewLikeDto dto=new ReviewLikeDto();

        Connection conn=db.getConnection();
        PreparedStatement pstmt=null;
        ResultSet rs=null;

        String sql="select * from reviewlike where member_num=?";

        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,member_num);
            pstmt.executeQuery();

            if(rs.next()) {
                dto.setMember_num(rs.getString("member_num"));
                dto.setItem_num(rs.getString("item_num"));
                dto.setItem_num(rs.getString("review_num"));
            }
        } catch (SQLException e) {
            e.getMessage();
        } finally {
            db.dbClose(rs,pstmt,conn);
        }
        return dto;
    }

    //삭제
    public void deleteReviewLike(String member_num, String item_num, String review_num) {
        Connection conn=db.getConnection();
        PreparedStatement pstmt=null;

        String sql="delete from reviewlike where member_num=? and item_num=? and review_num=?";

        try {
            pstmt=conn.prepareStatement(sql);

            pstmt.setString(1,member_num);
            pstmt.setString(2,item_num);
            pstmt.setString(3,review_num);

            pstmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.dbClose(pstmt,conn);
        }
    }

    //reviewlike 조회
    public ReviewLikeDto getReviewLike(String member_num, String item_num) {
        ReviewLikeDto dto=new ReviewLikeDto();

        Connection conn=db.getConnection();
        PreparedStatement pstmt=null;
        ResultSet rs=null;

        String sql="select * from reviewlike where member_num=? and item_num=?";

        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,member_num);
            pstmt.setString(2,item_num);

            rs=pstmt.executeQuery();

            if(rs.next()) {
                dto.setMember_num(rs.getString("member_num"));
                dto.setItem_num(rs.getString("item_num"));
                dto.setReview_num(rs.getString("review_num"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.dbClose(rs,pstmt,conn);
        }
        return dto;
    }

    public boolean hasReviewLike(String member_num, String item_num, String review_num) {
        boolean has=false;

        Connection conn=db.getConnection();
        PreparedStatement pstmt=null;
        ResultSet rs=null;

        String sql="select count(*) from reviewlike where member_num=? and item_num=? and review_num=?";

        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,member_num);
            pstmt.setString(2,item_num);
            pstmt.setString(3,review_num);
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

    public List<String> selectReviewNum(String member_num, String item_num) {
        List<String> reviewArr=new ArrayList<>();

        Connection conn=db.getConnection();
        PreparedStatement pstmt=null;
        ResultSet rs=null;

        String sql="select review_num from reviewlike where member_num=? and item_num=?";

        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,member_num);
            pstmt.setString(2,item_num);
            rs=pstmt.executeQuery();

            while(rs.next()) {
                reviewArr.add(rs.getString("review_num"));
//                reviewArr.add("1");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.dbClose(rs,pstmt,conn);
        }
        return reviewArr;
    }


}
