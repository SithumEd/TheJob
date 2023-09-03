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
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author HP
 */
public class searchAppointmentCon extends HttpServlet {

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
            if(email.isEmpty()){
                   out.println("<script>window.location.href = 'viewUserDetails.jsp';</script>");
            }
        try {
            Connection conn = DBconn.getConnection();
            PreparedStatement pstmt = conn.prepareStatement("SELECT name, email, date, time, consultant, message FROM appointments WHERE email = ?");
            pstmt.setString(1, email);

            ResultSet rs = pstmt.executeQuery();
            
            StringBuilder userDetailsHTML = new StringBuilder();
            userDetailsHTML.append("<table border='1' style = 'border-collapse: collapse;\n" +
"            width: 30%; height: 10%; text-align:center;'>");
            userDetailsHTML.append("<tr><th>Email</th><th>Password</th></tr>");

            while (rs.next()) {
                userDetailsHTML.append("<tr style='background-color: #f6f6f6;'>");
                userDetailsHTML.append("<td>").append(rs.getString("name")).append("</td>");
                userDetailsHTML.append("<td>").append(rs.getString("email")).append("</td>");
                userDetailsHTML.append("<td>").append(rs.getString("date")).append("</td>");
                userDetailsHTML.append("<td>").append(rs.getString("time")).append("</td>");
                userDetailsHTML.append("<td>").append(rs.getString("consultant")).append("</td>");
                userDetailsHTML.append("<td>").append(rs.getString("message")).append("</td>");
                userDetailsHTML.append("<td><a style='color: white;\n" +
                "  background-color: greenyellow; color: black;\n" +
                "  padding: 5px 10px;\n" +
                "  border-radius: 3px;\n" +
                "  text-decoration: none;' href='approveAppointment?email=" + rs.getString("email") + "''>Approve</a></td>");
                                userDetailsHTML.append("</tr>");
            }
            
            userDetailsHTML.append("</table><br>");
            userDetailsHTML.append("<a style='background-color: #007bff;\n" +
            "border: none;\n" +
            "color: white;\n" +
            "padding: 8px 16px;\n" +
            "text-align: center;\n" +
            "text-decoration: none;\n" +
            "display: inline-block;\n" +
            "font-size: 16px;\n" +
            "border-radius: 10px;\n" +
            "cursor: pointer;' href=\"consultant.jsp\">Back To View All</a>");
            
            rs.close();
            pstmt.close();
            conn.close();

            response.setContentType("text/html");
            out.println("<html><body>");
            out.println("<h2>Search Results</h2>");
            out.println(userDetailsHTML.toString());
            out.println("</body></html>");
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
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
