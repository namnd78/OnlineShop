<%-- 
    Document   : historyorder
    Created on : Jul 11, 2022, 9:11:13 PM
    Author     : NamND
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order history</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet"
              href="fonts\FontAwesome.Pro.6.0.0.alpha3\fontawesome6\pro\css\all.min.css">
        <link rel="stylesheet" href="css/swiper-bundle.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <div class="main-wrapper">
            <jsp:include page="../common/header.jsp"/>

            <div class="page-header text-center d-flex align-items-center">
                <div class="container ">
                    <h1 class="page-title">Order History</h1>
                </div>
            </div>

            <div class="wishlist-main-area">
                <div class="container">
                    <div class="table-content wishlist-table-content">
                        <c:forEach items="${requestScope.orders}" var="order">
                            <table>
                                <div>
                                    <span>Oder date: ${order.orderTime}</span>
                                    <span>  -  Paid: ${order.getTotalVND()}</span>
                                    <span>  -  Status: ${order.orderState.name}</span>
                                </div>
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Product</th>
                                        <th></th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                        <th>Discount</th>
                                        <th>Sale Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${order.orderDetail}" var="orderDetail">
                                        <tr>
                                            <td>${orderDetail.product.id}</td>
                                            <td class="product-thumbnail">
                                                <img src="images/products/${orderDetail.product.images.get(0).image}" />
                                            </td>
                                            <td class="product-name">${orderDetail.product.name}</td>
                                            <td>${orderDetail.product.getOldPriceVND()}</td>
                                            <td>
                                                ${orderDetail.quantity}
                                            </td>
                                            <td>${orderDetail.getOldSubTotalVND()}</td>
                                            <td>${orderDetail.discount}</td>
                                            <td>${orderDetail.getNewSubTotalVND()}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <jsp:include page="../common/footer.jsp"/>
        </div>

        <!-- script -->
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery-3.6.0.min.js"></script>
        <script src="js/swiper-bundle.min.js"></script>
        <script src="js/main.js"></script>
    </body>

</html>
