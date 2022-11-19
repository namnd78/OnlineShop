<%-- 
    Document   : brands
    Created on : Jul 18, 2022, 9:10:04 PM
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
        <title>Brands Manager</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet"
              href="fonts\FontAwesome.Pro.6.0.0.alpha3\fontawesome6\pro\css\all.min.css">
        <link rel="stylesheet" href="css/swiper-bundle.min.css">
        <link rel="stylesheet" href="css/styleadmin.css">
    </head>

    <body>
        <div class="position-relative bg-white d-flex p-0">
            <!-- Sidebar Start -->
            <div class="sidebar pe-4 pb-3">
                <nav class="navbar bg-light navbar-light">
                    <div class="navbar-nav w-100">
                        <a href="dashboardadmin" class="nav-item nav-link"><i class="fa-solid fa-gauge-high"></i>Dashboard</a>
                        <a href="categoriesmanage" class="nav-item nav-link"><i class="fa-solid fa-sitemap"></i>Categories</a>
                        <a href="brandsmanage" class="nav-item nav-link active"><i class="fa-solid fa-copyright"></i>Brands</a>
                        <a href="productsmanage" class="nav-item nav-link"><i class="fa-brands fa-product-hunt"></i>Products</a>
                        <a href="accountsmanage" class="nav-item nav-link"><i class="fa-solid fa-address-card"></i>Accounts</a>
                    </div>
                </nav>
            </div>
            <!-- Sidebar End -->


            <!-- Content Start -->
            <div class="content">
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="col-sm-6">
                            <a class="btn btn-sm btn-primary mb-2" href="addbrand">Create new brand</a>
                            <div class="bg-light rounded h-100 p-4">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${brands}" var="b">
                                            <tr>
                                                <td>${b.id}</td>
                                                <td>${b.name}</td>
                                                <td><a class="btn btn-sm btn-primary" href="updatebrand?bid=${b.id}">Edit</a></td>
                                                <td><a class="btn btn-sm btn-primary" onclick="doDelete('${b.id}')">Delete</a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div></div>

        <!-- script -->
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery-3.6.0.min.js"></script>
        <script src="js/swiper-bundle.min.js"></script>
        <script src="js/main.js"></script>
        <script>
                                                    function doDelete(id) {
                                                        if (confirm("Are you sure to delete brand with id " + id + "?")) {
                                                            window.location = "deletebrand?bid=" + id;
                                                        }
                                                    }
        </script>
    </body>

</html>
