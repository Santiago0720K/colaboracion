<%-- 
    Document   : Resultado
    Created on : 21/04/2025, 10:21:30 a. m.
    Author     : SENA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    

    
    <body>
        <body> 
    <div class="container">
        <%
            Boolean valido = (Boolean)request.getAttribute("esValido");
            if (valido != null && valido) {
        %>
            <div class="icon-success">✅</div>
            <h1>¡Acceso concedido!</h1>
            <p>Bienvenido, ${usuario}. Has iniciado sesión correctamente.</p>
            <a href="snake.html" class="btn btn-game">🎮 Jugar Snake</a>
        <%
            } else if (valido != null && !valido) {
        %>
            <div class="icon-error">❌</div>
            <h1>Acceso denegado</h1>
            <p>Usuario o contraseña incorrectos.</p>
            <a href="login.html" class="btn btn-return">🔙 Volver al login</a>
        <%
            } else {
        %>
            <h1>Esperando datos...</h1>
            <p>No se ha enviado información para validar.</p>
        <%
            }
        %>
    </div>
</body> 
    </body>
</html>
