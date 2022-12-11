
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class PSsearch extends HttpServlet {
    
    public void init() throws jakarta.servlet.ServletException{
        System.out.println("The system is ready to be used.");
    }   
    
    public void service() throws IOException, jakarta.servlet.ServletException {
        System.out.println("The system is processing.");
    }
    
   public void destroy(){
        System.out.println("The system is destroyed.");  
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html;charset-UTF-8");
         PrintWriter out = response.getWriter();
        
         String IC = request.getParameter("IC");
          try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PSAS", "root", "");
            Statement st = con.createStatement();

           String sql = "SELECT * FROM PerantiSiswa where IC = " + IC;
           ResultSet resultSet = st.executeQuery(sql);
            out.println("<a href='index.html'>Home</a>");
            out.println("<h2>Peranti Siswa Application Result</h2>");
           if (resultSet.next()){
               String result  = resultSet.getString("Status"); // Retreive selected data from the database
               
               if (result.equals("Pending")){
                   out.println("Your Peranti Siswa application is still pending.");
               }
               else if (result.equals("Success")){
                   out.println("Your Peranti Siswa application is successful.");
               }
               else{
                   out.println("Your Peranti Siswa application is not successful.");
               }
           }
           else{
               out.println("Your haven't apply for Peranti Siswa yet,");
           }
           
            destroy();
        }
        catch (Exception e) {
            out.println(e);
        }
    }

}
