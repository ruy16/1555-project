/*
 * c1555 project 
 * @author: Oliver Yan
 * Version 0*/

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;
import java.util.*;
import java.io.Console;
public class Olympics {
	public static void main(String args[]) throws SQLException, IOException {
		try {
			//establish the connection
			Class.forName("oracle.jdbc.driver.OracleDriver"); 
			String dbacct,passwrd;
			BufferedReader io = new BufferedReader(new InputStreamReader(System.in));
			// this server login info is predefined
			// change the server and user accordingly 			
			dbacct = "ruy16";
			passwrd = "4203261";
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@class3.cs.pitt.edu:1521:dbclass", dbacct, passwrd);
			//User interface
			//stores the user info in the session
			boolean login = false;
			int userID = 0 ;
			String userName = "";
			char[] passkey;
			int roleID = 0;
			String lastLogin = "";
			Console console = System.console();
			if(console == null) System.exit(0);
			//first level interface
			while(true) {
				login = false;
				System.out.println("Enter 0 to exit the system\nEnter 1 to login");
				int response =Integer.parseInt(console.readLine()) ;
				if(response == 0) exit(conn);
				if(response == 1) {
					while(!login) {
						userName = console.readLine("Enter your username:");
						passkey = console.readPassword("Enter your password");
						if(login(conn,userName,new String(passkey))==0) {
							System.out.println("You have logined");
							login = true;
						}
						else
							break;
					}
					if(!login)
						continue;
				}
				else {
					System.out.println("Unknow command");
					continue;
					
				}
				
			
			//second level interface
			//query the user's info
			String stamt = "Select USER_ID,role_id,last_login from USER_ACCOUNT WHERE username = ?";
			PreparedStatement p0 = conn.prepareStatement(stamt);
			p0.clearParameters();
			p0.setString(1, userName);
			ResultSet r0 = p0.executeQuery();
			while(r0.next()) {
				userID = r0.getInt(1);
				roleID = r0.getInt(2);
				lastLogin = r0.getString(3);
			}
			String wellcomeM = "Wellcome User: "+userID + " Your last login:"+ lastLogin;
			System.out.println(wellcomeM);
			int user_option = 0;
			while(true) {
				//Check the user's authority 
				//Organizer
				Runtime.getRuntime().exec("clear");//doesn't work for now, trying to clear the screen to look nicer
				if(roleID == 0) {
					System.out.println("\nEnter 1 to create a new user account");
					System.out.println("Enter 2 to drop user account");
					System.out.println("Enter 3 to create a new event");
					System.out.println("Enter 4 to add event outcome");
					//user_option = console.readLine();
				}
				if(roleID == 1) {
					System.out.println("\nEnter 1 to create a new team");
					System.out.println("Enter 2 to register a team for an event");
					System.out.println("Enter 3 to add a new participant");
					System.out.println("Enter 4 to add a new meber to a team");
					System.out.println("Enter 5 to drop a team member");
				}
				System.out.println("\nEnter 6 to display information about a sport");
				System.out.println("Enter 7 to display information about a event");
				System.out.println("Enter 8 to display information about country ranking");
				System.out.println("Enter 9 to display top k athletes");
				System.out.println("Enter 10 to show connected Athletes");
				System.out.println("Enter 11 to logout");
				System.out.println("Enter 12 to exit");
				user_option = Integer.parseInt((console.readLine()));
				//function entries
				if(roleID == 0 && user_option == 1) {
					String userN;
					String passW;
					int rID;
					userN = console.readLine("Enter username\n");
					passW = console.readLine("Enter password\n");
					rID = Integer.parseInt(console.readLine("Enter role ID\n"));
					createUser(conn,userN,passW,rID);
					continue;
				}
				if(roleID == 0 && user_option == 2) {
					int dropID;
					dropID = Integer.parseInt(console.readLine("Enter the user ID that you want to drop\n"));
					dropUser(conn,dropID);
					continue;
				}
				if(roleID == 0 && user_option == 3) {
					int newEventSportID = Integer.parseInt(console.readLine("Enter a sport ID\n"));
					int newEventvenueID = Integer.parseInt(console.readLine("Enter a venue ID\n"));
					String newEventGender = console.readLine("Enter gender of the event\n");
					String newEventTime = console.readLine("Enter the openning time for the event\n");
					createEvent(conn,newEventSportID,newEventvenueID,newEventGender,newEventTime);
					continue;
				}
				if(roleID == 0 && user_option == 4) {
					int eventOutComeOlymID = Integer.parseInt(console.readLine("Enter an Olympic ID\n"));
					int eventOutcomeEventID = Integer.parseInt(console.readLine("Enter an event ID\n"));
					int eventOutcomePartID = Integer.parseInt(console.readLine("Enter participant ID\n"));
					int eventOutcomeposition = Integer.parseInt(console.readLine("Enter the position\n"));
					addEventOutcome(conn,eventOutComeOlymID,eventOutcomeEventID,eventOutcomePartID,eventOutcomeposition);
					continue;
				}
				if(roleID == 1 && user_option == 1) {
					String newTeamOlympicCity = console.readLine("Enter an Olympic game city\n");
					String newTeamOlympicYear = console.readLine("Enter an Olympic game year\n");
					int newTeamCountryID = Integer.parseInt(console.readLine("Enter country ID for the new team\n"));
					int newTeamSportID  = Integer.parseInt(console.readLine("Enter sport ID for the new team\n"));
					String newTeamName = console.readLine("Enter the name for the new team\n");
					createTeam(conn,newTeamOlympicCity,newTeamOlympicYear,newTeamCountryID,newTeamSportID,newTeamName,userID);
					continue;
				}
				if(roleID == 1 && user_option == 2) {
					int registerTeamID = Integer.parseInt(console.readLine("Enter team ID\n"));
					int eventID = Integer.parseInt(console.readLine("Enter event ID\n"));
					registerTeam(conn,registerTeamID,eventID);
					continue;
				}
				if(roleID == 1 && user_option == 3) {
					String addPartFname = console.readLine("Enter the first name\n");
					String addpartLname = console.readLine("Enter the last name\n");
					String addPartNationality = console.readLine("Enter nationality\n");
					String addPartbirthplace = console.readLine("Enter birth place\n");
					String addPartDob = console.readLine("Enter date of birth\n");
					addParticipant(conn,addPartFname,addpartLname,addPartNationality,addPartbirthplace,addPartDob);
					continue;
				}
				if(roleID == 1 && user_option == 4) {
					int addTeamMemberID = Integer.parseInt(console.readLine("Enter team ID\n"));
					int addTeamParticipantID =Integer.parseInt(console.readLine("Enter participant ID\n"));
					addTeamMember(conn,addTeamMemberID,addTeamParticipantID);
					continue;
				}
				if(roleID == 1 && user_option == 5) {
					int dropTeamMemberID = Integer.parseInt(console.readLine("Enter participant ID\n"));
					dropTeamMember(conn,dropTeamMemberID);
					continue;
				}
				if(user_option == 6) {
					String displaySportName = console.readLine("Enter a sport name\n");
					displaySport(conn,displaySportName);
					continue;
				}
				if(user_option == 7) {
					String displayEventCity = console.readLine("Enter an Olympic city\n");
					String displayEventYear = console.readLine("Enter an Olympic year\n");
					int displayEventID = Integer.parseInt(console.readLine("Enter an event ID\n"));
					displayEvent(conn,displayEventCity,displayEventYear,displayEventID);
					continue;
				}
				if( user_option == 8) {
					int countryRankingCID = Integer.parseInt(console.readLine("Enter an Olympic ID\n"));
					countryRanking(conn,countryRankingCID);
					continue;
				}
				if(user_option == 9) {
					int topKolympicID = Integer.parseInt(console.readLine("Enter an Olympic ID\n"));
					int k = Integer.parseInt(console.readLine("Enter an number\n"));
					topkAthletes(conn,topKolympicID,k);
					continue;
				}
				if( user_option == 10) {
					int connectedAthletesID = Integer.parseInt(console.readLine("Enter an athlete ID\n"));
					int connectedAthletesOID = Integer.parseInt(console.readLine("Enter an Olympic ID\n"));
					int connectedAthletesNum = Integer.parseInt(console.readLine("Enter an number N for hops,N must be less than or equal to 3\n"));
					if(connectedAthletesNum < 0 || connectedAthletesNum >3) {
						System.out.println("Invaild input for n!");
						continue;
					}
					connectedAthlete(conn,connectedAthletesID,connectedAthletesOID,connectedAthletesNum);
					continue;
				}
				if(user_option == 11) {
					logout(conn,userID);
					System.out.println("You have loged out");
					break;
				}
				if(user_option == 12) {
					exit(conn);
					continue;
				}
				else {
					//if you get here the input is nnot valid
					System.out.println("Unknown operation!");
				}
				
			}	
			
			}
		}
		catch (ClassNotFoundException x) {
				System.out.println("Driver could not be loaded");
			}
		catch (NumberFormatException n ) {
			System.out.println("You entered something bad!");
		}
		catch (SQLException e) {
            System.out.println(
                    "Error connecting to database. Printing stack trace: ");
            e.printStackTrace();
        }
		catch (Exception s) {
			System.out.println("Unknown command");
		}

	}

