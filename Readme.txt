Instructions for running Olympics.java

Compiling:
Make sure ojdbc.jar is ready in the same directory
Then compile with:
	javac -cp ojdbc7.jar Olympics.java

Running:
	java -cp ojdbc7.jar:. Olympics
	
Interface:
You will be asked to enter a num to login or exit the system upon running, enter your option and hit enter.
Once you have logged in based on the user level, list of options will be shown, enter an option and hit enter.
All inputs are case sensitive! 

Notes:
The driver is just a test program with some predefined inputs.
The current server is based on class3@pitt.cs.edu which is no longer in use, please change the server info in the ojdbc.java.
You must populate the database by running Schema.sql, trigger.sql,and init.sql first!
You can run it on oracle with any valid server, since the clss3 server is no longer available.

Some predefined accounts to use in the app:
Username:Hu Jintao Passkey:Beijing
Username:Ricky Passkey:GUEST
Username:Junhong Passkey:JJ 
	
