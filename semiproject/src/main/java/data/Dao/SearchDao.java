package data.Dao;

import mysql.db.dbConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import data.Dto.SearchDto;

public class SearchDao {
    dbConnect db=new dbConnect();

    //검색 기능
    public ArrayList<SearchDto> getSearch(String searchText){//특정한 리스트를 받아서 반환
        ArrayList<SearchDto> list = new ArrayList<>();


        Connection conn=db.getConnection();
        PreparedStatement pstmt=null;
        ResultSet rs=null;

        String SQL ="select item_num, item_img, item_name, item_sub_title, item_category, item_price from item where ";
        try {
            if(searchText != null && !searchText.equals("") ){ //입력한 게 공백이 아니면
                SQL +="item_name LIKE '%"+searchText.trim()+"%' order by item_num desc";

//                System.out.println(SQL);

                pstmt=conn.prepareStatement(SQL);
                rs=pstmt.executeQuery();//select
            }

            while(rs.next()) {
                SearchDto dto = new SearchDto();
                dto.setItem_num(rs.getString("item_num"));
                dto.setItem_name(rs.getString("item_name"));
                dto.setItem_img(rs.getString("item_img"));
                dto.setItem_sub_title(rs.getString("item_sub_title"));
                dto.setItem_category(rs.getString("item_category"));
                dto.setItem_price(rs.getInt("item_price"));

                list.add(dto);//list에 해당 인스턴스를 담는다.
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            db.dbClose(rs,pstmt,conn);
        }
        return list; //리스트 반환
    }
}
