package max;

public class EmpDao {
	public boolean insertData(Emp b) {
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("Dao : "+b.getUid()+" "+b.getPassword()+" "+b.getAddress());
		return false;
		
		
	}
}
