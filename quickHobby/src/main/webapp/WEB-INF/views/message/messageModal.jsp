<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Message Pop-Up// -->
 <div class="container">
  <!-- Modal -->
  <div class="modal fade" id="messageModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 30px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-pencil"></span> Message</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
        
        <!-- message sending -->
          <form name="sendMsg" role="form">
            <div class="form-group">
              <label for="from" class="col-sm-2 control-label"> From</label>
              <div class="col-sm-10">
              	<input type="text" class="form-control" id="messageFrom" value="${member.memberNickName}" disabled="disabled">
              	<input type="hidden" id="messageFromHidden" name="messageFrom" value="${member.memberNum}"/>
              </div>
            </div>
            <div class="form-group">
              <label for="to" class="col-sm-2 control-label"> To</label>
              <div class="col-sm-10">
              	<input type="text" class="form-control" id="messageTo" value=""  disabled>
              	<input type="hidden" id="messageToHidden" name="messageTo" value=""/>
              </div>
            </div>
            <div class="form-group">
              <label for="message" class="col-sm-2 control-label">Message</label>
        		<div class="col-sm-10">
           		 <textarea class="form-control" rows="4" id="messageContent" ></textarea>
        		</div>
            </div>
            <div class="text-center">
              <button type="button" id="sendMsg" class="btn btn-success btn-sm" style="background-color:#BDBDBD; border-color:#BDBDBD; margin-top:10px">
               Send</button>
              <button type="reset" class="btn btn-success btn-sm" style="background-color:#BDBDBD; border-color:#BDBDBD; margin-top:10px">
               Cancel</button>
             </div>
          </form>
          <!-- message sending -->
        </div>
      </div>
    </div>
  </div> 
</div>
<!-- //Message Pop-Up -->
</body>
</html>