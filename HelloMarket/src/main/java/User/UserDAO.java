package User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.websocket.Session;

public class UserDAO {

	public UserDAO() {
		
	}
	
	public int login(String user_email,String user_pwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String pass =null;
		String sql = "SELECT MD5(?)";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_pwd);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pass = rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println(pass);
		sql = "SELECT user_pwd FROM userlist_1 WHERE user_email=?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("user_pwd").equals(pass)) {
					return 1;
				}	
				else return 0;
			}
			return -1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	
	public UserDTO profile(String userId) {
		UserDTO userDTO = new UserDTO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT user_prof,seller_level,user_ph from userlist_1 where user_email = ?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				userDTO.setUserProf(rs.getString("user_prof"));
				userDTO.setSellerLevel(rs.getInt("seller_level"));
				userDTO.setUserPh(rs.getInt("user_ph"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return userDTO;
	}
	
	public void changeProfile(String userId,String changeProf) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "UPDATE userlist_1 set user_prof =? where user_email =?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, changeProf);
			pstmt.setString(2, userId);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void changePhone(String userId,int changePhone) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "UPDATE userlist_1 set user_ph =? where user_email =?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, changePhone);
			pstmt.setString(2, userId);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String selectUserNick(String user_email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String userNick;
		String sql = "SELECT user_nick FROM userlist_1 WHERE user_email=?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				userNick = rs.getString(1);
				return userNick;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "no";
	}
		
	public int join(UserDTO user) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserDAO setUser_nick = new UserDAO();
		String sql = "INSERT INTO userlist_1(user_email,user_pwd) values(?,MD5(?))";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPass());
			pstmt.executeUpdate();
			setUser_nick.set_userNick(user);
			return 0;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1;
	}

	public void set_userNick(UserDTO user) {
		int user_idx = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String user_nick = "";
		String sql = "select user_idx from userlist_1 where user_email=?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserId());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				user_idx = rs.getInt(1);
				user_nick = "n"+100000+user_idx;
				user.setUserNick(user_nick);
				user.setUserIdx(user_idx);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		sql ="update userlist_1 set user_nick=? where user_idx=?";
		try {
			conn= Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserNick());
			pstmt.setInt(2, user.getUserIdx());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void changeUserNick(String userId,String changeNick) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "UPDATE userlist_1 set user_nick = ? where user_email=?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, changeNick);
			pstmt.setString(2, userId);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int user_coupon(String userId) {
		int couponIdx=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "Select coupon_idx from userlist_1 where user_email = ?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				couponIdx = rs.getInt("coupon_idx");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return couponIdx;
	}
	
//	public UserDTO change_alarm(UserDTO userdto) {
//		Connection conn = null;
//		PreparedStatement pstmt = null; 
//
//		try {
//		String sql = "update userlist_1 set alarm_count='0' where user_email =?";
//		pstmt = conn.prepareStatement(sql);
//		pstmt.setString(1,userdto.getUserId());
//		pstmt.executeUpdate();
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//		return userdto;
//	}
}
