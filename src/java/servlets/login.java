package servlets;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.*;

/**
 *
 * @author HP
 */
@WebServlet(urlPatterns = {"/login"})
public class login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
         String email = request.getParameter("email");
         String password = request.getParameter("password");
         String role = request.getParameter("role");
         
    try {
        Connection cn = DBconn.getConnection();
        String query = "SELECT EXISTS (" +
                       "  SELECT * FROM users WHERE email = ? AND passwords = ? AND role = ?)";
        PreparedStatement statement = cn.prepareStatement(query);
        statement.setString(1, email);
        statement.setString(2, password);
        statement.setString(3, role);
        ResultSet resultSet = statement.executeQuery();
        HttpSession session = request.getSession();
        session.setAttribute("email", email);
        if (resultSet.next()) {
            int exists = resultSet.getInt(1);
            if(exists==1){
                if (role.equals("receptionist")) {

        
                    response.sendRedirect("receptionist.jsp");
                    
                }
                else if (role.equals("consultant")) {

        
                    response.sendRedirect("consultant.jsp");
                    
                }
                else if (role.equals("customer")){
                    
                    response.sendRedirect("homePage.jsp");
                }
            }
            
            else{
                if (email.equals("admin@TheJobs.com") && password.equals("admin123")) {

        
                    response.sendRedirect("admin.jsp");
                }
                
                else{
                
                    out.println("<script>alert('Invalid Credentials!');</script>");
                out.println("<script>window.location.href='index.jsp'</script>");
                }
                
            }
        }

        resultSet.close();
        statement.close();
        cn.close();
    } catch (Exception e) {
        System.out.println(e);
    }

        

         
        }
        catch(Exception e){
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
