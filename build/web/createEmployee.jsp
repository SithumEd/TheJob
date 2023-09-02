<%-- 
    Document   : createReceptionist
    Created on : Aug 23, 2023, 12:04:04 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Receptionist</title>
        <link rel="stylesheet" href="styles.css"/>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.20/dist/sweetalert2.all.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.20/dist/sweetalert2.min.css" rel="stylesheet">
        <style>
            
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
            
        </style>
    </head>
    <body>
        <h1 style = "text-align: center;">Create A Employee Account</h1><br>
         <form action="insertEmpServlet"  method="POST">
            <label for="email">Employee Email:</label>
            <input type="email" id="email" name="email" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <label for="Cpassword">Confirm Password:</label>
            <input type="password" id="Cpassword" name="Cpassword" required>
            <label for="role">Role:</label>
            <select id="role" name="role">
                <option value="receptionist">Receptionist</option>
                <option value="consultant">Consultant</option>
            </select>
            <input type="submit" value="Sign Employee Up" id="EsignupBtn"><br>
            <p style="text-align: center;">Already Have An Account? <a href="index.jsp">Login Now!!</a></p>
            <script>
                document.getElementById("EsignupBtn").addEventListener('click', function(event) {
                    const password = document.getElementById('password').value;
                    const Cpassword = document.getElementById('Cpassword').value;

                    if (password !== Cpassword) {
                        Swal.fire({
                            title: 'Passwords Do Not Match!',
                            text: 'Please try Again',
                            icon: 'error',
                            confirmButtonText: 'Ok'
                        });
                        event.preventDefault();
                    } else if (password.length < 5) {
                        Swal.fire({
                            title: 'Password Should be Longer Than 4 Characters',
                            text: 'Please try Again',
                            icon: 'error',
                            confirmButtonText: 'Ok'
                        });
                        event.preventDefault();
                    }
                });
            </script>

        </form>
        <a class="Btn" href="admin.jsp">Back To Admin Panel</a>
        <footer style=" margin-top: 100px;">
        <p>&copy; The Jobs Consultation Centre. Made By Sithum Edirisinghe (CL/BSCSD/26/100).</p>
    </footer>
    </body>
</html>
