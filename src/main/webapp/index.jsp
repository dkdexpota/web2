<%@ page import="com.example.dd.RequestData" %>
<%@ page import="com.example.dd.RequestDataList" %>
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="lab1">
    <meta name="Keywords" content="">
    <title> Lab1 </title>
    <link rel="stylesheet" href="main.css">

    <script type="text/javascript">
        function validate() {
            var y = document.getElementById("coord_y");
            const all_y = String(y.value).split(".");
            if (!((all_y.length == 1 && (y.value ^ 0) == y.value) || (all_y.length == 2 && (all_y[0] ^ 0) == all_y[0] && (all_y[1] ^ 0) == all_y[1]))) {
                event.preventDefault();
                alert("Type an float");
            } else if (parseInt(y.value) <= -3 || parseInt(y.value) >= 3) {
                event.preventDefault();
                alert("Between -3 to 3");
            }

        }
        function switch_aria(num, name) {
            const xButtons = document.getElementsByName(name);
            for (let i = 0; i < xButtons.length; i++) {
                if (xButtons[i].getAttribute("aria-pressed") === "true") {
                    xButtons[i].setAttribute("aria-pressed", "false");
                }
            }
            xButtons[num].setAttribute("aria-pressed", "true");
            if (name=="button_x") {
                document.getElementsByName("coord_x")[0].setAttribute("value", xButtons[num].getAttribute("value"));
            } else {
                document.getElementsByName("radius")[0].setAttribute("value", xButtons[num].getAttribute("value"));
            }

        }
    </script>
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
        <div id="svg_check">
            <svg xmlns="http://www.w3.org/2000/svg" width="300" height="300">
                <line x1="0" y1="150" x2="300" y2="150" stroke="#003"></line>
                <line x1="150" y1="0" x2="150" y2="300" stroke="#003"></line>
                <polygon points="300,150 295,145 295,155" fill="#003" stroke="#000"></polygon>
                <polygon points="150,0 145,5 155,5" fill="#003" stroke="#000"></polygon>
                <line x1="270" y1="155" x2="270" y2="145" stroke="#000"></line>
                <line x1="210" y1="155" x2="210" y2="145" stroke="#000"></line>
                <line x1="90" y1="155" x2="90" y2="145" stroke="#000"></line>
                <line x1="30" y1="155" x2="30" y2="145" stroke="#000"></line>
                <line x1="145" y1="30" x2="155" y2="30" stroke="#000"></line>
                <line x1="145" y1="90" x2="155" y2="90" stroke="#000"></line>
                <line x1="145" y1="210" x2="155" y2="210" stroke="#000"></line>
                <line x1="145" y1="270" x2="155" y2="270" stroke="#000"></line>
                <polygon points="210,150 150,30 150,150" fill="#00f" stroke="#003" fill-opacity="0.5"></polygon>
                <rect height="120" width="120" x="150" y="150" fill-opacity="0.5" fill="#00f" stroke="#003"></rect>
                <path stroke="#003" d="M 150 150 L 30 150 C 30 210 90 270 150 270" fill-opacity="0.5" fill="#00f"></path>
                <%
                    RequestDataList pointObj = (RequestDataList) pageContext.getServletContext().getAttribute("requestData");
                    if(pointObj!=null) {
                        for (RequestData s : pointObj.getRequestDataList()) {
                            out.println("<circle name=\"points\" xyr=\""+s.getX()+" "+s.getY()+" "+s.getR()+"\" cx=\""+ ( 150 + (s.getX()*120/s.getR()))+"\" cy=\""+ (150 + ((-1) * s.getY()*120/s.getR())) +"\" r=\"5\" stroke=\"black\" stroke-width=\"1\" fill=\"yellow\" />");
                        }
                    }
                %>
                <text x="157" y="35" class="rad_text">R</text>
                <text x="23" y="140" class="rad_text">-R</text>
                <text x="75" y="140" class="rad_text">-R/2</text>
                <text x="200" y="140" class="rad_text">R/2</text>
                <text x="265" y="140" class="rad_text">R</text>
                <text x="157" y="215" class="rad_text">-R/2</text>
                <text x="157" y="95" class="rad_text">R/2</text>
                <text x="157" y="275" class="rad_text">-R</text>
            </svg>
            <p id="print_text"></p>
        </div>

        <form method="GET" action="treatment">
            <div class="input_form">
                <label>X:</label>
                <input type="button" name="button_x" value="-2" aria-pressed="true" onclick="switch_aria(0, 'button_x')">
                <input type="button" name="button_x" value="-1.5" aria-pressed="false" onclick="switch_aria(1, 'button_x')">
                <input type="button" name="button_x" value="-1" aria-pressed="false" onclick="switch_aria(2, 'button_x')">
                <input type="button" name="button_x" value="-0.5" aria-pressed="false" onclick="switch_aria(3, 'button_x')">
                <input type="button" name="button_x" value="0" aria-pressed="false" onclick="switch_aria(4, 'button_x')">
                <input type="button" name="button_x" value="0.5" aria-pressed="false" onclick="switch_aria(5, 'button_x')">
                <input type="button" name="button_x" value="1" aria-pressed="false" onclick="switch_aria(6, 'button_x')">
                <input type="button" name="button_x" value="1.5" aria-pressed="false" onclick="switch_aria(7, 'button_x')">
                <input type="button" name="button_x" value="2" aria-pressed="false" onclick="switch_aria(8, 'button_x')">
                <input type="hidden" name="coord_x" value="-2">
            </div>
            <div class="input_form">
                <label>Y:</label>
                <input type="text" placeholder="(-3; 3)" id="coord_y" name="coord_y" required="" maxlength="5">
            </div>
            <div class="input_form">
                <label>R:</label>
                <input type="button" name="button_radius" value="1" aria-pressed="true" onclick="switch_aria(0, 'button_radius')">
                <input type="button" name="button_radius" value="2" aria-pressed="false" onclick="switch_aria(1, 'button_radius')">
                <input type="button" name="button_radius" value="3" aria-pressed="false" onclick="switch_aria(2, 'button_radius')">
                <input type="button" name="button_radius" value="4" aria-pressed="false" onclick="switch_aria(3, 'button_radius')">
                <input type="button" name="button_radius" value="5" aria-pressed="false" onclick="switch_aria(4, 'button_radius')">
                <input type="hidden" name="radius" value="1" id="rad">
            </div>
            <div class="input_form">
                <button type="submit" onclick="validate()">Check</button>
            </div>
        </form>

        <form action="clear">
            <div class="input_form">
                <button type="submit">Clear</button>
            </div>
        </form>
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
            <%for (RequestData s : names.getRequestDataList()) {%>
            <%="<tr>"%>
            <%="<td>" + s.getX() + "</td>"%>
            <%="<td>" + s.getY() + "</td>"%>
            <%="<td>" + s.getR() + "</td>"%>
            <%="<td>" + s.isCheck() + "</td>"%>
            <%="</tr>"%>
            <%}%>
            <%}%>
        </table>
    </div>
</div>
</body>
<script src="mouse_find.js"></script>
</html>