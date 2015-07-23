<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <!-- Modal -->
  <div class="modal fade" id="reportModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Report</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form role="form" id="reForm" name="reForm">
          	<input type="hidden" name="report_sender" value="${member.memberNum}">
          	<input type="hidden" name="report_receiver" value="${applyDto.apply_host}">
          	<input type="hidden" name="report_boardnum" value="${applyDto.apply_num}">
          	<input type="hidden" name="report_boardtype" value="A">
            <div class="form-group">
              <label for="report_content"><span class="glyphicon glyphicon-pencil"></span> Content</label>
              <textarea rows="12" cols="58" class="form-control" id="report_content" name="report_content" placeholder="Enter Report Content"></textarea>
            </div>
              <input type="button" onclick="reportForm(reForm)" class="btn btn-success btn-block" value="Report"></input>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger btn-default pull-right" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
        </div>
      </div>
    </div>
  </div> 
</body>
</html>