	public static void createUser(Connection con,String userName,String passkey,int role_id)  {
		try {
			CallableStatement callFunction = con.prepareCall("{? = call createUser(?,?,?)}");
			callFunction.setString(2, userName);
			callFunction.setString(3, passkey);
			callFunction.setInt(4,role_id);
			callFunction.registerOutParameter(1, Types.INTEGER);
			callFunction.execute();
			int result = callFunction.getInt(1);
			System.out.print(String.format("Your user name: %s User ID:%d\n", userName,result));
		}
		catch(SQLIntegrityConstraintViolationException s) {
			System.out.println("Username already exits!");
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
	public static void dropUser(Connection con,int ID) {
		try {
			CallableStatement callFuntionDropUser = con.prepareCall("{? = call dropUser(?)}");
			callFuntionDropUser.registerOutParameter(1, Types.VARCHAR);
			callFuntionDropUser.setInt(2, ID);
			callFuntionDropUser.execute();
			String output = callFuntionDropUser.getNString(1);
			System.out.println(String.format("You have deleted user:%s \n", output));
		}
		catch(SQLIntegrityConstraintViolationException s) {
			System.out.println("User doesn't exits!");
		}
		catch(SQLException e) {
			System.out.println("Something bad happened, check your input");
		}
	}
	public static void createEvent(Connection con,int sportID,int venueID,String gender,String time) {
		try {
			CallableStatement callFuntionCreateEvent = con.prepareCall("{? = call createEvent(?,?,?,?)}");
			callFuntionCreateEvent.registerOutParameter(1, Types.INTEGER);
			callFuntionCreateEvent.setInt(2, sportID);
			callFuntionCreateEvent.setInt(3, venueID);
			callFuntionCreateEvent.setString(4, gender);
			callFuntionCreateEvent.setString(5, time);
			callFuntionCreateEvent.execute();
			int output = callFuntionCreateEvent.getInt(1);
			System.out.println(String.format("You have created new event, Event id:%d\n",output));
		}
		catch(SQLIntegrityConstraintViolationException s) {
			System.out.println("Event already exits!");
		}
		catch(SQLException e) {
			System.out.println("Something bad happened, check your inputs");
		}
	}
	public static void addEventOutcome(Connection con,int olympicsID,int eventID,int participantID,int position) {
		try {
			CallableStatement callFuntionCreateEvent = con.prepareCall("{? = call addEventOutcome(?,?,?,?)}");
			callFuntionCreateEvent.registerOutParameter(1, Types.INTEGER);
			callFuntionCreateEvent.setInt(2, olympicsID);
			callFuntionCreateEvent.setInt(3, eventID);
			callFuntionCreateEvent.setInt(4, participantID);
			callFuntionCreateEvent.setInt(5, position);
			callFuntionCreateEvent.execute();
			int output = callFuntionCreateEvent.getInt(1);
			if(output == 0) {
				System.out.println(String.format("Successfully added event outcome!\n",output));
			}
			else {
				System.out.println(String.format("Failed to add event outcome, check your input!\n",output));
			}
		}
		catch(SQLIntegrityConstraintViolationException s) {
			System.out.println("Failed to add event outcome,check if information was valid");
		}
		catch(SQLException e) {
			System.out.println("Something bad happened, check your inputs");
		}
		
	}
	public static void createTeam(Connection con,String city,String year,int country,int sport,String name,int coachID) {
		try {
			CallableStatement callCreateTeam = con.prepareCall("{? = call createTeam(?,?,?,?,?,?)}");
			callCreateTeam.registerOutParameter(1, Types.INTEGER);
			callCreateTeam.setString(2, city);
			callCreateTeam.setString(3,year);
			callCreateTeam.setInt(4,country);
			callCreateTeam.setInt(5, sport);
			callCreateTeam.setString(6,name);
			callCreateTeam.setInt(7, coachID);
			callCreateTeam.execute();
			int output = callCreateTeam.getInt(1);
			System.out.println(String.format("You have added a new team, id:%d\n", output));
		}
		catch(SQLIntegrityConstraintViolationException s) {
			System.out.println("Team already exists!");
		}
		catch(SQLException e) {
			System.out.println("Something bad happened, check your inputs");
		}
	}
	public static void registerTeam(Connection con,int event_id,int team_id) {
		try {
			CallableStatement callFuntionRegisterTeam = con.prepareCall("{? = call registerTeam(?,?)}");
			callFuntionRegisterTeam.registerOutParameter(1, Types.INTEGER);
			callFuntionRegisterTeam.setInt(2, event_id);
			callFuntionRegisterTeam.setInt(3, team_id);
			callFuntionRegisterTeam.execute();
			System.out.println("Successfully registered for event\n");
		}
		catch(SQLIntegrityConstraintViolationException s) {
			System.out.println("Event doesn't exit!");
		}
		catch(SQLException e) {
			System.out.println("Something bad happened, check your inputs");
		}
		
	}
	public static void addParticipant(Connection con,String fname,String lname,String nationality,String birth_place,String dob) {
		try {
			CallableStatement callFuntionAddP = con.prepareCall("{? = call addParticipant(?,?,?,?,?)}");
			callFuntionAddP.registerOutParameter(1, Types.INTEGER);
			callFuntionAddP.setString(2, fname);
			callFuntionAddP.setString(3, lname);
			callFuntionAddP.setString(4, nationality);
			callFuntionAddP.setString(5, birth_place);
			callFuntionAddP.setString(6, dob);
			callFuntionAddP.execute();
			int result = callFuntionAddP.getInt(1);
			System.out.println(String.format("Participant %d added\n",result));
		}
		catch(SQLIntegrityConstraintViolationException s) {
			System.out.println("participant already exists!");
		}
		catch(SQLException e) {
			System.out.println("Something bad happened, check your inputs");
		}
		
	}
	public static void addTeamMember(Connection con,int teamID,int partID) {
		try {
			CallableStatement callFuntionAddTMember = con.prepareCall("{? = call addTeamMember(?,?)}");
			callFuntionAddTMember.registerOutParameter(1, Types.INTEGER);
			callFuntionAddTMember.setInt(2, teamID);
			callFuntionAddTMember.setInt(3, partID);
			callFuntionAddTMember.execute();
			System.out.println("Successfully added member\n");
		}
		catch(SQLIntegrityConstraintViolationException s) {
			System.out.println("Team or player not found!");
		}
		catch(SQLException e) {
			System.out.println("Something bad happened, check your inputs");
		}
		
	}
	public static void dropTeamMember(Connection con,int partID) {
		try {
			CallableStatement callFuntionDropTMember = con.prepareCall("{? = call dropTeamMember(?)}");
			callFuntionDropTMember.registerOutParameter(1, Types.INTEGER);
			callFuntionDropTMember.setInt(2, partID);
			callFuntionDropTMember.execute();
			System.out.println("Successfully dropped member\n");
		}
		catch(SQLIntegrityConstraintViolationException s) {
			System.out.println("TeamMember doesn't exist!");
		}
		catch(SQLException e) {
			System.out.println("Something bad happened, check your inputs");
		}
	}
	
	public static int login(Connection con,String username,String passwrd) {
		try {
			CallableStatement callLogin = con.prepareCall("{? = call login(?,?)}");
			callLogin.registerOutParameter(1, Types.INTEGER);
			callLogin.setString(2, username);
			callLogin.setString(3, passwrd);
			callLogin.execute();
			int result = callLogin.getInt(1);
			switch (result){
			case  -1:
				System.out.println("Usename not found!\n");
				return -1;
			case -2:
				System.out.println("Incorrect password!\n");
				return -2;
			case 0:
				System.out.println("login in successful\n");
				return 0;
			}
			
		}catch(SQLException e) {
			System.out.println("Something bad happened, check your inputs");
		}
		return -1;
	}
	public static void displaySport(Connection con,String Sname) {
		int sportid = 0;
		String yearAdded = "";
		try {
			//Retrieve the sport id first
			String stamt0 = "SELECT sport_id from SPORT where sport_name = ?";
			PreparedStatement p = con.prepareStatement(stamt0);
			p.clearParameters();
			p.setString(1, Sname);
			ResultSet r0 = p.executeQuery();
			if(!r0.next()) {
				System.out.println("No sport found!");
				return ;
			}
			sportid = r0.getInt(1);
			//get the added year
			String stamt1 = "Select dob from SPORT where sport_id = ?";
			p = con.prepareStatement(stamt1);
			p.clearParameters();
			p.setInt(1, sportid);
			ResultSet r1 = p.executeQuery();
			while(r1.next())
			yearAdded = r1.getString(1);
			System.out.println(String.format("Added in:%s Olympics\n",yearAdded));
			//find all the events
			String stamt2 = "Select event_id,gender from EVENT where sport_id = ?";
			p.clearParameters();
			p = con.prepareStatement(stamt2);
			p.setInt(1, sportid);
			ResultSet r2 = p.executeQuery();
			int eventID;
			String gender;
			while(r2.next()) {
				eventID = r2.getInt(1);
				gender = r2.getString(2);
				String stamt3 = "SELECT PARTICIPANT_ID,medal_id FROM SCOREBOARD WHERE EVENT_ID = ? and medal_id < 4 order by medal_id ASC";
				PreparedStatement p1 = con.prepareStatement(stamt3);
				p1.clearParameters();
				p1.setInt(1, eventID);
				ResultSet r3 = p1.executeQuery();
				int part_id;
				String part_name = "";
				int medal_id;
				String medalName = "";
				String country = "";
				System.out.println(String.format("Event:%d gender:%s",eventID,gender));
				while(r3.next()) {
					part_id = r3.getInt(1);
					medal_id = r3.getInt(2);
					String stamt4 = "SELECT medal_title from MEDAL where medal_id = ?";
					String stamt5 = "SELECT fname || ' ' || lname as fullname,nationality from PARTICIPANT where participant_id = ?";
					//get the medal title
					p = con.prepareStatement(stamt4);
					p.clearParameters();
					p.setInt(1, medal_id);
					ResultSet r4 = p.executeQuery();
					while(r4.next())
					medalName = r4.getString(1);
					//get the participant's name and country
					p = con.prepareStatement(stamt5);
					p.clearParameters();
					p.setInt(1, part_id);
					ResultSet r5 = p.executeQuery();
					while(r5.next()) {
						part_name = r5.getString(1);
						country = r5.getString(2);
					}
					System.out.println(String.format("%s: %s,country:%s\n",medalName,part_name,country ));	
				}
			}
			
		}
		catch(SQLException e){
			System.out.println("Something bad happened, check your inputs");	
		}
	}
	public static void displayEvent(Connection con,String city,String year,int eventID) {
		try {
			//show the game info
			CallableStatement callGetONum = con.prepareCall("{? = call getOlympicNum(?,?)}");
			callGetONum.registerOutParameter(1, Types.VARCHAR);
			callGetONum.setString(2,year);
			callGetONum.setString(3,city);
			callGetONum.execute();
			String oNum = callGetONum.getString(1);
			if(oNum.equals("-1")) {
				System.out.println("Wrong information!");
				return;
			}
			//get olympic id
			PreparedStatement p = con.prepareStatement("select olympic_id from OLYMPICS where olympic_num = ?");
			p.clearParameters();
			p.setString(1,oNum);
			ResultSet r = p.executeQuery();
			int olymID = 0;
			while(r.next()) {
				olymID= r.getInt(1);
			}
			System.out.println(String.format("%s %s %s Olympics Game:", year,city,oNum));
			//get the events
			String event_name = "";
			CallableStatement callgetSportName = con.prepareCall("{? = call getSportName(?)}");
			callgetSportName.registerOutParameter(1, Types.VARCHAR);
			callgetSportName.setInt(2, eventID);
			callgetSportName.execute();
			event_name = callgetSportName.getString(1) +" "+eventID;
			System.out.println("Event: "+ event_name);
			//get the participants
			int partID = 0;
			int medalID = 0;
			int posit = 0;
			String partName = "";
			String medal = "";
			String stamt = "SELECT participant_id,position,medal_id from SCOREBOARD WHERE event_id =? and olympics_id =?";
			PreparedStatement p0 = con.prepareStatement(stamt);
			p0.clearParameters();
			p0.setInt(1, eventID);
			p0.setInt(2,olymID );
			ResultSet r0 = p0.executeQuery();
			while(r0.next()) {
				partID = r0.getInt(1);
				posit = r0.getInt(2);
				medalID = r0.getInt(3);
				stamt = "SELECT fname || ' ' || lname as fullname from PARTICIPANT where participant_id = ?";
				p0 = con.prepareStatement(stamt);
				p0.clearParameters();
				p0.setInt(1, partID);
				ResultSet r1 = p0.executeQuery();
				while(r1.next()) {
					partName = r1.getString(1);
				}
				if(posit > 3) {
					System.out.println(String.format("%s, position: %d medal: None", partName,posit));
					continue;
				}
				else {
				stamt = "SELECT medal_title from MEDAL WHERE medal_id = ?";
				p0 = con.prepareStatement(stamt);
				p0.clearParameters();
				p0.setInt(1, medalID);
				ResultSet r2 = p0.executeQuery();
				while(r2.next()) {
					medal = r2.getString(1);
				}
				System.out.println(String.format("%s, position: %d medal: %s", partName,posit,medal));
				}
			}
			
		}catch(SQLException e) {
			System.out.println("Something bad happened, check your inputs");
		}
		catch(NumberFormatException s) {
			System.out.println("What did you enter?!");
		}
	}
	public static void countryRanking(Connection con,int olympicID) {
		try {
			String countryName = "";
			int goldCount = 0;
			int sliverCount = 0;
			int bronzeCount = 0;
			int rank = 0;
			String firstYear = "";
			int countryID = 0;
			String stamt = "select unique country,TEAM.country_id from TEAM join COUNTRY on TEAM.country_id = COUNTRY.country_id where olympics_id = ?";
			PreparedStatement p0 = con.prepareStatement(stamt);
			p0.clearParameters();
			p0.setInt(1, olympicID);
			ResultSet r0 = p0.executeQuery();
			con.setAutoCommit(false);
			CallableStatement callcountPoints = con.prepareCall("{? =call getRanks(?)}");
			callcountPoints.registerOutParameter(1, Types.INTEGER);
			callcountPoints.setInt(2, olympicID);
			callcountPoints.execute();
			
			while(r0.next()) {
				countryName = r0.getString(1);
				countryID = r0.getInt(2);
				stamt = "select min(year) as firstYear from(select unique extract(year from opening_date) as year,country_id from OLYMPICS join TEAM on OLYMPICS.olympic_id = TEAM.olympics_id where country_id = ?) ";
				p0 = con.prepareStatement(stamt);
				p0.clearParameters();
				p0.setInt(1, countryID);
				ResultSet r1 = p0.executeQuery();
				while(r1.next()) {
					firstYear = r1.getString(1);
				}
				System.out.println(String.format("%s first year in the Olympics:%s",countryName,firstYear));
			
				stamt = "select gold_count,sliver_count,bronze_count,rank from (select cID,gold_count,sliver_count,bronze_count,DENSE_RANK() over (order by total_points desc ) as rank from countryRanking) where cID = ?" ;
				p0 = con.prepareStatement(stamt);
				p0.clearParameters();
				System.out.println(countryID+"\n");
				p0.setInt(1,countryID );
				ResultSet r2 = p0.executeQuery();
				while(r2.next()) {
					goldCount = r2.getInt(1);
					sliverCount = r2.getInt(2);
					bronzeCount = r2.getInt(3);
					rank = r2.getInt(4);	
				}
				System.out.println(String.format("Medal counts: %d Gold,%d Sliver,%d Bronze, Ranking:%d\n",goldCount,sliverCount,bronzeCount,rank));
			}
			con.setAutoCommit(true);
		}catch(SQLException e) {
			System.out.println("Invaild Olympic ID");
		}

	}
	public static void topkAthletes(Connection con,int olympicID,int k) {
		try {
			con.setAutoCommit(false);
			CallableStatement callAthleteRank = con.prepareCall("{? = call Athletes_Score(?)}");
			callAthleteRank.registerOutParameter(1, Types.INTEGER);
			callAthleteRank.setInt(2, olympicID);
			callAthleteRank.execute();
			
			String stamt = "select player_name,gold_count,sliver_count,bronze_count from playerRank order by total_points desc fetch first ? rows only ";
			PreparedStatement p0 = con.prepareStatement(stamt);
			p0.clearParameters();
			p0.setInt(1, k);
			ResultSet r0 = p0.executeQuery();
			while(r0.next()) {
				System.out.println(String.format("Athlete:%s,%d Gold %d Sliver %d Bronze\n", r0.getString(1),r0.getInt(2),r0.getInt(3),r0.getInt(4)));
			}
			con.setAutoCommit(true);
		}catch(SQLException e) {
			System.out.println("Invalid Olympic ID");
		}
	}
	public static void connectedAthlete(Connection con,int athleteID,int olympicsID,int n) {
		try {
			con.setAutoCommit(false);
			String stamt = "SELECT * from conectedAthlete";
			CallableStatement callAthleteRank = con.prepareCall("{? = call connectedAthletes(?,?,?)}");
			callAthleteRank.registerOutParameter(1, Types.INTEGER);
			callAthleteRank.setInt(2,olympicsID);
			callAthleteRank.setInt(3, athleteID);
			callAthleteRank.setInt(4, n);
			callAthleteRank.execute();
			if(callAthleteRank.getInt(1) == -1) {
				System.out.println("Nothing was found");
				return;
			}
			System.out.println(String.format("These athletes are connected to athelete %d:",athleteID));
			PreparedStatement p = con.prepareStatement(stamt);
			p.clearParameters();
			ResultSet r = p.executeQuery();
			
			while(r.next()) {
				System.out.println(r.getString(1));
			}
			con.setAutoCommit(true);
		}catch(SQLException e) {
			System.out.println("Something bad happened, check your inputs");
		}
		
	}
	
	public static void logout(Connection con,int userID) {
		try {
			CallableStatement callLogout = con.prepareCall("{? = call logout(?)}");
			callLogout.registerOutParameter(1, Types.INTEGER);
			callLogout.setInt(2,userID);
			callLogout.execute();
		}catch(SQLException e) {
			System.out.println("Something bad happened, check your inputs");
		}
		
	}
	
	public static void exit(Connection con) throws SQLException {
		try {
		con.close();
		System.exit(0);
		}
		catch(SQLException e) {
			System.out.println("Connection lost, please force quit");
		}
	}
}
