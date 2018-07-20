<%@include file="cabecalho.jsp"%>
<%
    if (request.getParameter("Id") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    AutorDAO autordao = new AutorDAO();
    Autor autor = new Autor();
    autor = autordao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("Id")));
%>
<section class="single_product_details_area section_padding_0_100">
    <div class="container">
        <div class="row">

            <div class="col-12 col-md-6">
                <div class="single_product_thumb">
                    <a class="gallery_img" href="../arquivos/<%=autor.getFoto()%>">
                        <img src = "../arquivos/<%=autor.getFoto()%>" width="300" height = "400" />
                    </a>
                </div>
            </div>
    <div class="col-12 col-md-6">
        <div class="single_product_desc">
            <h4 class="title"><a href="#"><%=autor.getNome()%></a></h4>
            <div id="accordion" role="tablist">
                <div class="card">
                    <div class="card-header" role="tab" id="headingOne">
                        <h6 class="mb-0">
                            <a data-toggle="collapse" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Nome: </a>
                        </h6>
                    </div>

                    <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion">
                        <div class="card-body">
                            <p><%=autor.getNome()%></p>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header" role="tab" id="headingThree">
                        <h6 class="mb-0">
                            <a class="collapsed" data-toggle="collapse" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">Nacionalidade:</a>
                        </h6>
                    </div>
                    <div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree" data-parent="#accordion">
                        <div class="card-body">
                            <p> <%=autor.getNacionalidade()%></p>
                        </div>
                    </div>
                </div>
                <div class="card">        
                    <div class="card-header" role="tab" id="headingFour">
                        <h6 class="mb-0">
                            <a class="collapsed" data-toggle="collapse" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">Sexo:</a>
                        </h6>
                    </div>
                    <div id="collapseFour" class="collapse" role="tabpanel" aria-labelledby="headingFour" data-parent="#accordion">
                        <div class="card-body">
                            <p><%=autor.getSexo()%></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
        </div>
</section>
<%@include file="rodape.jsp"%>