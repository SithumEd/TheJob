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
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
/**
 *
 * @author HP
 */
public class MakeAppointment extends HttpServlet {

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
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String consultant = request.getParameter("consultant");
            String message = request.getParameter("message");

            try {
                Connection cn = DBconn.getConnection();
                String query = "INSERT INTO appointments (name, email, date, time, consultant, message) "
                             + "VALUES (?, ?, ?, ?, ?, ?)";

                PreparedStatement statement = cn.prepareStatement(query);
                statement.setString(1, name);
                statement.setString(2, email);
                statement.setString(3, date);
                statement.setString(4, time);
                statement.setString(5, consultant);
                statement.setString(6, message);

                int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) {
                    // Appointment inserted successfully
                    out.println("<!DOCTYPE html>");
                        out.println("<html>");
                        out.println("<head>");
                        out.println("<link rel=\"stylesheet\" href=\"styles.css\">");
                        out.println("</head>");
                        out.println("<body>");

                        out.println("<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@11.7.20/dist/sweetalert2.all.min.js\"></script>");
                        out.println("<link href=\"https://cdn.jsdelivr.net/npm/sweetalert2@11.7.20/dist/sweetalert2.min.css\" rel=\"stylesheet\">");
                        out.println("<script>");
                        out.println("Swal.fire({");
                        out.println("  title: 'Success!',");
                        out.println("  text: 'Appointment Made Successfully!',");
                        out.println("  icon: 'success',");
                        out.println("  confirmButtonText: 'Ok'");
                        out.println("}).then((result) => {");
                        out.println("  if (result.isConfirmed) {");
                        out.println("    window.location.href = 'bookAppointment.jsp';"); // Change to your homepage URL
                        out.println("  }");
                        out.println("});");
                        out.println("</script>");

                        out.println("</body>");
                        out.println("</html>");
                    
                } else {
                    // Something went wrong
                    out.println("<script>alert('Failed')</script>");
                }

                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
                // Handle database errors
                response.sendRedirect("appointmentError.jsp");
             } catch (Exception ex) {
                Logger.getLogger(MakeAppointment.class.getName()).log(Level.SEVERE, null, ex);
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

