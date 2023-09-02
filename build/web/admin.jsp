<%-- 
    Document   : admin
    Created on : Aug 22, 2023, 6:10:19 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, servlets.DBconn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <link rel="stylesheet" href="styles.css"/>
        <script>
            
            function openUserDetails(){
                
               window.location.href = 'viewUserDetails.jsp';
                
            }
            
            function openCreateEmployee(){
                
               window.location.href = 'createEmployee.jsp';
                
            }
            
            function viewAllReceps(){
                
               window.location.href = 'viewRecepDetails.jsp';
                
            }
            
             function viewAllConsultants(){
                
               window.location.href = 'viewConsultantDetails.jsp';
                
            }
            
            function logout(){
                
               window.location.href = 'index.jsp';
                
            }
            
        </script>
    </head>
    <body>
        <h1>Welcome Admin!</h1><br>
        <button onclick="openUserDetails()"> View User Account Details</button><br><br>
        <button onclick="openCreateEmployee()">Create Employee Account</button><br><br>
        <button onclick="viewAllReceps()">View Receptionist Accounts</button><br><br>
        <button onclick="viewAllConsultants()">View Consultant Accounts</button><br><br><br><br>
        <button onclick="logout()">Log Out</button>
        
        <footer style="margin-top: 150px;">
        <p>&copy; The Jobs Consultation Centre. Made By Sithum Edirisinghe (CL/BSCSD/26/100).</p>
    </footer>
    </body>
</html>
