<%-- 
    Document   : updateproduct
    Created on : Jul 14, 2022, 6:24:02 AM
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
        <title>Add product</title>
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
                    <a href="brandsmanage" class="nav-item nav-link"><i class="fa-solid fa-copyright"></i>Brands</a>
                    <a href="productsmanage" class="nav-item nav-link active"><i class="fa-brands fa-product-hunt"></i>Products</a>
                    <a href="accountsmanage" class="nav-item nav-link"><i class="fa-solid fa-address-card"></i>Accounts</a>
                </div>
            </nav>
        </div>
        <!-- Sidebar End -->

        <!-- Content Start -->
        <div class="content">
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-12">
                        <div class="card mb-3">
                            <div class="card-body">
                                <form action="addproduct" method="post">
                                    <div class="row">
                                        <div class="col-sm-3 d-flex align-items-center text-center">
                                            <h6>Name</h6>
                                        </div>
                                        <div class="col-sm-7">
                                            <input type="text" name="name">
                                        </div>
                                    </div>
                                    <hr>

                                    <div class="row">
                                        <div class="col-sm-3 d-flex align-items-center text-center">
                                            <h6>CategoryID</h6>
                                        </div>
                                        <div class="col-sm-7">
                                            <input type="number" name="categoryId" required />
                                        </div>
                                    </div>
                                    <hr>

                                    <div class="row">
                                        <div class="col-sm-3 d-flex align-items-center text-center">
                                            <h6>BrandID</h6>
                                        </div>
                                        <div class="col-sm-7">
                                            <input type="number" name="brandId"
                                                   required />
                                        </div>
                                    </div>
                                    <hr>

                                    <div class="row">
                                        <div class="col-sm-3 d-flex align-items-center text-center">
                                            <h6>Release Date</h6>
                                        </div>
                                        <div class="col-sm-7">
                                            <input name="releaseDate" type="date" required />
                                        </div>
                                    </div>
                                    <hr>

                                    <div class="row">
                                        <div class="col-sm-3 d-flex align-items-center text-center">
                                            <h6>Description</h6>
                                        </div>
                                        <div class="col-sm-7">
                                            <input name="description" type="text"
                                                   required />
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3 d-flex align-items-center text-center">
                                            <h6>Specification</h6>
                                        </div>
                                        <div class="col-sm-7">
                                            <textarea class="editor" name="specification" id="content"></textarea>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3 d-flex align-items-center text-center">
                                            <h6>Price</h6>
                                        </div>
                                        <div class="col-sm-3">
                                            <input type="number" name="price">
                                        </div>
                                        <div class="col-sm-3 d-flex align-items-center text-center">
                                            <h6>Discount</h6>
                                        </div>
                                        <div class="col-sm-3">
                                            <input type="number" name="discount">
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3 d-flex align-items-center text-center">
                                            <h6>Quantity</h6>
                                        </div>
                                        <div class="col-sm-3">
                                            <input type="number" name="quantity">
                                        </div>
                                        <div class="col-sm-3 d-flex align-items-center text-center">
                                            <h6>StateID</h6>
                                        </div>
                                        <div class="col-sm-3">
                                            <input type="number" name="stateId">
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
        <script src="library/ckeditor/build/ckeditor.js"></script>
        <script>ClassicEditor
                    .create(document.querySelector('.editor'), {
                        ckfinder: {
                            options: {
                                resourceType: 'Images'
                            },
                            <!-- Only upload image to ckeditor's server -->
                            <!--uploadUrl: '<%=request.getContextPath()%>/images/review',-->
                            uploadUrl: 'https://ckeditor.com/apps/ckfinder/3.5.0/core/connector/php/connector.php?command=QuickUpload&type=Files&responseType=json'},

                    })
                    .then(editor => {
                        window.editor = editor;
                    })
                    .catch(error => {
                    });
        </script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery-3.6.0.min.js"></script>
        <script src="js/swiper-bundle.min.js"></script>
        <script src="js/main.js"></script>
</body>
</html>
