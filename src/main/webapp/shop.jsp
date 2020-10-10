<%@ page import="java.util.Set" %>
<%@ page import="model.Item" %>
<%@ page import="service.PaymentService" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 09.10.2020
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="style.css">
    <title>Shop</title>
</head>
<body>
<div class="title">
    <h1>AVAILABLE PRODUCTS</h1>

</div>
<div class="container">

<ol>
    <%
        Set<Item> shopItems = (Set<Item>)request.getAttribute("shop");
        for(Item item : shopItems) {
    %>
    <li class="element">
        <p>
            <%=
        String.format("Id: %d, Name: %s, Price: %.2f",
                item.getId(), item.getName(), item.getPrice())
        %>
        </p>

        <form class="hidden" method="post" action="shop">
            <input type="hidden" name="id" value=<%= item.getId()%>/>

            <div class="buttons">
                <button class="button" type="submit" formaction="/shop?action=add">ADD</button>
                <button class="button" type="submit" formaction="/shop?action=del">DEL</button>
            </div>
        </form>
    </li>
    <%
        }
    %>
</ol>
    <p id="count">
        Items in cart: <span><%=PaymentService.cart.getItems().size() %></span>
    </p>

<a class="buy" href="${pageContext.request.contextPath}/buy">CART</a>

</div>
</body>
</html>
