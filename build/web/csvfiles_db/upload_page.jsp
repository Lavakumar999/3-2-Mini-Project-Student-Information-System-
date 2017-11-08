<%@ page import="java.io.*,java.sql.*" %>
<html>
<%
	String contentType = request.getContentType();
	if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
 	DataInputStream in = new DataInputStream(request.getInputStream());
	int formDataLength = request.getContentLength();
	byte dataBytes[] = new byte[formDataLength];
	int byteRead = 0;
	int totalBytesRead = 0;
	while (totalBytesRead < formDataLength) {
	byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
	totalBytesRead += byteRead;
	}
       
	String file = new String(dataBytes);
	String saveFile = file.substring(file.indexOf("filename=\"") + 10);
	saveFile = saveFile.substring(saveFile.lastIndexOf("\\")+ 1,saveFile.indexOf("\""));
	saveFile = file.substring(file.indexOf("filename=\"") + 10);
		saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
		saveFile = saveFile.substring(saveFile.lastIndexOf("\\")+ 1,saveFile.indexOf("\""));
		int lastIndex = contentType.lastIndexOf("=");
		String boundary = contentType.substring(lastIndex + 1,contentType.length());
		int pos;
		
		pos = file.indexOf("filename=\"");
		pos = file.indexOf("\n", pos) + 1;
		pos = file.indexOf("\n", pos) + 1;
		pos = file.indexOf("\n", pos) + 1;
		int boundaryLocation = file.indexOf(boundary, pos) - 4;
		int startPos = ((file.substring(0, pos)).getBytes()).length;
		int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

		FileOutputStream fileOut = new FileOutputStream(saveFile);
		fileOut.write(dataBytes, startPos, (endPos - startPos));

              Connection con=null;
	    Statement pst=null;
        String line = null;
	    String value=null;
            int count1=0,count2=0;
       try{
                Class.forName("com.mysql.jdbc.Driver");
               con = DriverManager.getConnection("jdbc:mysql://localhost:3306/client","root","");
   		StringBuilder contents = new StringBuilder();
                String[] linevalue=new String[formDataLength];
			BufferedReader input =  new BufferedReader(new FileReader(saveFile));
			while (( line = input.readLine()) != null){
                            count1++;
                           linevalue= line.split(",");
                           String code=linevalue[0];
                           String name=linevalue[1];
                           //out.println("<br>"+code+"-----"+name);
                           String sql="insert into userdata values(?,?)";
                           java.sql.PreparedStatement st=con.prepareStatement(sql);
                            st.setString(1,code);
                            st.setString(2,name);
                           int i=st.executeUpdate();
                           if(i>0){
                               count2++;
                           }
                           
                        }
                        if(count1==count2){
                            out.println("finally get");
                        }
		
           }
	catch(Exception e)
		{}
		}
	%>
</html>


