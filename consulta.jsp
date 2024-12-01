<%@page language="java" import="java.sql.*" %>

    <!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contato - Lar da Regina</title>
    <link rel="stylesheet" href="style.css">
    <style>
            tr:nth-child(even) {
                background-color: lightgray ;
            }

            tr:hover{
                background-color: #363636 ;
                color: white;
            }
    </style>
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
                <h2>Aqui estao os dados Armazenados</h2>
                <%
            //variaveis para acessar o banco de dados
            String database = "lardaregina"; 
            String endereco = "jdbc:mysql://localhost:3306/" + database ; 
            String usuario  = "root"; 
            String senha    = "";

            //Driver
            String driver = "com.mysql.jdbc.Driver" ;

            //Carregar o driver na memoria
            Class.forName( driver ) ;

            //Cria uma variavel para conexao com o banco de dados
            Connection conexao;

            //Abrir a conexao com o banco
            conexao = DriverManager.getConnection( endereco , usuario, senha);

            //comando para consultar no banco
            String sql = "SELECT * FROM fila_espera" ;

            //cria a variavel do tipo Statement
            PreparedStatement stm = conexao.prepareStatement( sql );

            //cria a variavel do tipo ResultSet
            //para armazenar os dados que estão banco
            ResultSet dados  = stm.executeQuery() ;

            out.print("<table border=1>") ;

            while ( dados.next() )
            {
                out.print("<tr>") ;
                    out.print("<td>") ;
                        out.print( dados.getString("codigo") ) ;
                    out.print("</td>") ;

                    out.print("<td>") ;
                        out.print( dados.getString("nome") ) ;                    
                    out.print("</td>") ;

                    out.print("<td>") ;
                        out.print( dados.getString("idade") ) ;
                    out.print("</td>") ;

                    out.print("<td>") ;
                        out.print( dados.getString("telefone") ) ;
                    out.print("</td>") ;

                    out.print("<td>") ;
                        out.print( dados.getString("email") ) ;
                    out.print("</td>") ;                                        
                out.print("</tr>") ;
            }

            out.print("</table>") ;
        %>
            </div>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 Lar da Regina. Todos os direitos reservados.</p>
    </footer>
</body>
</html>