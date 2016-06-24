Another example of not reading the manuals: the "feedback" variable does not suppress terminal output.
SET FEED[BACK] {6 | n | ON | OFF}
Displays the number of records returned by a script when a script selects at least n records.

ON or OFF turns this display on or off. Turning feedback ON sets n to 1. Setting feedback to zero is equivalent to turning it OFF.

SET FEEDBACK OFF also turns off the statement confirmation messages such as 'Table created' and 'PL/SQL procedure successfully completed' that are displayed after successful SQL or PL/SQL statements.>

SET TERM[OUT] {ON | OFF}
SET TERMOUT is not supported in iSQL*Plus

Controls the display of output generated by commands in a script that is executed with @, @@ or START. OFF suppresses the display so that you can spool output to a file without displaying the output on screen. ON displays the output on screen. TERMOUT OFF does not affect output from commands you enter interactively or redirect to SQL*Plus from the operating system.

SET HEA[DING] {ON | OFF}
Controls printing of column headings in reports.

ON prints column headings in reports; OFF suppresses column headings.

The SET HEADING OFF command does not affect the column width displayed, it only suppresses the printing of the column header itself.>

******************
I used 

set linesize 2000

But if i specify it then filesize becomes larger.
How can i remove the blank spaces from the file?

SET TRIMSPOOL ON
****************
SQLBL[ANKLINES] {ON|OFF}

Controls whether SQL*Plus allows blank lines within a SQL command or script. ON interprets blank lines and new lines as part of a SQL command or script. OFF, the default value, does not allow blank lines or new lines in a SQL command or script or script.

Enter the BLOCKTERMINATOR to stop SQL command entry without running the SQL command. Enter the SQLTERMINATOR character to stop SQL command entry and run the SQL statement.
Pressing Enter on a blank line while typing a SQL statement into SQL*Plus normally signals the end of the statement. The statement is placed into the buffer, and you have the option of making further edits or of executing the statement. Turning SQLBLANKLINES ON allows you to put a blank line in the middle of your statement, as in the following example:
****************