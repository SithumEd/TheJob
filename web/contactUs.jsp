<%-- 
    Document   : contactUs
    Created on : Sep 3, 2023, 1:38:24 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <style>
        
        body, h1, p, ul, li {
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        header {
            background-color: #007bff;
            color: #fff;
            padding: 10px 0;
            text-align: center;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        section {
            margin-bottom: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
            padding: 20px;
        }

        nav ul {
            list-style: none;
            display: flex;
            justify-content: center;
        }

        nav li {
            margin: 0 55px;
        }

        nav a {
            text-decoration: none;
            color: #fff;
        }

        h2 {
            color: #007bff;
        }

        .dropdown {
            position: relative;
            display: inline-block;
         }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.5);
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }
        
        .dropdown-content a {
            display: block;
            padding: 10px;
            text-decoration: none;
            color: black;
        }

        ul {
            list-style-type: disc;
            margin-left: 20px;
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
        <h1>Contact Us</h1><br>
        <nav>
            <ul>
                <li><a href="homePage.jsp">Home</a></li>
                <li><a href="about.jsp">About Us</a></li>
                <li class="dropdown">
                    <span>Services</span>
                    <div class="dropdown-content">
                        <a href="bookAppointment.jsp">Book an Appointment</a>
                    </div>
                </li>
                <li><a href="contactUs.jsp">Contact</a></li>
                <li><a href="index.jsp">Logout</a></li>
                <li>Welcome <%= session.getAttribute("email") %>!</li>
            </ul>
        </nav>
    </header>

    <div class="container">
        <section class="about">
            <h2>Jobs Consultant Center</h2>
            <p>Discover a wide range of job opportunities that match your skills and aspirations.</p>
            <p>Contact Us at TheJobs@gmail.com</p>
            <p>Or at 0714569371</p>
        </section>
    </div>

    <footer>
        <p>&copy; The Jobs Consultation Centre. Made By Sithum Edirisinghe (CL/BSCSD/26/100).</p>
    </footer>
</body>
</html>