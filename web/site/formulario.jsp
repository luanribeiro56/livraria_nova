<%@page import="modelo.CompraLivro"%>
<%@page import="modelo.Cliente"%>
<%@page import="dao.ClienteDAO"%>
<%
    if (session.getAttribute("cliente") == null) 
    {
        response.sendRedirect("login.jsp");
        return;
    }
    if (session.getAttribute("carrinho") == null) 
    {
        response.sendRedirect("index.jsp");
        return;
    }
    Cliente cli = (Cliente) session.getAttribute("cliente");
    List<CompraLivro> car;
    car = (List<CompraLivro>) session.getAttribute("carrinho");
    Float total = 0.0f;
%>
<%@include file="cabecalho.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-12 col-md-6">
            <div class="checkout_details_area mt-50 clearfix">
                <h2>Informações do Cliente</h2>
                <form action="#" method="post">
                    <div class="row">
                        <div class="col-12 mb-3">
                            <label for="first_name">Nome Completo<span>*</span></label>
                            <input type="text" class="form-control" id="first_name" value="<%=cli.getNome()%>" required>
                        </div>
                        <div class="col-12 mb-3">
                            <label for="street_address">Endereço <span>*</span></label>
                            <input type="text" class="form-control mb-3" id="street_address" value="<%=cli.getEndereco()%>">
                        </div>
                        <div class="col-12 mb-3">
                            <label for="postcode">E-mail <span>*</span></label>
                            <input type="email" class="form-control" id="postcode" value="<%=cli.getEmail()%>">
                        </div>
                        <div class="col-12 mb-3">
                            <label for="city">Senha <span>*</span></label>
                            <input type="password" class="form-control" id="city" value="<%=cli.getSenha()%>">
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div class="col-12 col-md-6 col-lg-5 ml-lg-auto">
            <div class="order-details-confirmation">

                <div class="cart-page-heading">
                    <h5>Produtos</h5>
                </div>

                <ul class="order-details-form mb-4">
                    <li><span>Produto</span> <span>Valor Unitário</span></li>
                    <%for (CompraLivro obj : car) {
                    %>
                    <li><span><%=obj.getLivro().getNome()%></span> <span>$<%=obj.getValorunitario()%></span></li>
                    <%}
                    for (CompraLivro valor : car){
                        total += valor.getValorunitario();
                    }
                    %>
                    <li><span>Total</span> <span>$<%=total%></span></li>
                </ul>
                <a href="final.jsp" class="btn karl-checkout-btn">Confirmar Compra</a>
            </div>
        </div>

    </div>
</div>
<%@include file="rodape.jsp" %>