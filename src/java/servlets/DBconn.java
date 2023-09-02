package servlets;






import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBconn {
    public static void main(String[] args) {
       try{
           System.out.println("test");
           getConnection();
       }
       catch(Exception e){
           System.out.println("Failed " + e);
       }
    }
    
    public static Connection getConnection() throws Exception{
            
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection cn = (Connection)
                DriverManager.getConnection("jdbc:mysql://localhost:3306/TheJobs?useSSL=false", "root", "sithum1023");
         System.out.println("Success!!!");
        return cn;
    } 
}