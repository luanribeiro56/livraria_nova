<%@page import="java.util.List"%>
<%@page import="modelo.Livro"%>
<%@page import="dao.LivroDAO"%>
<%@include file="cabecalho.jsp" %>
<%
    
    if (request.getParameter("categoriaid")!= null) {
        
        Integer id = Integer.parseInt(request.getParameter("categoriaid"));
        Categoria c = cdao.buscarPorChavePrimaria(id);
        listas = c.getLivroList();    
        }
  
    else if (request.getParameter("autorid")!= null) {
        
        Integer id = Integer.parseInt(request.getParameter("autorid"));
        Autor a = adao.buscarPorChavePrimaria(id);
        listas = a.getLivroList();    
        }
  
    else if (request.getParameter("editoraid")!= null) {
        
        String id = request.getParameter("editoraid");
        Editora e = edao.buscarPorChavePrimaria(id);
        listas = e.getLivroList();    
        }
    else{
        listas = livrodao.listar();
    }
    %>

    <div class="modal fade" id="quickview" tabindex="-1" role="dialog" aria-labelledby="quickview" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                <div class="modal-content">
                    <button type="button" class="close btn" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>

                    <div class="modal-body">
                        <div class="quickview_body">    
                            <div class="container">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <section class="new_arrivals_area section_padding_100_0 clearfix">
    <!--Inicia lista de livros-->
    <%
        for (Livro livro : listas) {
                
        %>
    <div class="container">
                <div class="row karl-new-arrivals">

                    <!-- Single gallery Item Start -->
                    <div class="col-12 col-sm-6 col-md-4 single_gallery_item women wow fadeInUpBig" data-wow-delay="0.2s">
                        <!-- Product Image -->
                        <div class="product-img">
                            <img src = "../arquivos/<%=livro.getImagem1()%>" width="100" height = "80" />
                            <div class="product-quicview">
                                <a href="produto.jsp?Id=<%=livro.getId()%>"><i class="ti-plus"></i></a>
                            </div>
                        </div>
                        <!-- Product Description -->
                        <div class="product-description">
                            <h4 class="product-price"><%=livro.getPreco()%></h4>
                            <p><%=livro.getNome()%></p>
                            <!-- Add to Cart -->
                            <a href="#" class="add-to-cart-btn">Adicionar ao Carrinho</a>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </section>
  
 
<%@include file="rodape.jsp" %>