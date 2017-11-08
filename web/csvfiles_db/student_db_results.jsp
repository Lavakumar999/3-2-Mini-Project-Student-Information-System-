<%-- 
    Document   : student_db_results
    Created on : Feb 20, 2017, 11:30:08 PM
    Author     : Lava Kumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Student Results Information CSV file is uploaded here</h1>
        <h4><u>Precautions</u> </h4>
        <ul><li>Only once should upload the csv file to database</li>
            <li>Redundancy may causes so not to allow two same records on single table</li>
            <li>If you want to drop the table and insert a new csv file the click below <strong>(DROP TABLE)</strong></li>
        </ul>
        <hr>
    <center>
        <form action="#" method="post" enctype="multipart/form-data">
	<input type="file" name="file" size="50" />(csv file only)
        <br />
        <input type="submit" name="submit" value="Upload File" />
        <br/>
        </form>
        <hr>
        <form action="#" method="post">
            <input type="submit" value="DROP TABLE"/>
        </form>
    </center>
    </body>
</html>
