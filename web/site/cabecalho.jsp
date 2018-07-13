<%@page import="dao.LivroDAO"%>
<%@page import="modelo.Editora"%>
<%@page import="dao.EditoraDAO"%>
<%@page import="modelo.Autor"%>
<%@page import="dao.AutorDAO"%>
<%@page import="modelo.Livro"%>
<%@page import="modelo.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoriaDAO"%>
<!DOCTYPE html>
<%
    CategoriaDAO cdao = new CategoriaDAO();
    List<Categoria> listar = cdao.listar();
    AutorDAO adao = new AutorDAO();
    List<Autor> lista = adao.listar();
    EditoraDAO edao = new EditoraDAO();
    List<Editora> elista = edao.listar();
    LivroDAO livrodao = new LivroDAO();
    List<Livro> listas = livrodao.listar();
    
    
    
%>
<html lang="pt-br">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!-- Title  -->
        <title>Karl - Fashion Ecommerce Template | Home</title>

        <!-- Favicon  -->
        <link rel="icon" href="img/core-img/favicon.ico">

        <!-- Core Style CSS -->
        <link rel="stylesheet" href="css/core-style.css">
        <link rel="stylesheet" href="style.css">

        <!-- Responsive CSS -->
        <link href="css/responsive.css" rel="stylesheet">

    </head>

    <body>
        <div id="wrapper">

            <!-- ****** Header Area Start ****** -->
            <header class="header_area">
                <!-- Top Header Area Start -->
                <div class="top_header_area">
                    <div class="container h-100">
                        <div class="row h-100 align-items-center justify-content-end">

                            <div class="col-12 col-lg-7">
                                <div class="top_single_area d-flex align-items-center">
                                    <!-- Logo Area -->
                                    <div class="top_logo">
                                        <a href="#"><img src="img/core-img/logo.png" alt=""></a>
                                    </div>
                                    <!-- Cart & Menu Area -->
                                    <div class="header-cart-menu d-flex align-items-center ml-auto">
                                        <!-- Cart Area -->
                                        <div class="cart">
                                            <a href="#" id="header-cart-btn" target="_blank"><span class="cart_quantity">2</span> <i class="ti-bag"></i> Your Bag $20</a>
                                            <!-- Cart List Area Start -->
                                            <ul class="cart-list">
                                                <li>
                                                    <a href="#" class="image"><img src="img/product-img/product-10.jpg" class="cart-thumb" alt=""></a>
                                                    <div class="cart-item-desc">
                                                        <h6><a href="#">Women's Fashion</a></h6>
                                                        <p>1x - <span class="price">$10</span></p>
                                                    </div>
                                                    <span class="dropdown-product-remove"><i class="icon-cross"></i></span>
                                                </li>
                                                <li>
                                                    <a href="#" class="image"><img src="img/product-img/product-11.jpg" class="cart-thumb" alt=""></a>
                                                    <div class="cart-item-desc">
                                                        <h6><a href="#">Women's Fashion</a></h6>
                                                        <p>1x - <span class="price">$10</span></p>
                                                    </div>
                                                    <span class="dropdown-product-remove"><i class="icon-cross"></i></span>
                                                </li>
                                                <li class="total">
                                                    <span class="pull-right">Total: $20.00</span>
                                                    <a href="carrinho.jsp" class="btn btn-sm btn-cart">Cart</a>
                                                    <a href="formulario.jsp" class="btn btn-sm btn-checkout">Checkout</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Top Header Area End -->
                <div class="main_header_area">
                    <div class="container h-100">
                        <div class="row h-100">
                            <div class="col-12 d-md-flex justify-content-between">
                                <!-- Menu Area -->
                                <div class="main-menu-area">
                                    <nav class="navbar navbar-expand-lg align-items-start">

                                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#karl-navbar" aria-controls="karl-navbar" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"><i class="ti-menu"></i></span></button>

                                        <div class="collapse navbar-collapse align-items-start collapse" id="karl-navbar">
                                            <ul class="navbar-nav animated" id="nav">
                                                <li class="nav-item active"><a class="nav-link" href="index.jsp">Home</a></li>
                                                <li class="nav-item dropdown">
                                                    <a class="nav-link dropdown-toggle" href="#" id="karlDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Pages</a>
                                                    <div class="dropdown-menu" aria-labelledby="karlDropdown">
                                                        <a class="dropdown-item" href="index.jsp">Home</a>
                                                        <a class="dropdown-item" href="">Shop</a>
                                                        <a class="dropdown-item" href="produto.jsp">Detalhes do Produto</a>
                                                        <a class="dropdown-item" href="carrinho.jsp">Carrinho</a>
                                                        <a class="dropdown-item" href="formulario.jsp">Formulario do Cliente</a>
                                                    </div>
                                                </li>
                                                <li class="nav-item dropdown">
                                                    <a class="nav-link dropdown-toggle" href="#" id="karlDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Autores</a>
                                                    <div class="dropdown-menu" aria-labelledby="karlDropdown">
                                                        <%for (Autor item : lista) {
                                                        %>
                                                        <a class="dropdown-item" href="index.jsp?autorid=<%=item.getId()%>"><%=item.getNome()%></a>
                                                        <%}%>
                                                    </div>
                                                </li>
                                                <li class="nav-item dropdown">
                                                    <a class="nav-link dropdown-toggle" href="#" id="karlDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Editoras</a>
                                                    <div class="dropdown-menu" aria-labelledby="karlDropdown">
                                                        <%for (Editora item : elista) {
                                                        %>
                                                        <a class="dropdown-item" href="index.jsp?editoraid=<%=item.getCnpj()%>"><%=item.getNome()%></a>
                                                        <%}%>
                                                    </div>
                                                </li>
                                                  <li class="nav-item dropdown">
                                                    <a class="nav-link dropdown-toggle" href="#" id="karlDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Categorias</a>
                                                    <div class="dropdown-menu" aria-labelledby="karlDropdown">
                                                        <%for (Categoria item : listar) {
                                                        %>
                                                        <a class="dropdown-item" href="index.jsp?categoriaid=<%=item.getId()%>"><%=item.getNome()%></a>
                                                        <%}%>
                                                    </div>
                                                </li>
                                                <li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
                                            </ul>
                                        </div>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>


