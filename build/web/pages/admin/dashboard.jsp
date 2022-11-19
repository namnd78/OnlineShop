<%-- 
    Document   : products
    Created on : Jul 14, 2022, 5:25:37 AM
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
        <title>Dashboard</title>
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
                        <a href="dashboardadmin" class="nav-item nav-link active"><i class="fa-solid fa-gauge-high"></i>Dashboard</a>
                        <a href="categoriesmanage" class="nav-item nav-link"><i class="fa-solid fa-sitemap"></i>Categories</a>
                        <a href="brandsmanage" class="nav-item nav-link"><i class="fa-solid fa-copyright"></i>Brands</a>
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
                        <div class="col-sm-6 col-xl-3">
                            <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                <i class="fa fa-chart-line fa-3x text-primary"></i>
                                <div class="ms-3">
                                    <p class="mb-2">Total Revenue</p>
                                    <h6 class="mb-0">${totalRevenue}</h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xl-3">
                            <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                <i class="fa fa-chart-bar fa-3x text-primary"></i>
                                <div class="ms-3">
                                    <p class="mb-2">Total Quantity Sold</p>
                                    <h6 class="mb-0">${totalQuantity}</h6>
                                </div>
                            </div>
                        </div>
                        <!--                        <div class="col-sm-6 col-xl-3">
                                                    <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                                        <i class="fa fa-chart-area fa-3x text-primary"></i>
                                                        <div class="ms-3">
                                                            <p class="mb-2">Today Revenue</p>
                                                            <h6 class="mb-0">$1234</h6>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 col-xl-3">
                                                    <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                                        <i class="fa fa-chart-pie fa-3x text-primary"></i>
                                                        <div class="ms-3">
                                                            <p class="mb-2">Total Revenue</p>
                                                            <h6 class="mb-0">$1234</h6>
                                                        </div>
                                                    </div>
                                                </div>-->
                    </div>
                </div>

            </div></div>

        <!-- script -->
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery-3.6.0.min.js"></script>
        <script src="js/swiper-bundle.min.js"></script>
        <script src="js/main.js"></script>
    </body>

</html>
