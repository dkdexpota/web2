<%@ page import="com.example.dd.RequestDataList" %>
<%@ page import="com.example.dd.RequestData" %><%--
  Created by IntelliJ IDEA.
  User: sia khas
  Date: 21.10.2021
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Result</title>
    <link rel="stylesheet" href="main.css">

</head>
    <body>
        <div class="header_text">
            <div class="info_block">
                Щепелев Артур Вячеславович
            </div>
            <div class="info_block">
                P3232
            </div>
            <div class="info_block">
                Вариант: 32014
            </div>
        </div>
        <div id="box_content">
            <div id="content">
                <table class="results">
                    <tr>
                        <th>X</th>
                        <th>Y</th>
                        <th>R</th>
                        <th>Result</th>
                    </tr>
                    <%
                        RequestDataList names = (RequestDataList) pageContext.getServletContext().getAttribute("requestData");
                    %>
                    <%if(names!=null) {%>
                    <%="<tr>"%>
                    <%="<td>" + names.getRequestDataList().get(names.getLen() - 1).getX() + "</td>"%>
                    <%="<td>" + names.getRequestDataList().get(names.getLen() - 1).getY() + "</td>"%>
                    <%="<td>" + names.getRequestDataList().get(names.getLen() - 1).getR() + "</td>"%>
                    <%="<td>" + names.getRequestDataList().get(names.getLen() - 1).isCheck() + "</td>"%>
                    <%="</tr>"%>
                    <%}%>
                </table>
                <button id="back" onclick="window.location.href = '/dd-1.0-SNAPSHOT';" value="w3docs">
                    Back
                </button>
            </div>
        </div>
    </body>
</html>
