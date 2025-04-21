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
    <style>
        body {
            font-family: 'Poppins', Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            margin: 0;
            padding: 30px;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            color: #444;
        }
        
        div {
            color: white;
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 25px;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2);
        }
        
        form {
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            padding: 30px;
            width: 350px;
            max-width: 100%;
            backdrop-filter: blur(10px);
        }
        
        input[type="text"], 
        input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            margin: 8px 0;
            border: none;
            border-radius: 6px;
            background-color: #f0f4f8;
            box-sizing: border-box;
            font-size: 14px;
            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
        }
        
        input[type="text"]:focus, 
        input[type="password"]:focus {
            background-color: #fff;
            box-shadow: 0 0 0 2px #a78bfa;
            outline: none;
        }
        
        input[type="submit"] {
            background: linear-gradient(to right, #8e2de2, #4a00e0);
            color: white;
            border: none;
            padding: 12px 0;
            font-size: 16px;
            font-weight: 500;
            border-radius: 6px;
            cursor: pointer;
            width: 100%;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0 1px 3px rgba(0, 0, 0, 0.08);
        }
        
        input[type="submit"]:hover {
            transform: translateY(-2px);
            box-shadow: 0 7px 14px rgba(50, 50, 93, 0.1), 0 3px 6px rgba(0, 0, 0, 0.08);
        }
        
        h1 {
            color: #5a67d8;
            font-size: 22px;
            margin-top: 30px;
            text-align: center;
        }
        
        p {
            font-size: 16px;
            line-height: 1.6;
            margin: 10px 0;
            text-align: center;
        }
        
        p:first-of-type {
            font-weight: 600;
            color: #4c51bf;
            font-size: 18px;
        }
        
        a {
            display: inline-block;
            margin-top: 15px;
            padding: 10px 20px;
            background: linear-gradient(to right, #4facfe 0%, #00f2fe 100%);
            color: white;
            text-decoration: none;
            border-radius: 50px;
            font-weight: 500;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0 1px 3px rgba(0, 0, 0, 0.08);
        }
        
        a:hover {
            transform: translateY(-2px);
            box-shadow: 0 7px 14px rgba(50, 50, 93, 0.1), 0 3px 6px rgba(0, 0, 0, 0.08);
        }
        
        @media (max-width: 480px) {
            form {
                width: 100%;
                padding: 20px;
            }
            
            div {
                font-size: 24px;
            }
        }
    </style>
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
