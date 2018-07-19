<%@page import="util.StormData"%>
<%@page import="modelo.Livro"%>
<%@page import="dao.LivroDAO"%>
<%@include file="cabecalho.jsp" %>
<%
    if (request.getParameter("Id") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    Livro livro = new Livro();
    livro = livrodao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("Id")));


%>
<!-- <<<<<<<<<<<<<<<<<<<< Single Product Details Area Start >>>>>>>>>>>>>>>>>>>>>>>>> -->
<section class="single_product_details_area section_padding_0_100">
    <div class="container">
        <div class="row">

            <div class="col-12 col-md-6">
                <div class="single_product_thumb">
                    <div id="product_details_slider" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <a class="gallery_img" href="../arquivos/<%=livro.getImagem1()%>">
                                    <img src = "../arquivos/<%=livro.getImagem1()%>" width="300" height = "400" />
                                </a>
                            </div>
                            <div class="carousel-item">
                                <a class="gallery_img" href="../arquivos/<%=livro.getImagem2()%>">
                                    <img src = "../arquivos/<%=livro.getImagem2()%>" width="300" height = "400" />
                                </a>
                            </div>
                            <div class="carousel-item">
                                <a class="gallery_img" href="../arquivos/<%=livro.getImagem3()%>">
                                    <img src = "../arquivos/<%=livro.getImagem3()%>"width="300" height = "400" />
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 col-md-6">
                <div class="single_product_desc">

                    <h4 class="title"><a href="#"><%=livro.getNome()%></a></h4>

                    <h4 class="price"><%=livro.getPreco()%></h4>

                    <p class="available">Avaliação: <span class="text-muted">Em estoque</span></p>

                    <div class="single_product_ratings mb-15">
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star" aria-hidden="true"></i>
                        <i class="fa fa-star-o" aria-hidden="true"></i>
                    </div>

                </div>

                <!-- Add to Cart Form -->
                <form class="cart clearfix mb-50 d-flex" method="post">
                    <div class="quantity">
                        <span class="qty-minus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if (!isNaN(qty) & amp; & amp; qty & gt; 1) effect.value--; return false;"><i class="fa fa-minus" aria-hidden="true"></i></span>
                        <input type="number" class="qty-text" id="qty" step="1" min="1" max="12" name="quantity" value="1">
                        <span class="qty-plus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if (!isNaN(qty))
                                                effect.value++;
                                            return false;"><i class="fa fa-plus" aria-hidden="true"></i></span>
                    </div>
                    <a  href="carrinho.jsp?Id=<%=livro.getId()%>"  class="btn cart-submit d-block">Adicionar ao Carrinho</a>
                </form>

                <div id="accordion" role="tablist">
                    <div class="card">
                        <div class="card-header" role="tab" id="headingOne">
                            <h6 class="mb-0">
                                <a data-toggle="collapse" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Sinopse</a>
                            </h6>
                        </div>

                        <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion">
                            <div class="card-body">
                                <p><%=livro.getSinopse()%></p>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" role="tab" id="headingTwo">
                            <h6 class="mb-0">
                                <a class="collapsed" data-toggle="collapse" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">Autores: </a>
                            </h6>
                        </div>
                        <div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo" data-parent="#accordion">
                            <div class="card-body">
                                <p>
                                    <%for (Autor a : livro.getAutorList()) {
                                    %>
                                    <a href="detalhe_autor.jsp?id=<%=a.getId()%>"><%=a.getNome()%></a>
                                    <%}%></p>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" role="tab" id="headingThree">
                            <h6 class="mb-0">
                                <a class="collapsed" data-toggle="collapse" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">Data de Publicação:</a>
                            </h6>
                        </div>
                        <div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree" data-parent="#accordion">
                            <div class="card-body">
                                <p> <%=StormData.formata(livro.getDatapublicacao())%></p>
                            </div>
                        </div>
                    </div>
                    <div class="card">        
                        <div class="card-header" role="tab" id="headingFour">
                            <h6 class="mb-0">
                                <a class="collapsed" data-toggle="collapse" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">Editora:</a>
                            </h6>
                        </div>
                        <div id="collapseFour" class="collapse" role="tabpanel" aria-labelledby="headingFour" data-parent="#accordion">
                            <div class="card-body">
                                <p><%=livro.getEditora()%></p>
                            </div>
                        </div>
                    </div>
                    <div class="card">                                        
                        <div class="card-header" role="tab" id="headingFive">
                            <h6 class="mb-0">
                                <a class="collapsed" data-toggle="collapse" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">Categoria:</a>
                            </h6>
                        </div>
                        <div id="collapseFive" class="collapse" role="tabpanel" aria-labelledby="headingFive" data-parent="#accordion">
                            <div class="card-body">
                                <p><%=livro.getCategoria()%></p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>
<%@include file="rodape.jsp" %>