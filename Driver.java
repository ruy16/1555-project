import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Driver {

	public static void main(String[] args) throws SQLException, IOException {
		try {
			//establish the connection
			Class.forName("oracle.jdbc.driver.OracleDriver"); 
			String dbacct,passwrd;
			//System.out.println("Enter your database username\n");
			//dbacct = io.readLine();
			//System.out.println("Enter your database password\n");
			//passwrd = io.readLine();			
			dbacct = "ruy16";
			passwrd = "4203261";
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@class3.cs.pitt.edu:1521:dbclass", dbacct, passwrd);
			//test login
			System.out.println("/////test login//////");
			System.out.println("Successful case:");
			Olympics.login(conn, "Ricky", "GUEST");//success
			System.out.println("Incorrect password case:");
			Olympics.login(conn, "Ricky", "12345");//denied
			System.out.println("UserName not found case:");
			Olympics.login(conn, "Rest", "GUEST");//denied
			//test logout
			System.out.println("\n/////test logout//////");
			Olympics.logout(conn, 4);
			System.out.println("Table user_account affected, 1 row changed");
			
			System.out.println("\n/////test CreateUser//////");
			//testing CreateUser
			Olympics.createUser(conn,"RUY","GUEST",2);
			Olympics.createUser(conn,"Lurence","COACH",1);
			Olympics.createUser(conn,"J.R","12345",0);
			System.out.println("Table USER_ACCOUNT affected, 3 rows inserted");
			Olympics.createUser(conn,"J.R","12345",0);//test error exception handle, username already exit
			//testing dropUser
			System.out.println("\n/////test dropUser//////");
			Olympics.dropUser(conn,143);
			Olympics.dropUser(conn,144);
			Olympics.dropUser(conn,145);
			System.out.println("Table USER_ACCOUNT affected, 3 rows affected");
			Olympics.dropUser(conn,200);//doesn't exist
			Olympics.dropUser(conn,147);//test handle user doesn't exist
			
			//test createEvent
			System.out.println("\n/////test createEvent//////");
			Olympics.createEvent(conn,1,1,"M","2016/8/21 16:00:00");
			System.out.println("Table EVENT affected, 1 rows inserted");
			
			//test createTeam
			System.out.println("\n/////test createTeam//////");
			Olympics.createTeam(conn,"London","2016",0,1,"ruyTeam",140);
			System.out.println("Table TEAM affected, 1 rows inserted");
			
			//test addParticipant
			System.out.println("\n/////test addParticipant//////");
			Olympics.addParticipant(conn,"Oliver","six","China","china","1999/06/15");
			System.out.println("Table participant affected");
			
			//test addEventOutcome
			System.out.println("\n/////test addEventOutcome//////");
			Olympics.addEventOutcome(conn, 0, 0, 141, 1);//success case
			System.out.println("Table scoreboard affected,1 row inserted");
			Olympics.addEventOutcome(conn, 5, 0, 0, 1);//case olympic id doesn't exist
			Olympics.addEventOutcome(conn, 0, 0, 15, 1);//case recored already exists
			
			//test register team
			System.out.println("\n/////test registerTeam//////");
			Olympics.registerTeam(conn,101,24);
			System.out.println("Table teamPartticipation affected");
			
			//addTeamMember
			System.out.println("\n/////test addTeamMember//////");
			Olympics.addTeamMember(conn,30,101);
			System.out.println("Table TeamMember affected");
			
			//dropTeamMember
			System.out.println("\n/////test dropTeamMember//////");
			Olympics.dropTeamMember(conn,141);
			System.out.println("Table SCOREBOARD,TEAM_MEMBER,AND EVENT_PARTICIPATION(1 row affected) affected");
			
			//test display sport
			System.out.println("\n/////test display sport//////");
			System.out.println("For basketball:");
			Olympics.displaySport(conn,"Basketball");
			
			//test displayEvent
			System.out.println("\n/////test displayEvent//////");
			System.out.println("For 2008 Beijing Olympics, event 13:");
			Olympics.displayEvent(conn, "Beijing", "2008", 13);
			
			//test countryRanking
			System.out.println("\n/////test countryRanking//////");
			System.out.println("In olympic 1");
			Olympics.countryRanking(conn, 1);
			
			//test topkAthlethes
			System.out.println("\n/////test topkAthlethes//////");
			System.out.println("For Olympic 0, k=10");
			Olympics.topkAthletes(conn,0,10);
			
			//test connectedAthletes
			System.out.println("\n/////test connectedAthletes//////");
			System.out.println("For athelete 30, olympic 1, hop of 2:");
			Olympics.connectedAthlete(conn,30,1,2);
			//test exit
			System.out.println("\n/////test exit//////");
			Olympics.exit(conn);
		}catch(SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}

}
