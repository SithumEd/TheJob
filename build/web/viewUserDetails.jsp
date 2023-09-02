<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, servlets.DBconn" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin</title>
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
        
        #btnDelete {
            background-color: #f44336;
            border: none;
            color: white;
            padding: 8px 16px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            border-radius: 4px;
            cursor: pointer;
        }
        
        #btnDelete:hover {
            background-color: #d32f2f;
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
    <h1 style="text-align: center">Account Details</h1>
    <form action="SearchUserServlet" method="GET">
        <input type="text" id="txtEmail" name="email" placeholder="Enter Email">
        <button class="Btn" type="submit">Search</button>
    </form>
    <table border="1">
    <tr>
        <th>Email</th>
        <th>Password</th>
        <th>Action</th>
    </tr>
    <%
        try {
            Connection conn = DBconn.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "SELECT email, passwords FROM users WHERE role = 'customer'";
            ResultSet rs = stmt.executeQuery(sql);
            
            while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("passwords") %></td>
        <td><a id="btnDelete" href="DeleteUserServlet?email=<%= rs.getString("email") %>">Delete</a></td>
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
<a class="Btn" href="admin.jsp">Back To Admin Panel</a>

    <footer>
            <p>&copy; The Jobs Consultation Centre. Made By Sithum Edirisinghe (CL/BSCSD/26/100).</p>
    </footer>
</body>
</html>