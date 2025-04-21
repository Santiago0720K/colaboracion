<%-- 
    Document   : Login
    Created on : 21/04/2025, 9:02:54 a. m.
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
          <div>Ingreso Usuario</div> 
    <form name="Ingreso" action="ValidarUsuario" method="post"> 
        <br><br> 
        Usuario: <input type="text" name="usuario" value="" /> 
        <br><br> 
        Clave: <input type="password" name="clave" value="" /> 
        <br><br> 
        <input type="submit" value="Ingresar" /> 
        <br><br> 
    </form> 
    <h1>${mensaje}</h1> 
     
<%  
    Boolean valido = (Boolean)request.getAttribute("esValido"); 
    if (valido != null) {
        if (valido) {  
%> 
            <p>Bienvenido, ${usuario}!</p> 
            <p>Has iniciado sesión correctamente.</p> 
<%  
        } else { 
%> 
            <p>Usuario o contraseña incorrectos.</p> 
            <a href="login.html">Volver a intentar</a> 
<%  
        }
    }
%>
    </body>
</html>
