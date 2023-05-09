import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class logindao {
    String sql = "select * from admin where username = ? and password = ?";
    public boolean docheck(String id, String pass) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/amit","root","jayesh");
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1,id);
            st.setString(2,pass);

            ResultSet rs = st.executeQuery();
            if(rs.next()){
                return true;
            }
        }
        catch (Exception e){
            System.out.println("exception found" + e);
        }
        return false;
    }
}