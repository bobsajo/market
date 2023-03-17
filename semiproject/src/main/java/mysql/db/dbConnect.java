package mysql.db;

import java.sql.*;

public class dbConnect { //얘 생성해야 connection이랑 close 메소드 갖다 쓸 수 있음
    static final String MYSQLDRIVER="com.mysql.cj.jdbc.Driver";
    static final String MYSQL_URL="jdbc:mysql://bobsajo.cjbatwltjkt8.ap-northeast-2.rds.amazonaws.com:3306/bobsajo?serverTimezone=Asia/Seoul";

    //생성자
    public dbConnect() {
        try {
            Class.forName(MYSQLDRIVER);
        } catch (ClassNotFoundException e) {
            System.out.println("mysql드라이버 실패:"+e.getMessage());
        }
    }

    public Connection getConnection() {
        Connection conn=null;
        try {
            conn= DriverManager.getConnection(MYSQL_URL,"bobsajo","a4Pff4JorngVDyd");
        } catch (SQLException e) {
            System.out.println("mysql 연결 실패: "+e.getMessage());
        }

        return conn;
    }

    //close 해야할 게 총 4개, 오버로딩 메서드 4개 생성...conn,stmt(pre),rs
    public void dbClose(ResultSet rs, Statement stmt, Connection conn) {
        try {
            if(rs!=null) rs.close();
            if(stmt!=null) stmt.close();
            if(conn!=null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void dbClose(ResultSet rs, PreparedStatement pstmt, Connection conn) {
        try {
            if(rs!=null) rs.close();
            if(pstmt!=null) pstmt.close();
            if(conn!=null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void dbClose(Statement stmt, Connection conn) {
        try {
            if(stmt!=null) stmt.close();
            if(conn!=null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void dbClose(PreparedStatement pstmt, Connection conn) {
        try {
            if(pstmt!=null) pstmt.close();
            if(conn!=null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}


