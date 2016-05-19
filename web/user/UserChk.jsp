<%-- 
    Document   : UserChk
    Created on : May 17, 2016, 6:00:20 PM
    Author     : divinity
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    
        <c:if test = "${sessionScope.user == null||sessionScope.user != 'demo'}">  	
            ${sessionScope.invalidate}
             <jsp:forward page="error.html" />
        </c:if>
        
    </body>
</html>
