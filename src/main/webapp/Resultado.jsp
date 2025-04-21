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
    
<style>
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(120deg, #89f7fe 0%, #66a6ff 100%);
            font-family: 'Helvetica Neue', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }

        .container {
            background-color: #fff;
            padding: 50px 30px;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            text-align: center;
            width: 100%;
            max-width: 420px;
        }

        .icon-success, .icon-error {
            font-size: 60px;
            margin-bottom: 20px;
        }

        .icon-success {
            color: #38a169;
        }

        .icon-error {
            color: #e53e3e;
        }

        h1 {
            font-size: 24px;
            color: #2d3748;
            margin-bottom: 10px;
        }

        p {
            font-size: 16px;
            margin-bottom: 30px;
        }

        .btn {
            display: inline-block;
            margin: 10px 5px;
            padding: 12px 25px;
            border: none;
            border-radius: 30px;
            font-size: 15px;
            text-decoration: none;
            font-weight: 500;
            transition: background 0.3s ease;
            color: white;
        }

        .btn-return {
            background-color: #3182ce;
        }

        .btn-return:hover {
            background-color: #2b6cb0;
        }

        .btn-game {
            background-color: #38a169;
        }

        .btn-game:hover {
            background-color: #2f855a;
        }
    </style>
    
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
</html>
