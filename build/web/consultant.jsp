<%-- 
    Document   : consultant
    Created on : Aug 23, 2023, 3:21:47 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, servlets.DBconn" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Receptionist</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        
        th {
            background-color: #f2f2f2;
            text-align: center;
        }
        
        tr:hover {
            background-color: #f5f5f5;
        }
        
        #btnApprove {
            background-color: greenyellow;
            border: none;
            color: black;
            padding: 8px 16px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            border-radius: 4px;
            cursor: pointer;
        }
        
        #btnApprove:hover {
            background-color: green;
        }
        
        .Btn{            
            background-color: #007bff;
            border: none;
            color: white;
            padding: 8px 16px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 10px;
            cursor: pointer;
        }
        
        .Btn:hover{
            background-color: #0056b3;
        }
        #txtEmail{
             border-radius: 20px;
        }
        
        footer {
            text-align: center;
            margin-top: 150px;
            padding-top: 10px;
            border-top: 1px solid #ccc;
        }
    </style>
</head>
<body>
    <h1 style="text-align: center">Appointment Details</h1>
    <form action="searchAppointmentRes" method="GET">
        <input type="text" id="txtEmail" name="email" placeholder="Enter Email">
        <button class="Btn" type="submit">Search</button>
    </form>
    <table border="1">
    <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Date</th>
        <th>Time</th>
        <th>Consultant</th>
        <th>Message</th>
        <th>Action</th>
    </tr>
    <%
        try {
            Connection conn = DBconn.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "SELECT * FROM appointments";
            ResultSet rs = stmt.executeQuery(sql);
            
            while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("date") %></td>
        <td><%= rs.getString("time") %></td>
        <td><%= rs.getString("consultant") %></td>
        <td><%= rs.getString("message") %></td>
        <td><a id="btnApprove" href="approveAppointment?email=<%= rs.getString("email") %>">Accept</a></td>
    </tr>
    <%
            }
            
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    </table><br>
<a class="Btn" href="index.jsp">Log Out</a>

    <footer>
            <p>&copy; The Jobs Consultation Centre. Made By Sithum Edirisinghe (CL/BSCSD/26/100).</p>
    </footer>
</body>
</html>
