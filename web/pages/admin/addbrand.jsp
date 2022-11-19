<%-- 
    Document   : addbrand
    Created on : Jul 19, 2022, 5:17:00 AM
    Author     : NamND
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add brand</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet"
              href="fonts\FontAwesome.Pro.6.0.0.alpha3\fontawesome6\pro\css\all.min.css">
        <link rel="stylesheet" href="css/swiper-bundle.min.css">
        <link rel="stylesheet" href="css/styleadmin.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
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
                        <div class="card mb-3">
                            <div class="card-body">
                                <form action="addbrand" method="post">
                                    <div class="row">
                                        <div class="col-sm-3 d-flex align-items-center text-center">
                                            <h6>Brand Name</h6>
                                        </div>
                                        <div class="col-sm-9">
                                            <input type="text" name="name">
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-12 mt-2 mb-2">
                                            <button type="submit" class="btn-2 btn">Save</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- script -->
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery-3.6.0.min.js"></script>
        <script src="js/swiper-bundle.min.js"></script>
        <script src="js/main.js"></script>
</body>
</html>
