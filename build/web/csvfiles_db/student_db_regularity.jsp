<%-- 
    Document   : student_db_info
    Created on : Feb 20, 2017, 11:15:50 PM
    Author     : Lava Kumar
--%>

<%@page import="java.sql.DriverManager"%>
<%@ page import="java.io.*,java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Personal Information</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <link href="../css/stuent_db_css.css" rel="stylesheet" type="text/css"/>
    </head>
    <body id="body">
    <center><h1>Student Regularity CSV file is uploaded here</h1></center>
        <h4 style="font-weight:bold;"><u>Precautions</u></h4>
        <ul><li> <span style="font-weight: bold;" class="glyphicon glyphicon-hand-right"></span> Only once should upload the csv file to database</li>
            <li> <span style="font-weight: bold;" class="glyphicon glyphicon-hand-right"></span> Redundancy may causes so not to allow two same records on single table</li>
            <li> <span style="font-weight: bold;" class="glyphicon glyphicon-hand-right"></span> If you want to truncate the table and insert a new csv file the click below <strong>(Truncate Table)</strong></li>
        </ul>
        <hr>
   <div class="container_div">
     <div class="row">
        <form action="#" method="post" enctype="multipart/form-data">
        <div class="col-xs-12 col-md-4 ">  
            <!-- image-preview-filename input [CUT FROM HERE]-->
            <div class="input-group image-preview">
                <input type="text" class="form-control image-preview-filename"> <!-- don't give a name === doesn't send on POST/GET -->
                <span class="input-group-btn">
                    <!-- image-preview-clear button -->
                    <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
                        <span class="glyphicon glyphicon-remove"></span> Clear
                    </button>
                    <!-- image-preview-input -->
                    <div class="btn btn-default image-preview-input">
                        <span class="glyphicon glyphicon-folder-open"></span>
                        <span class="image-preview-input-title">Choose File(CSV Only)</span>
                        <input type="file" accept="image/png, image/jpeg, image/gif" name="input-file-preview"/> <!-- rename it -->
                    </div>
                </span>         
            </div><!-- /input-group image-preview [TO HERE]--> 
            <center><button  id="upload" type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-file"></span> Upload File</button></center>
         </div>
        </form>
      </div>
    </div>
            <script>
             $(function() {
                    // Create the close button
                    var closebtn = $('<button/>', {
                        type:"button",
                        text: 'x',
                        id: 'close-preview',
                        style: 'font-size: initial;',
                    });
                    closebtn.attr("class","close pull-right");

                    // Clear event
                    $('.image-preview-clear').click(function(){
                        $('.image-preview').attr("data-content","").popover('hide');
                        $('.image-preview-filename').val("");
                        $('.image-preview-clear').hide();
                        $('.image-preview-input input:file').val("");
                        $(".image-preview-input-title").text("Browse"); 
                    }); 
                    // Create the preview image
                    $(".image-preview-input input:file").change(function (){     
                        var img = $('<img/>', {
                            id: 'dynamic',
                            width:250,
                            height:200
                        });      
                        var file = this.files[0];
                        var reader = new FileReader();
                        // Set preview image into the popover data-content
                        reader.onload = function (e) {
                            $(".image-preview-input-title").text("Change");
                            $(".image-preview-clear").show();
                            $(".image-preview-filename").val(file.name);
                        }        
                        reader.readAsDataURL(file);
                    });  
                });
            </script>
      <center>        
           
        <hr>
        <form action="../TruncateStuPerInfo" method="post">
            <input type="submit"  class="btn btn-danger" value="Truncate Table"/>
        </form>
        </center>
    </body>
</html>
