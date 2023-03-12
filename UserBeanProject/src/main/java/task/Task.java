package task;

public class Task {
	int id;
	int user_id;
	
	String task_name;
	int priority;
	String task_date;
	String task_end_date;
	
	String start_time;
	String end_time;
	String task_description;
	
	String created_at;
	boolean task_status;
	
	String[] sub_task_name;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getTask_name() {
		return task_name;
	}
	public void setTask_name(String task_name) {
		this.task_name = task_name;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
	public String getTask_date() {
		return task_date;
	}
	public void setTask_date(String task_date) {
		this.task_date = task_date;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public boolean isTask_status() {
		return task_status;
	}
	public void setTask_status(boolean task_status) {
		this.task_status = task_status;
	}
	public String[] getSub_task_name() {
		return sub_task_name;
	}
	public void setSub_task_name(String[] sub_task_name) {
		this.sub_task_name = sub_task_name;
	}
	
	public String getTask_description() {
		return task_description;
	}
	public void setTask_description(String task_description) {
		this.task_description = task_description;
	}
	
	
	public String getTask_end_date() {
		return task_end_date;
	}
	public void setTask_end_date(String task_end_date) {
		this.task_end_date = task_end_date;
	}
	
	
	
}
