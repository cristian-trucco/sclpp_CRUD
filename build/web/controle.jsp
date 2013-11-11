<%@page import="sclpp.model.Cliente,sclpp_persistencia.ClienteDAO"%>
    
<%
 try{
     //trata o action
     String action = request.getParameter("action");
     if(action.equalsIgnoreCase("cadastrar")){
         Cliente  c = new Cliente();
         c.setNome(request.getParameter("nome"));
         c.setTelefone(request.getParameter("telefone"));
         c.setEmail(request.getParameter("email"));
         
         
         //MÉTODO QUE VAI GRAVAR
         ClienteDAO cd  = new ClienteDAO();
         try{
         
        //passando pra ele o objeto c
         cd.cadastrar(c);
         //joga para página principal
         request.setAttribute("msg", "Cadastro realizado coom sucesso");
         request.getRequestDispatcher("index.jsp").forward(request, response);
         
         
         }catch(Exception e){
             //GERANDO ERRO CONEXÃO
             out.println("Error: " +e.getMessage());      
         }
     } else if (action.equalsIgnoreCase("excluir")){
         try{
         Integer cod_cliente = Integer.parseInt(request.getParameter("cod_cliente"));
         //instancia
         ClienteDAO cd = new ClienteDAO();
        //passando pra ele o objeto cod_cliente
         Cliente c = cd.buscaporId(cod_cliente);
         //joga para página principal
         request.setAttribute("msg", "Deletado com sucesso");
         request.getRequestDispatcher("index.jsp").forward(request, response);
         
       }catch(Exception e){
             //GERANDO ERRO CONEXÃO
             out.println("Error: " +e.getMessage());      
         }
     }else if(action.equalsIgnoreCase("update")){
                 
     }
          
 }catch(NullPointerException nexp){
     out.print("Você deveria estar vendo este aviso !");
     
 }
    
    
%>
    
