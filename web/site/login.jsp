<%@page import="modelo.Cliente"%>
<%@page import="dao.ClienteDAO"%>
<%
    
    if (request.getParameter("txtEmail") != null && request.getParameter("txtSenha") != null) 
    {
        ClienteDAO cdao = new ClienteDAO();
        Cliente cli = cdao.logar(request.getParameter("txtEmail"), request.getParameter("txtSenha"));
        if (cli != null) {
                session.setAttribute("cliente", cli);
                response.sendRedirect("formulario.jsp");
                return;
            }
        else    
        {%>
        <script>alert('Login e/ou Senha Inválidos')</script>  
        <%}
    }
    if (request.getParameter("txtEmailc") != null && request.getParameter("txtSenhac") != null && request.getParameter("txtNome") != null && request.getParameter("txtEndereco") != null)
    {
        ClienteDAO cdao = new ClienteDAO();
        Cliente cli = new Cliente();
        cli.setEmail(request.getParameter("txtEmailc"));
        cli.setSenha(request.getParameter("txtSenhac"));
        cli.setNome(request.getParameter("txtNome"));
        cli.setEndereco(request.getParameter("txtEndereco"));
        cdao.incluir(cli);
        session.setAttribute("cliente", cli);
        response.sendRedirect("formulario.jsp");
        return;
    }
%>

<%@include  file="cabecalho.jsp"%>
<div class="container">
    <div class="col-12 col-md-6">

        <div class="checkout_details_area mt-50 clearfix">
            <h2>Login</h2>
            <form action="#" method="post">
                <div class="row">
                    <div class="col-12 mb-3">
                        <label for="email">E-mail <span>*</span></label>
                        <input type="email" class="form-control" id="email" value="" name="txtEmail">
                    </div>
                    <div class="col-12 mb-3">
                        <label for="senha">Senha <span>*</span></label>
                        <input type="password" class="form-control" id="senha" value="" name="txtsenha">
                    </div>
                </div>
                <button type="submit" href=""  class="btn cart-submit d-block">Fazer Login</button>
            </form>
        </div>
        <div class="checkout_details_area mt-50 clearfix">
            <h2>Cadastrar-se</h2>
            <form action="#" method="post">
                <div class="row">
                    <div class="col-12 mb-3">
                        <div class="col-12 mb-3">
                            <label for="nome">Nome Completo <span>*</span></label>
                            <input type="text" class="form-control" id="nome" value="" name="txtNome">
                        </div>
                        <div class="col-12 mb-3">
                            <label for="email">E-mail <span>*</span></label>
                            <input type="email" class="form-control" id="emailc" value="" name="txtEmailc">
                        </div>
                        <div class="col-12 mb-3">
                            <label for="senha">Senha <span>*</span></label>
                            <input type="password" class="form-control" id="senhac" value="" name="txtSenhac">
                        </div>
                        <div class="col-12 mb-3">
                            <label for="end">Endereço <span>*</span></label>
                            <input type="text" class="form-control" id="ende" value="" name="txtEndereco">
                        </div>
                    </div>
                </div>
                <button type="submit" href=""  class="btn cart-submit d-block">Fazer Cadastro</button>
                </br>
            </form>

        </div>
    </div>
</div>

    <%@include file="rodape.jsp" %>