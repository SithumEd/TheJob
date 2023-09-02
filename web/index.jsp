<%-- 
    Document   : index
    Created on : Aug 20, 2023, 2:34:36 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The Jobs Consultation Centre</title>
    <link rel="stylesheet" href="styles.css"/>
</head>
<body>
    <header>
        <h1>The Jobs Consultation Centre</h1>
    </header>

    <section id="login">
        <h2>Login</h2>
        <form action="login"  method="POST">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <select id="role" name="role">
                 <option value="customer">Customer</option>
                <option value="receptionist">Receptionist</option>
                <option value="consultant">Consultant</option>
            </select>
            <button type="submit" id="loginBtn">Login</button><br>
            <p style="text-align: center">No Account? <a href="signup.jsp">Sign Up Now!</a></p>
        </form>   
    </section>

    <footer>
        <p>&copy; The Jobs Consultation Centre. Made By Sithum Edirisinghe (CL/BSCSD/26/100).</p>
    </footer>
</body>
</html>
