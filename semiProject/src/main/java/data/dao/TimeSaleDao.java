package data.dao;

import data.dto.ItemDto;
import mysql.db.DbConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class TimeSaleDao {
    DbConnect db=new DbConnect();

    //sale_num 랜덤
    public List<String> randomItem() {
        List<String> random=new ArrayList<>();

        Connection conn=db.getConnection();
        PreparedStatement pstmt=null;
        ResultSet rs=null;

        String sql="select item_num from timesale order by rand() limit 0,3";

        try {
            pstmt=conn.prepareStatement(sql);
            rs=pstmt.executeQuery();

            while(rs.next()) {
                random.add(rs.getString("item_num"));
            }
           /* System.out.println(random);*/

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.dbClose(rs,pstmt,conn);
        }
        return random;
    }

    //item_num에 따른 이름, 사진, 가격 불러오기
    public ItemDto selectItem(String item_num) {
        ItemDto dto=new ItemDto();

        Connection conn=db.getConnection();
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        String sql="select item_name, item_img, item_price from item where item_num=?";

        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,item_num);
            rs=pstmt.executeQuery();

            if(rs.next()) {
                dto.setItem_name(rs.getString("item_name"));
                dto.setItem_img(rs.getString("item_img"));
                dto.setItem_price(rs.getInt("item_price"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dto;
    }

    //sale_price 설정해주기(int sale_price는 메인에서 아이템 가격 받아와서 할인율 적용해서 여기로 다시 보내줄 것)
    public void updateSalePrice(int price, String item_num) {
        Connection conn=db.getConnection();
        PreparedStatement pstmt=null;

        String sql="update timesale set sale_price=? where item_num=?";

        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1,price);
            pstmt.setString(2,item_num);

            pstmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.dbClose(pstmt,conn);
        }
    }

    public int getPrice(String item_num) {
        int price=0;

        Connection conn=db.getConnection();
        PreparedStatement pstmt=null;
        ResultSet rs=null;

        String sql="select sale_price from timesale where item_num=?";

        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,item_num);
            rs=pstmt.executeQuery();

            if(rs.next()) {
                price=rs.getInt("sale_price");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.dbClose(rs,pstmt,conn);
        }
        return price;
    }

}
