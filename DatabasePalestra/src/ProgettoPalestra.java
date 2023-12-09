import java.sql.*;
import java.text.ParseException;
import java.util.Scanner;

public class ProgettoPalestra {
    public static void main(String[] args) {

        try {
            // Carica il driver JDBC MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try {

            // Crea la connessione al database
            String url = "jdbc:mysql://localhost:3306/palestra";
            String user = "root";
            String password = "simo2001";

            Connection conn = DriverManager.getConnection(url, user, password);
            Statement stmt = conn.createStatement();

            boolean flag = true;

            do{

                String query;
                int scelta;
                boolean flag2 = true;
                Scanner in;

                do {
                    System.out.print("Inserisci il numero dell'operazione che vuoi eseguire sulla relazione Trainer:\n1)Visualizza tutti i Trainer della palestra\n2)Inserisci un nuovo Trainer\n3)Modifica un campo di un Trainer\n4)Elimina un Trainer\n0)Termina il Programma\nScelta: ");
                    in = new Scanner(System.in);
                    scelta = Integer.parseInt(in.nextLine());

                    if(scelta == 0 || scelta == 1 || scelta == 2 || scelta == 3 || scelta == 4)
                        flag2 = false;
                    else System.out.println("Hai inserito un valore non corretto, riprova");
                }while(flag2);


                if(scelta == 1){
                    query = "SELECT * FROM Trainer";
                    ResultSet rs = stmt.executeQuery(query);
                    while (rs.next()) {
                        System.out.print("CF: " + rs.getString("CF") + ", ");
                        System.out.print("Nome: " + rs.getString("Nome") + ", ");
                        System.out.print("Cognome: " + rs.getString("Cognome") + ", ");
                        System.out.print("Titolo studio: " + rs.getString("TitoloStudio") + ", ");
                        System.out.println("Stipendio: " + rs.getString("Stipendio"));
                    }
                }

                if(scelta == 2){

                    query = "INSERT INTO Trainer (CF, Nome, Cognome, TitoloStudio, Stipendio) VALUES (?, ?, ?, ?, ?)";
                    PreparedStatement pstmt = conn.prepareStatement(query);

                    System.out.println("Inserisci il CF del nuovo Trainer:");
                    String cf = in.nextLine();

                    System.out.println("Inserisci il nome del nuovo Trainer:");
                    String nome = in.nextLine();

                    System.out.println("Inserisci il cognome del nuovo Trainer:");
                    String cognome = in.nextLine();

                    System.out.println("Inserisci il titolo di studio del nuovo Trainer:");
                    String titolo = in.nextLine();

                    System.out.println("Inserisci lo stipendio del nuovo Trainer:");
                    float stipendio = Float.parseFloat(in.nextLine());

                    pstmt.setString(1, cf);
                    pstmt.setString(2, nome);
                    pstmt.setString(3, cognome);
                    pstmt.setString(4, titolo);
                    pstmt.setFloat(5, stipendio);

                    pstmt.executeUpdate();

                    System.out.println("Inserimento avvenuto con successo");

                }

                if(scelta == 3){

                    PreparedStatement pstmt = null;

                    System.out.println("Inserisci il CF del Trainer che vuoi modificare");
                    String cf = in.nextLine();

                    System.out.println("Inserisci il parametro che vuoi modificare tra: CF - Nome - Cognome - TitoloStudio - Stipendio");
                    String scelta2 = in.nextLine();

                    if(scelta2.equalsIgnoreCase("CF")) {
                        query = "UPDATE Trainer SET CF=? WHERE CF=?";
                        pstmt = conn.prepareStatement(query);
                    }

                    if(scelta2.equalsIgnoreCase("Nome")) {
                        query = "UPDATE Trainer SET Nome=? WHERE CF=?";
                        pstmt = conn.prepareStatement(query);
                    }

                    if(scelta2.equalsIgnoreCase("Cognome")) {
                        query = "UPDATE Trainer SET Cognome=? WHERE CF=?";
                        pstmt = conn.prepareStatement(query);
                    }

                    if(scelta2.equalsIgnoreCase("TitoloStudio")) {
                        query = "UPDATE Trainer SET TitoloStudio=? WHERE CF=?";
                        pstmt = conn.prepareStatement(query);
                    }

                    if(scelta2.equalsIgnoreCase("Stipendio")) {
                        query = "UPDATE Trainer SET Stipendio=? WHERE CF=?";
                        pstmt = conn.prepareStatement(query);
                    }


                    System.out.println("Inserisci il nuovo valore:");

                    if(scelta2.equalsIgnoreCase("Stipendio")){
                        float s = Float.parseFloat(in.nextLine());
                        pstmt.setFloat(1, s);
                    }
                    else {
                        String valore = in.nextLine();
                        pstmt.setString(1, valore);
                    }


                    pstmt.setString(2, cf);


                    pstmt.executeUpdate();

                    System.out.println("Modifica avvenuta con successo");
                }

                if(scelta == 4){

                    query = "DELETE FROM Trainer WHERE CF=?";

                    System.out.println("Inserisci il CF del Trainer che vuoi eliminare");
                    String cf = in.nextLine();

                    PreparedStatement pstmt = conn.prepareStatement(query);
                    pstmt.setString(1, cf);

                    pstmt.executeUpdate();

                    System.out.println("Cancellazione avvenuto con successo");

                }

                if(scelta == 0){
                    System.out.println("Programma terminato\n");
                    flag = false;
                }


            }while(flag);


            // Chiudi la connessione
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
