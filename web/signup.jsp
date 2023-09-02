<%-- 
    Document   : signup
    Created on : Aug 20, 2023, 2:35:52 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sign Up</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styles.css"/>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.20/dist/sweetalert2.all.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.20/dist/sweetalert2.min.css" rel="stylesheet">
         
   </head>
    <body>
        <header>
        <h1>The Jobs Consultation Centre</h1>
    </header>


    <section id="signUp">
        <h2 style="justify-content: center;">Sign up</h2>
        <form action="signUp"  method="POST">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <label for="Cpassword">Confirm Password:</label>
            <input type="password" id="Cpassword" name="Cpassword" required>
            <input type="submit" value="Sign Up" id="signupBtn"><br>
            <p style="text-align: center;">Already Have An Account? <a href="index.jsp">Login Now!!</a></p>
            <script>
                document.getElementById("signupBtn").addEventListener('click',function(){
                    const password = document.getElementById('password').value;
                    const Cpassword = document.getElementById('Cpassword').value;
                    
                    if(password !==Cpassword){
                        Swal.fire({
                        title: 'Passwords Do Not Match!',
                        text: 'Please try Again',
                        icon: 'error',
                        confirmButtonText: 'Ok'
                      });
                        event.preventDefault();
                    }
                   else if (password.length < 5) {
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
    </section>
        <footer>
        <p>&copy; The Jobs Consultation Centre. Made By Sithum Edirisinghe (CL/BSCSD/26/100).</p>
    </footer>
    </body>
</html>
