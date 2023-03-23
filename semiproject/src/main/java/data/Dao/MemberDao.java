package data.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.Dto.MemberDto;
import mysql.db.dbConnect;

public class MemberDao {

	dbConnect db=new dbConnect();
	
	//id중복체크
	public int isIdCheck(String id)
	{
		int isid=0;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select count(*) from member where member_id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next())  //해당아이디 존재하면 1,존재하지않으면 0
			{
				/*if(rs.getInt(1)==1)
					isid=1;*/
				isid=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		
		
		return isid;
	}
	
	//id에 따른 name값 리턴
	public String getName(String member_id)
	{
		String name="";
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from member where member_id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, member_id);
			rs=pstmt.executeQuery();
			
			if(rs.next())
				name=rs.getString("member_name");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		
		return name;
	}
	
	//insert
	public void insertMember(MemberDto dto)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into member values(null,?,?,?,?,?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getMember_name());
			pstmt.setString(2, dto.getMember_addr());
			pstmt.setString(3, dto.getMember_hp());
			pstmt.setString(4, dto.getMember_pass());
			pstmt.setString(5, dto.getMember_id());
			pstmt.setString(6, dto.getMember_email());
			pstmt.setString(7, dto.getMember_birth());


			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	//전체목록 출력
	public List<MemberDto> getAllMembers()
	{
		List<MemberDto> list=new Vector<>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from member order by member_id";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				MemberDto dto=new MemberDto();
				
				dto.setMember_num(rs.getString("member_num"));
				dto.setMember_name(rs.getString("member_name"));
				dto.setMember_addr(rs.getString("member_addr"));
				dto.setMember_hp(rs.getString("member_hp"));
				dto.setMember_pass(rs.getString("member_pass"));
				dto.setMember_id(rs.getString("member_id"));
				dto.setMember_email(rs.getString("member_email"));
				dto.setMember_birth(rs.getString("member_birth"));

				
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
	
	
	//삭제
	public void deleteMember(String num)
	{
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from member where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	
	//아이디와 비번 체크
	public boolean isIdPassCheck(String member_id,String member_pass)
	{
		boolean b=false;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from member where member_id=? and member_pass=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, member_id);
			pstmt.setString(2, member_pass);
			rs=pstmt.executeQuery();
			
			if(rs.next())
				b=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		
		return b;
	}
	
	//id에 따른 num값 리턴
		public String getNum(String member_id)
		{
			String num="";
			
			Connection conn=db.getConnection();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select num from member where member_id=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, member_id);
				rs=pstmt.executeQuery();
				
				if(rs.next())
					num=rs.getString("num");
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			
			return num;
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