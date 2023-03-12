package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connection.CommonUtility;
import connection.ConnectionUtility;

public class UserDao {
	public boolean insertData(User ur) {
		try {
			Connection con=ConnectionUtility.initializeDatabase();
			PreparedStatement ps=con.prepareStatement("Insert into users (name, username, email, password, mobile, created_at) values (?,?,?,?,?,?)");
			ps.setString(1, ur.getName());
			ps.setString(2, ur.getUsername());
			ps.setString(3, ur.getEmail());
			ps.setString(4, ur.getPassword());
			ps.setString(5, ur.getMobile());
			ps.setString(6, CommonUtility.getCurrentDateTime());
			
			System.out.println(ps.toString());
			int i=ps.executeUpdate();
			
			if(i>0) {
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
		
	}
	
	public User authenticateUser(String email, String password) {
		User u=new User();
		
		try {
			Connection con=ConnectionUtility.initializeDatabase();
			PreparedStatement ps=con.prepareStatement("select * from users where email = ? and password = ?");
			ps.setString(1, email);
			ps.setString(2, password);
			
			System.out.println(ps.toString());
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				u.setId(rs.getInt("id"));
				u.setEmail(rs.getString("email"));
				u.setMobile(rs.getString("mobile"));
				u.setUsername(rs.getString("username"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return u;
		
	}
	
	public User getUserDetailsByUid(int id) {
		User u=new User();
		Connection con=ConnectionUtility.initializeDatabase();
		try {
			PreparedStatement ps=con.prepareStatement("select * from users where id = ? ");
			ps.setInt(1, id);
			
			System.out.println(ps.toString());
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				u.setId(rs.getInt("id"));
				u.setEmail(rs.getString("email"));
				u.setMobile(rs.getString("mobile"));
				u.setUsername(rs.getString("username"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return u;
	}
	
	public boolean InsertLoginLog(Loginlog ll) throws SQLException {
		Connection con=ConnectionUtility.initializeDatabase();
		try {
			PreparedStatement ps=con.prepareStatement("Insert into login_log(user_id,ip_address,user_type,last_login,action) values (?,?,?,?,?)");
			ps.setInt(1, ll.getUser_id());
			ps.setString(2, ll.getIp_address());
			ps.setString(3, ll.getUser_type());
			ps.setString(4, ll.getLast_login());
			ps.setString(5, ll.getAction());
			
			int i =ps.executeUpdate();
			if(i>0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		con.close();
		return false;
		
	}
}
