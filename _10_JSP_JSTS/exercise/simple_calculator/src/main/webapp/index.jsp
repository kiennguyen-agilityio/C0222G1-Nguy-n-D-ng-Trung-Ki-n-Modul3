<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 27/5/2022
  Time: 3:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <style>
        #content {
            width: 450px;
            margin: 0;
            padding: 0px 20px 20px;
            background: white;
            border: solid navy 2px;
        }

        label {
            width: 10em;
            padding-right: 1em;
            float: left;
        }

        #data input {
            float: left;
            width: 15em;
            margin-bottom: 5em;
        }
    </style>
</head>
<body>
<div id="content">
    <h1> Simple Calculator</h1>
    <form action="/calculator" method="get">
        <div id="data">
            <label> number 1 </label>
            <input type="number" name="number1" >
            <br>
            <label for="operator" > Operator </label>
            <select id="operator"  name="operator">
                <option value="Addition">Addition</option>
                <option value="Subtraction">Subtraction</option>
                <option value="Multiplication">Multiplication</option>
                <option value="Division">Division</option>
            </select>
            <br>
            <label> number 2 </label>
            <input type="number" name="number2">
            <br>
            <p>Ket qua: ${result}</p>
        </div>
        <div>
            <button type="submit">Calculate</button>
        </div>
    </form>
</div>
</body>
</html>
