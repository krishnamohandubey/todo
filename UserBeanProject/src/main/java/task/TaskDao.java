package task;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.CommonUtility;
import connection.ConnectionUtility;

public class TaskDao {
	public boolean save(Task tk) {
		 Connection con = ConnectionUtility.initializeDatabase();
		try {
			con.setAutoCommit(false);
			PreparedStatement ps=con.prepareStatement("Insert into tasks (user_id, task_name,priroty,task_date,start_time,end_time,created_at,task_description,task_end_date) values (?,?,?,?,?,?,?,?,?) RETURNING id");
			ps.setInt(1, tk.getUser_id());
			ps.setString(2,tk.getTask_name());
			ps.setInt(3, tk.getPriority());
			ps.setString(4, tk.getTask_date());
			ps.setString(5, tk.getStart_time());
			ps.setString(6, tk.getEnd_time());
			ps.setString(7, CommonUtility.getCurrentDateTime());
			ps.setString(8, tk.getTask_description());
			ps.setString(9, tk.getTask_end_date());
			
			System.out.println(ps.toString());
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				int task_id=rs.getInt("id");
				System.out.println("Task Id "+task_id);
			 	String[] subTask = tk.getSub_task_name();
			 	
			 	PreparedStatement ps1=con.prepareStatement("Insert into sub_task (task_id,user_id,sub_task_name,sub_created_at) values (?,?,?,?)");
				for( String q:subTask) {
					ps1.setInt(1, task_id);
					ps1.setInt(2, tk.getUser_id());
					ps1.setString(3, q);
					ps1.setString(4, CommonUtility.getCurrentDateTime());
					ps1.addBatch();
					
					System.out.println(ps1.toString());
				}
				
				int[] i = ps1.executeBatch();
				if(i.length > 0) {
					con.commit();
					return true;
				}else {
					con.rollback();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static List<Task> getTaskByUserId(int userId, String start_date, String end_date) {
		
		List<Task> list =new ArrayList<Task>();
		
		Connection con=ConnectionUtility.initializeDatabase();
		
		String SQL = "Select * from tasks where user_id = "+userId+" and task_status = true ";
		if(start_date != null && end_date != null) {
			 SQL += "and task_date >= '"+start_date+"' and task_end_date <= '"+end_date+"'  ";
		}
		
		try {
			PreparedStatement ps=con.prepareStatement(SQL);
			System.out.println(ps.toString());
			ResultSet rs=ps.executeQuery();
			
//			String[] subTaskName ;
			
			while(rs.next()) {
				
				Task task=new Task();
				
				
				
				task.setUser_id(rs.getInt("user_id"));
				task.setId(rs.getInt("id"));
				task.setTask_name(rs.getString("task_name"));
				task.setPriority(rs.getInt("priroty"));
				task.setTask_date(rs.getString("task_date"));
				task.setStart_time(rs.getString("start_time"));
				task.setEnd_time(rs.getString("end_time"));
				
				task.setCreated_at(rs.getString("created_at"));
				task.setTask_status(rs.getBoolean("task_status"));
				task.setTask_description(rs.getString("task_description"));
				task.setTask_end_date(rs.getString("task_end_date"));
				
				// how to set sub_task_name which is setter and getter inside task/Task.java ??
				
				//task.setSub_task_name(rs.getArray("sub_task_name"));
//				String sub_task_name = rs.getString("sub_task_name");
				
//				subTaskName[sub_task_name];
				
				
				
				list.add(task);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	} 
	
	public static List<Task> getTaskDetails(int taskId, int userId) {
		List<Task> list =new ArrayList<Task>();
		
		Connection con=ConnectionUtility.initializeDatabase();
		
		String SQL = "Select t.*,st.sub_task_name from tasks t INNER JOIN sub_task st on t.id=st.task_id where st.user_id= "+userId+" and st.task_id= "+taskId+" and task_status = true ";
		try {
			PreparedStatement ps=con.prepareStatement(SQL);
			System.out.println(ps.toString());
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				
				Task task=new Task();
				
				task.setUser_id(rs.getInt("user_id"));
				task.setId(rs.getInt("id"));
				task.setTask_name(rs.getString("task_name"));
				task.setPriority(rs.getInt("priroty"));
				task.setTask_date(rs.getString("task_date"));
				task.setStart_time(rs.getString("start_time"));
				task.setEnd_time(rs.getString("start_time"));
				
				task.setCreated_at(rs.getString("created_at"));
				task.setTask_status(rs.getBoolean("task_status"));
				task.setTask_description(rs.getString("task_description"));
				task.setTask_end_date(rs.getString("task_end_date"));
				
				
				// how to set sub_task_name which is setter and getter inside task/Task.java ??
				
				//task.setSub_task_name(rs.getArray("sub_task_name"));
				
				list.add(task);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static boolean deleteTask(int taskId) {
		 Connection con = ConnectionUtility.initializeDatabase();
		try {
			con.setAutoCommit(false);
			PreparedStatement ps=con.prepareStatement("UPDATE tasks SET task_status =? WHERE id = ?");
			ps.setBoolean(1, false);
			ps.setInt(2, taskId);
			System.out.println(ps.toString());
			
			int i=ps.executeUpdate();
			if(i>0) {
				PreparedStatement ps1=con.prepareStatement("UPDATE sub_task SET sub_task_status= ? where task_id = ?");
				ps1.setBoolean(1, false);
				ps1.setInt(2, taskId);
				System.out.println(ps1.toString());
				int j = ps1.executeUpdate();
				if(j >0) {
					con.commit();
					return true;	
				}else {
					con.rollback();
				}
				
			}else {
				con.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static boolean completeTask(int taskId) {
		  Connection con = ConnectionUtility.initializeDatabase();
		
		try {
			con.setAutoCommit(false);
			PreparedStatement ps=con.prepareStatement("UPDATE tasks SET is_completed = ? where id = ?");
			
			ps.setBoolean(1, true);
			ps.setInt(2, taskId);
			
			System.out.println(ps.toString());
			int i =ps.executeUpdate();
			if(i >0) {
				PreparedStatement ps1=con.prepareStatement("UPDATE sub_task SET is_completed = ? where task_id = ?");
				ps1.setBoolean(1, true);
				ps1.setInt(2, taskId);
				
				System.out.println(ps1.toString());
			    int j=ps1.executeUpdate();
			    if(j>0) {
			    	con.commit();
			    	return true;
			    }else {
			    	con.rollback();
			    }
			}else {
				con.rollback();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return false;
		
	}
}
