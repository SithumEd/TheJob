/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 *
 * @author HP
 */
public class insertEmpServlet extends HttpServlet {

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
            int rowsInserted=0;
            String email = request.getParameter("email");
            String password = request.getParameter("password"); 
            String role = request.getParameter("role");
            try{
                   Connection cn = DBconn.getConnection();
                   String checkQuery = "SELECT COUNT(*) FROM users WHERE email = ?";
                    PreparedStatement checkStatement = cn.prepareStatement(checkQuery);
                    checkStatement.setString(1, email);
                    ResultSet resultSet = checkStatement.executeQuery();
                    resultSet.next();
                    int userCount = resultSet.getInt(1);
                    
                    if (userCount == 0){
                    
                        String insertQuery = "INSERT INTO users (email, passwords, role) VALUES (?, ?, ?)";
                        PreparedStatement insertStatement = cn.prepareStatement(insertQuery);
                        insertStatement.setString(1, email);
                        insertStatement.setString(2, password);
                        insertStatement.setString(3, role);
                        rowsInserted = insertStatement.executeUpdate();
                        
                        if (rowsInserted > 0) {
                        System.out.println("Employee added successfully!");
                        
                        
                        out.println("<!DOCTYPE html>");
                        out.println("<html>");
                        out.println("<head>");
                        out.println("<title>Your Page Title</title>");
                        out.println("<link rel=\"stylesheet\" href=\"styles.css\">");
                        out.println("</head>");
                        out.println("<body>");

                        out.println("<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@11.7.20/dist/sweetalert2.all.min.js\"></script>");
                        out.println("<link href=\"https://cdn.jsdelivr.net/npm/sweetalert2@11.7.20/dist/sweetalert2.min.css\" rel=\"stylesheet\">");
                        out.println("<script>");
                        out.println("Swal.fire({");
                        out.println("  title: 'Success!',");
                        out.println("  text: 'Employee Added Successfully!',");
                        out.println("  icon: 'success',");
                        out.println("  confirmButtonText: 'Ok'");
                        out.println("}).then((result) => {");
                        out.println("  if (result.isConfirmed) {");
                        out.println("    window.location.href = 'createEmployee.jsp';"); // Change to your homepage URL
                        out.println("  }");
                        out.println("});");
                        out.println("</script>");

                        out.println("</body>");
                        out.println("</html>");

                        
                        } else {
                            System.out.println("Insertion failed.");
                            out.println("<script>alert('Insertion failed.');</script>");
                        }
                        insertStatement.close();
                    }                    
                     else {
                        System.out.println("Employee with this email already exists. Data not inserted.");
                        
                         out.println("<!DOCTYPE html>");
                        out.println("<html>");
                        out.println("<head>");
                        out.println("<title>Your Page Title</title>");
                        out.println("<link rel=\"stylesheet\" href=\"styles.css\">");
                        out.println("</head>");
                        out.println("<body>");

                        out.println("<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@11.7.20/dist/sweetalert2.all.min.js\"></script>");
                        out.println("<link href=\"https://cdn.jsdelivr.net/npm/sweetalert2@11.7.20/dist/sweetalert2.min.css\" rel=\"stylesheet\">");
                        out.println("<script>");
                        out.println("Swal.fire({");
                        out.println("  title: 'Failed!',");
                        out.println("  text: 'This Email Already Exists!',");
                        out.println("  icon: 'error',");
                        out.println("  confirmButtonText: 'Ok'");
                        out.println("}).then((result) => {");
                        out.println("  if (result.isConfirmed) {");
                        out.println("    window.location.href = 'signup.jsp';"); // Change to your homepage URL
                        out.println("  }");
                        out.println("});");
                        out.println("</script>");

                        out.println("</body>");
                        out.println("</html>");
                        
                    }

                    resultSet.close();
                    checkStatement.close();
                    cn.close();
            }catch(Exception E){
                out.println(E);
            }
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
