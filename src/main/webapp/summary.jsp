<%@ page import="model.Item" %>
<%@ page import="java.util.List" %>
<%@ page import="service.PaymentService" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 10.10.2020
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="style.css">
    <title>Shopping list</title>
</head>
<body>
<div class="title">
    <h1>CART CONTENT</h1>

</div>
    <div class="container">
        <ol>
            <%
                List<Item> cart = (List<Item>)request.getAttribute("cart");
                for(int i = 0; i < cart.size(); i++) {
            %>
            <li class="element">
                <p>
                    <%=
                    String.format("%d. %s, Price: %.2f",
                            i+1, cart.get(i).getName(), cart.get(i).getPrice())
                    %>
                </p>

            </li>
            <%
                }
            %>
        </ol>
        <p id="count">
            Total price: <span><%=PaymentService.totalPrice()%></span>
        </p>
        <a class="buy" href="${pageContext.request.contextPath}/shop">SHOP</a>
    </div>
</body>
</html>