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
         
         
         //M�TODO QUE VAI GRAVAR
         ClienteDAO cd  = new ClienteDAO();
         try{
         
        //passando pra ele o objeto c
         cd.cadastrar(c);
         //joga para p�gina principal
         request.setAttribute("msg", "Cadastro realizado coom sucesso");
         request.getRequestDispatcher("index.jsp").forward(request, response);
         
         
         }catch(Exception e){
             //GERANDO ERRO CONEX�O
             out.println("Error: " +e.getMessage());      
         }
     } else if (action.equalsIgnoreCase("excluir")){
         try{
         Integer cod_cliente = Integer.parseInt(request.getParameter("cod_cliente"));
         //instancia
         ClienteDAO cd = new ClienteDAO();
        //passando pra ele o objeto cod_cliente
         Cliente c = cd.buscaporId(cod_cliente);
         //joga para p�gina principal
         request.setAttribute("msg", "Deletado com sucesso");
         request.getRequestDispatcher("index.jsp").forward(request, response);
         
       }catch(Exception e){
             //GERANDO ERRO CONEX�O
             out.println("Error: " +e.getMessage());      
         }
     }else if(action.equalsIgnoreCase("update")){
                 
     }
          
 }catch(NullPointerException nexp){
     out.print("Voc� deveria estar vendo este aviso !");
     
 }
    
    
%>
    
