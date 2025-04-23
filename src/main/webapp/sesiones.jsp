<%-- 
    Document   : sesiones
    Created on : 23/04/2025, 7:30:44 a. m.
    Author     : SENA
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
<head> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
    <title>Manejo de Sesiones</title> 
    <style type="text/css">
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
            color: #333;
            line-height: 1.6;
        }
        
        h1 {
            color: #0066cc;
            border-bottom: 2px solid #0066cc;
            padding-bottom: 10px;
            text-align: center;
        }
        
        h2 {
            color: #007bff;
            margin-top: 20px;
            border-left: 5px solid #007bff;
            padding-left: 10px;
        }
        
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        .info-section {
            background-color: #f0f8ff;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            border-left: 4px solid #0066cc;
        }
        
        .client-info {
            background-color: #f0fff0;
            border-left: 4px solid #2e8b57;
        }
        
        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        
        input[type="submit"] {
            background-color: #0066cc;
            color: white;
            border: none;
            padding: 10px 15px;
            margin: 10px 0;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
        }
        
        input[type="submit"]:hover {
            background-color: #004080;
        }
        
        .session-data {
            margin-top: 20px;
            padding: 15px;
            background-color: #fffaf0;
            border-radius: 5px;
            border-left: 4px solid #ffa500;
        }
        
        .clear-button {
            background-color: #ff6b6b;
        }
        
        .clear-button:hover {
            background-color: #ff3333;
        }
    </style>
</head> 
<body> 
    <div class="container">
        <h1>Manejo de Sesiones en JSP</h1> 
         
        <% 
            // Incrementar contador de visitas 
            Integer visitas = (Integer) session.getAttribute("contadorVisitas"); 
            if (visitas == null) { 
                visitas = 1; 
            } else { 
                visitas++; 
            } 
            session.setAttribute("contadorVisitas", visitas); 
             
            // Obtener datos del cliente 
            String navegador = request.getHeader("User-Agent"); 
        %> 
         
        <div class="info-section">
            <h2>Información de sesión:</h2> 
            <p>ID de sesión: <%= session.getId() %></p> 
            <p>Número de visitas: <%= visitas %></p> 
            <p>Fecha de primera visita:  
            <%  
                if(session.getAttribute("primeraVisita") == null) { 
                    session.setAttribute("primeraVisita", new java.util.Date()); 
                } 
                out.print(session.getAttribute("primeraVisita")); 
            %> 
            </p> 
        </div>
         
        <div class="info-section client-info">
            <h2>Información del cliente:</h2> 
            <p>Tu navegador es: <%= navegador %></p> 
            <p>Tu dirección IP es: <%= request.getRemoteAddr() %></p> 
        </div>
         
        <h2>Formulario para agregar datos a la sesión:</h2> 
        <form method="post"> 
            Nombre: <input type="text" name="nombre"><br>
            Color favorito: <input type="text" name="color"><br>
            <input type="submit" value="Guardar en sesión"> 
        </form> 
         
        <% 
            // Procesar formulario 
            if(request.getMethod().equals("POST")) { 
                String nombre = request.getParameter("nombre"); 
                String color = request.getParameter("color"); 
                 
                if(nombre != null && !nombre.trim().isEmpty()) { 
                    session.setAttribute("nombreUsuario", nombre); 
                } 
                 
                if(color != null && !color.trim().isEmpty()) { 
                    session.setAttribute("colorFavorito", color); 
                } 
            } 
             
            // Mostrar datos guardados 
            String nombreGuardado = (String) session.getAttribute("nombreUsuario"); 
            String colorGuardado = (String) session.getAttribute("colorFavorito"); 
        %> 
         
        <% if(nombreGuardado != null || colorGuardado != null) { %> 
            <div class="session-data">
                <h2>Datos guardados en sesión:</h2> 
                <% if(nombreGuardado != null) { %> 
                    <p>Nombre: <%= nombreGuardado %></p> 
                <% } %> 
                <% if(colorGuardado != null) { %> 
                    <p>Color favorito: <%= colorGuardado %></p> 
                <% } %> 
                <form method="post" action="?accion=limpiar"> 
                    <input type="hidden" name="accion" value="limpiar"> 
                    <input type="submit" value="Limpiar sesión" class="clear-button"> 
                </form> 
            </div>
        <% } %> 
         
        <% 
            // Limpiar sesión 
            if("limpiar".equals(request.getParameter("accion"))) { 
                session.invalidate(); 
                response.sendRedirect("sesiones.jsp"); 
            } 
        %> 
    </div>
</body> 
</html>
