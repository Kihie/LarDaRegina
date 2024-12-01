<%@page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contato - Lar da Regina</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <h1>Lar da Regina</h1>
        <nav>
            <a href="index.html">Inicio</a>
            <a href="resgates.html">Resgates</a>
            <a href="adocao.html">A Procura de um Lar</a>
            <a href="contato.html">Contato</a>
            <a href="Fila_de_espera.html">Fila de Espera</a>
        </nav>
    </header>

    <main>
        <section class="contact">
            <div>
                <h2>Tudo pronto !</h2>
            </div>
            <div class="photos">
                <div class="photo">
                    <img src="gravado.jpg"Fachada da ONG">
                </div>
            </div>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 Lar da Regina. Todos os direitos reservados.</p>
    </footer>
</body>
</html>

<%
    //cria as variaveis e armazena as informações digitadas pelo usuário
    String vnome  = request.getParameter("txtNome");
    int vidade =    Integer.parseInt(request.getParameter("txtIdade"));
    String vtelefone = (request.getParameter("txtFone"));
    String vemail = request.getParameter("txtEmail");

    //variaveis para acessar o banco de dados
    String database = "lardaregina"; 
    String endereco = "jdbc:mysql://localhost:3306/" + database ; 
    String usuario  = "root"; 
    String senha    = "";

    //Driver 
    String driver = "com.mysql.jdbc.Driver" ;

    //Carrega o driver na memoria
    Class.forName(driver) ;

    //Cria a variavel para conectar com o banco
    Connection conexao ;

   //Abrir a conexao com o banco
   conexao = DriverManager.getConnection( endereco , usuario, senha) ;

   //Varival para o comando Insert do SQL
   String sql = "INSERT INTO fila_espera (nome, idade, telefone, email) values (?, ?, ?, ?)" ;

   //Cria a variavel Statement para executar o SQL
   PreparedStatement stm = conexao.prepareStatement(sql) ;
   stm.setString( 1 , vnome ) ;
   stm.setInt( 2 , vidade ) ;
   stm.setString( 3 , vtelefone ) ;  
   stm.setString( 4 , vemail ) ;
  

   stm.execute() ;
   stm.close() ;
%>
