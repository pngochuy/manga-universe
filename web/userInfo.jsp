<%-- 
    Document   : userInfo
    Created on : Sep 23, 2023, 9:20:43 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Form Đăng Ký</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-image: url("./images/venus-sky-night-background-asset-game-2d-futuristic-generative-ai.jpg");
            }

            .container {
                max-width: 400px;
                margin: 0 auto;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #f4f4f4;

            }

            .form-group {
                margin-bottom: 20px;
            }

            label {
                display: block;
                font-weight: bold;
            }

            input[type="text"],
            input[type="email"],
            input[type="tel"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 3px;
            }

            select {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 3px;
            }

            .btn {
                background-color: #007BFF;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 3px;
                cursor: pointer;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <%
                String status = request.getParameter("status");
                if (status != null && status.equals("success")) {%>
            <span class="">
                <input type="checkbox" class="alertCheckbox" autocomplete="off" />
                <div class="alert warning">
                    <span class="alertClose">X</span>
                    <span class="alertText">Please enter personal information to verify your account within 10 seconds
                        <br class="clear"/></span>
                </div>
            </span>
            <%}
//                HttpSession session = request.getSession();
                session.setMaxInactiveInterval(10); // 30s  
                session.setAttribute("user", session.getAttribute("user"));
            %>
            Status: ${status}<br>
            User: ${user}
            <h2>Form Basic</h2>
            <form id="registration-form" method="POST" action="UserInfomationServlet">
                <img class="w-6 h-6 rounded-full" src="${picture != null ? picture : 'https://randomuser.me/api/portraits/men/1.jpg' }" />
                <div class="form-group">
                    <label for="first-name">Username:</label>
                    <input type="text" id="username" name="username" value="${sessionScope.user.getUsername() != null ? sessionScope.user.getUsername() : ''}" required>
                </div>
                <div class="form-group">
                    <label for="last-name">Full Name:</label>
                    <input type="text" id="fullName" name="name" value="${name != null ? name : ''}" required>
                </div>
                <div class="form-group">
                    <label for="gender">Gender:</label>

                    <select id="gender" name="gender" required>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select>


                </div>
                <div class="form-group">
                    <label for="role">Role:</label>
                    <select id="role" name="role" required>
                        <option value="Free">Free</option>
                        <option value="Premium">Premium</option>
                        <option value="Author">Author</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="${email != null ? email : sessionScope.user.getEmail()}" required>
                </div>
                <div class="form-group">
                    <label for="phone">Phone:</label>
                    <input type="tel" id="phone" name="phone" required>
                </div>
                <button type="submit" class="btn">Save</button>
<!--                <input type="submit" name="signin" id="signin"
                       class="form-submit" value="Save" />-->
            </form>
        </div>


    </body>

</html>
