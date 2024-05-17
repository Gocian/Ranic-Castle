<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>
<%
Connection conn=null;
String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:rncdb";

Boolean connect=false;
try{
	Class.forName(driver);
	conn=DriverManager.getConnection(url, "gocian", "1234");
	
	connect=true;
	
}catch(Exception e){
	connect=false;
	e.printStackTrace();
	
	conn.close();
}
%>    
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Personal Website</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }
        header {
            background-color: #4CAF50;
            color: white;
            padding: 15px 0;
            text-align: center;
        }
        nav {
            display: flex;
            justify-content: center;
            background-color: #333;
        }
        nav a {
            color: white;
            padding: 14px 20px;
            text-decoration: none;
            text-align: center;
        }
        nav a:hover {
            background-color: #575757;
        }
        .container {
            padding: 20px;
            max-width: 1200px;
            margin: auto;
        }
        .content {
            display: flex;
            flex-wrap: wrap;
        }
        .content .card {
            background-color: white;
            margin: 15px;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            flex: 1;
            min-width: 280px;
            max-width: 300px;
        }
        footer {
            text-align: center;
            padding: 10px 0;
            background-color: #333;
            color: white;
        }
    </style>
</head>
<body>

<header>
    <h1>Welcome to My Website</h1>
</header>

<nav>
    <a href="#home">Home</a>
    <a href="#about">About</a>
    <a href="#services">Services</a>
    <a href="#contact">Contact</a>
</nav>

<div class="container">
    <section class="content">
        <div class="card">
            <h2>About Me</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non urna nec felis luctus euismod.</p>
        </div>
        <div class="card">
            <h2>My Services</h2>
            <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
        </div>
        <div class="card">
            <h2>Contact</h2>
            <p>Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>
            
 <%if(connect==true){%>
	DB 연결됨
<%}else{ %>
    DB 연결실패
 <%} %>
 
        </div>
    </section>
</div>



<footer>
    <p>&copy; 2024 My Personal Website</p>
</footer>

</body>
</html>