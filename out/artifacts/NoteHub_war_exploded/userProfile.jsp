<%--
  Created by IntelliJ IDEA.
  User: Zichen Sun
  Date: 9/2/2018
  Time: 上午1:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>image</title>
</head>
<body>
    <%
        String url;
        String email;
        if(session.getAttribute("image")==null){
            response.sendRedirect("index.jsp");
        }
        url = (String)session.getAttribute("image");
        email = (String)session.getAttribute("email");
    %>
    Email: <%=email%> </br>
    Image: </br>
<img src= <%=url%> />
</body>
</html>
