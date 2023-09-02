<%-- 
    Document   : bookAppointment
    Created on : Aug 27, 2023, 12:41:31 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, servlets.DBconn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Make Appointments</title>
    <style>
        

        body, h1, h2, p, ul, li, form {
            margin: 0;
            padding: 0;
        }

        
        body {
            background-color: #f4f4f4;
            font-family: Arial, sans-serif;
        }

        header {
            background-color: #007bff;
            color: #fff;
            padding: 10px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        nav ul {
            list-style: none;
            display: flex;
            align-items: center;
        }

        nav li {
            margin: 0 20px;
        }

        nav a {
            text-decoration: none;
            color: #fff;
        }

        
        .dropdown {
            position: relative;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #007bff;
            min-width: 150px;
            text-align: center;
            z-index: 1;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .intro {
            background-image: url('images/bg1.jpg'); 
            background-size: cover;
            background-position: center;
            text-align: center;
            padding: 100px 0;
            color: #fff;
        }
        .intro-content{
            
            background-color: rgba(0, 0, 0, 0.8); 
            padding: 20px;
            border-radius: 10px; 
            color: #fff;
            display: inline-block;
            
        }

        .input-row {
        display: flex;
        align-items: center;
        margin-bottom: 25px;
        position: relative;
        left: 500px;
        }

        .input-row label {
            width: 10%;
            padding-right: 50px;
        }

        .input-row input, .input-row select, .input-row textarea {
            width: 20%;
        }
        #submitBtn {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            position: relative;
            left: 700px;
        }

        button:hover {
            background-color: #0056b3;
        }

        footer {
            text-align: center;
            margin-top: 100px;
            padding-top: 10px;
            border-top: 1px solid #ccc;
        }

    </style>
</head>
<body>
    <header>
        <nav>
            <ul>
                <li><a href="homePage.jsp">Home</a></li>
                <li><a href="#">About Us</a></li>
                <li class="dropdown">
                    <span>Services</span>
                    <div class="dropdown-content">
                        <a href="bookAppointment.jsp">View Job Offers</a>
                        <a href="#s2">Book an Appointment</a>
                    </div>
                </li>
                <li><a href="#">Contact</a></li>
                <li><a href="index.jsp">Logout</a></li>
                <li>Welcome <%= session.getAttribute("email") %>!</li>
            </ul>
        </nav>
    </header>

    <section class="intro">
        <div class="intro-content">
            <h1>Welcome to The Jobs Consultation Centre</h1>
            <p>Your gateway to career success.</p>
        </div>
    </section>

    <section class="appointment-form">
        <h2 style="text-align: center;">Make an Appointment</h2><br>
        <form action="MakeAppointment" method="POST" class="appointment-form">
    
                <div class="input-row">
                    <label for="name">Your Name</label>
                    <input type="text" id="name" name="name" required>
                </div>

                <div class="input-row">
                    <label for="email">Your Email:</label>
                    <input type="email" id="email" name="email" required value=<%= session.getAttribute("email") %>>
                </div>

                <div class="input-row">
                    <label for="date">Preferred Date:</label>
                    <input type="date" id="date" name="date" required>
                </div>

                <div class="input-row">
                    <label for="time">Preferred Time:</label>
                    <input type="time" id="time" name="time" required>
                </div>

                <div class="input-row">
                    <label for="consultant">Preferred Consultant:</label>
                    <select id="consultant" name="consultant">
                        <option value="">Select a Consultant</option>
                        <%
                            try {
                                Connection conn = DBconn.getConnection();
                                String query = "SELECT email FROM users WHERE role = ?";
                                PreparedStatement statement = conn.prepareStatement(query);
                                statement.setString(1, "consultant");
                                ResultSet resultSet = statement.executeQuery();

                                while (resultSet.next()) {
                        %>
                        <option value="<%= resultSet.getString("email") %>"><%= resultSet.getString("email") %></option>
                        <%
                                }

                                resultSet.close();
                                statement.close();
                                conn.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </select>
                </div>

                <div class="input-row">
                    <label for="message">Additional Message:</label>
                    <textarea id="message" name="message" rows="4" cols="50"></textarea>
                </div>

                <input type="submit" value="Submit" id="submitBtn">
        </form>
    </section>

    <footer>
        <p>&copy; The Jobs Consultation Centre. Made By Sithum Edirisinghe (CL/BSCSD/26/100).</p>
    </footer>
</body>
</html>
