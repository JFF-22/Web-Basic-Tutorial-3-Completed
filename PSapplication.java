
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class PSapplication extends HttpServlet {
    
    
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset-UTF-8");
        PrintWriter out = response.getWriter();
        
        // Get input from html web page
        String P_Name = request.getParameter("P_Name");
        String P_IC = request.getParameter("P_IC");
        String P_Registration_Number = request.getParameter("P_Registration_Number");
        String P_Address = request.getParameter("P_Address");
        String P_Education_Institution = request.getParameter("P_Education_Institution");
        String M_Name = request.getParameter("M_Name");
        String M_IC = request.getParameter("M_IC");
        String F_Name = request.getParameter("F_Name");
        String F_IC = request.getParameter("F_IC");
        String MF_Income = request.getParameter("MF_Income");
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/PSAS", "root", "");
            Statement st = con.createStatement();

            // Insert new data into database
            // PerantiSiswa is the example of table name
            // Name, IC, etc is the example of column name
            int i = st.executeUpdate("INSERT INTO PerantiSiswa(Name, IC, RegNum, Address, Edu_Institution, M_Name, M_IC, F_Name, F_IC, Income, Status)"
                        + "values(' " + P_Name + " ',' " + P_IC + " ',' " + P_Registration_Number + " ',' " + P_Address + " ',' " + P_Education_Institution + " ',' " + M_Name  + " ',' " + 
                    M_IC + " ',' " + F_Name + " ',' " + F_IC  + " ',' " + MF_Income  +  " ','Pending') ");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Your Application Submitted Successfully!');");
            out.println("location='index.html';");
            out.println("</script>");
            destroy();
        }
        catch (Exception e) {
            out.println(e);
        }
    }


}
