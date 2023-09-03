<%-- 
    Document   : homePage
    Created on : Aug 20, 2023, 6:34:04 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The Jobs Consultation Centre</title>
    <style>
        
        
        body, h1, h2, p, ul, li {
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #007bff;
            color: #fff;
            padding: 10px 0;
            opacity: 80%;
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

        .intro {
            background-image: url('images/bg1.jpg');
            background-size: cover;
            background-position: center; 
            text-align: center;
            padding: 200px 0;
        }
        .intro-content {
            background-color: rgba(0, 0, 0, 0.8); 
            padding: 20px;
            border-radius: 10px; 
            color: #fff;
            display: inline-block;
        }
        .features {
            display: flex;
            justify-content: center;
            padding: 50px 0;
        }

        .feature {
            text-align: center;
            margin: 0 20px;
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
        footer {
            text-align: center;
            margin-top: 10px;
            padding-top: 10px;
            border-top: 1px solid #ccc;
        }

        @media (max-width: 768px) {
            nav ul {
                flex-direction: column;
                align-items: center;
            }
            nav li {
                margin: 10px 0;
            }
        }

        
    </style>
</head>
<body>
    <header>
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
                <li><a href="#">Contact</a></li>
                <li><a href="index.jsp">Logout</a></li>
                <li>Welcome <%= session.getAttribute("email") %>!</li>
            </ul>
        </nav>
    </header>
    
    <section class="intro">
        <div class="intro-content">
            <h1 style="font-size: 30px">Welcome to The Jobs Consultation Centre</h1>
            <p>Your gateway to career success.</p>
            
        </div>
    </section>
    
    <section class="features">
        <div class="feature">
            <h2>Expert Consultation</h2>
            <p>Our experienced consultants provide expert advice to help you make informed career decisions.</p>
        </div>
        <div class="feature">
            <h2>Job Opportunities</h2>
            <p>Discover a wide range of job opportunities that match your skills and aspirations.</p>
        </div>
        <div class="feature">
            <h2>Resume Building</h2>
            <p>We offer assistance in creating compelling resumes that stand out to potential employers.</p>
        </div>
    </section>
    
    <footer>
            <p>&copy; The Jobs Consultation Centre. Made By Sithum Edirisinghe (CL/BSCSD/26/100).</p>
    </footer>
</body>
</html>

