package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import data.dto.MemberDto;
import mysql.db.DbConnect;

public class MemberDao {
DbConnect db=new DbConnect();
	
	//회원정보 일치 검사
	public boolean checkLogin(String id,String pass)
	{
		boolean check=false;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		//아이디와 비밀번호가 일치하는 데이터가 존재하는지
		String sql="select * from member where member_id=? and member_pass=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			rs=pstmt.executeQuery();
			
			//일치하는 데이터가 존재한다면
			if(rs.next())
			{
				check=true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs,pstmt,conn);
		}
		
		return check;
	}

	//id중복체크
	public int checkId(String id) 
	{
		int idok=0;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select count(*) from member where member_id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			//같은 아이디 개수
			if(rs.next()){
				idok=rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return idok;
	}
	
	//email중복체크
		public int checkEmail(String email) 
		{
			int emailok=0;
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select count(*) from member where member_email=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, email);
				rs=pstmt.executeQuery();
				
				//같은 아이디 개수
				if(rs.next()){
					emailok=rs.getInt(1);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return emailok;
		}
	
	//insert
	public void insertMember(MemberDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into member values(null,?,?,?,?,?,?,?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1,dto.getMember_name());
			pstmt.setString(2, dto.getMember_addr());
			pstmt.setString(3, dto.getMember_hp());
			pstmt.setString(4, dto.getMember_pass());
			pstmt.setString(5, dto.getMember_id());
			pstmt.setString(6, dto.getMember_email());
			pstmt.setString(7, dto.getMember_birth());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt,conn);
		}
	}

	//id에 해당하는 dto가져오기
	public MemberDto getMemberById(String id)
	{
		MemberDto dto=new MemberDto();

		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql="select * from member where member_id=?";

		try {
			pstmt=conn.prepareStatement(sql);

			pstmt.setString(1, id);
			rs=pstmt.executeQuery();

			if(rs.next())
			{
				dto.setMember_num(rs.getString("member_num"));
				dto.setMember_id(rs.getString("member_id"));
				dto.setMember_pass(rs.getString("member_pass"));
				dto.setMember_name(rs.getString("member_name"));
				dto.setMember_hp(rs.getString("member_hp"));
				dto.setMember_email(rs.getString("member_email"));
				dto.setMember_birth(rs.getString("member_brith"));
				dto.setMember_addr(rs.getString("member_addr"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}

	//id에 해당하는 멤버 num가져오기
	public String getMemNumById(String id)
	{
		String member_num="";

		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql="select member_num from member where member_id=?";

		try {
			pstmt=conn.prepareStatement(sql);

			pstmt.setString(1, id);
			rs=pstmt.executeQuery();

			if(rs.next())
			{
				member_num=rs.getString("member_num");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return member_num;
	}

	public String getName(String member_num) {
		String member_name="";

		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql="select member_name from member where member_num=?";

		try {
			pstmt=conn.prepareStatement(sql);

			pstmt.setString(1,member_num);
			rs=pstmt.executeQuery();

			if(rs.next()) {
				member_name=rs.getString("member_name");
			}
		} catch (SQLException e) {
			e.getMessage();
		} finally {
			db.dbClose(rs,pstmt,conn);
		}

		return member_name;
	}

	//id에 따른 member_num 가져오기
	public String getMemberNum(String myid) {
		String memberNum="";

		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql="select member_num from member where member_id=?";

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,myid);
			rs=pstmt.executeQuery();

			if(rs.next()) {
				memberNum=rs.getString("member_num");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs,pstmt,conn);
		}
		return memberNum;
	}

}
