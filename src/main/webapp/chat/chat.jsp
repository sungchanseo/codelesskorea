<%@page import="com.itwillbs.db.ChatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<jsp:include page="../head.jsp"/>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="./js/chat.js"></script>

</head>
	<jsp:include page="../nav.jsp"/>
<body>
	<div class="container bootstrap snippet">
		<div class="row">
			<div class="col-xs-12">
				<div class="portlet portlet-default">
					<div class="portlet-heading">
						<div class="portlet-title">
<!--                             <h4><i class="fa fa-circle text-green"></i>실시간 채팅창</h4> -->
						</div>
						<div class="clearfix"></div>
					</div>
<!--                     <div id="chat" class="panel-collapse collapse in"> -->
					<div id="chatList" class="portlet-body chat-widget" style="overflow-y: auto; width: 800px; height: 600px;">
					</div>
					<div class="portlet-footer">
						<div class="row" style="height: 90px;">
							<div class="form-group col-xs-10">
								<textarea style="height: 80px;" id="chatContent" class="form-control" placeholder="메시지를 입력하세요." maxlength="100"></textarea>
							</div>
							<div class="form-group col-xs-2">
								<button type="button" class="btn btn-default pull-right" onclick="submitFunction();">전송</button>
							<div class="clearfix"></div>
							</div>
						</div>
					</div>
<!--                     </div> -->
				</div>
			</div>
		</div>
	</div>
    <div class="alert alert-success" id="successMessage" style="display: none;">
        <strong>메시지 전송에 성공했습니다.</strong>
    </div>
        <div class="alert alert-danger" id="dangerMessage" style="display: none;">
        <strong>이름과 내용을 모두 입력해주세요.</strong>
    </div>
        <div class="alert alert-warning" id="warningMessage" style="display: none;">
        <strong>데이터베이스 오류가 발생했습니다.</strong>
    </div>
    <%
//         String messageContent = null;
//         if (session.getAttribute("messageContent") != null) {
//         	messageContent = (String) session.getAttribute("messageContent");
//         }
        String messageType = null;
        if (session.getAttribute("messageType") != null) {
        	messageType = (String) session.getAttribute("messageType");
        }
//         if (messageContent != null) {
    %>
    <c:if test="${!empty messageContent }">
    <div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="vertical-alignment-helper">
            <div class="modal-dialog vertical-align-center">
                <div class="modal-content <% if(messageType.equals("오류 메시지")) out.println("panel-warning"); else out.println("panel-success"); %>">
                    <div class="modal-header panel-heading">
                        <button type="button" class="close" data-dismiss="modal">
                            <span aria-hidden="true">&times</span>
                            <span class="sr-only">Close</span>
                        </button>
                        <h4 class="modal-title">
                            ${messageType }
                        </h4>
                    </div>
                    <div class="modal-body">
                        ${messageContent}
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $('#messageModal').modal("show");
    </script>
	    <c:remove var="messageContent" scope="session"/>
	    <c:remove var="messageType" scope="session"/>
    </c:if>
    <script type="text/javascript">
	    $(document).ready(function() {
	    	getUnread('${id}');
	        chatListFunction('0', '${id}', '${param.toID}', '${fromProfile}', '${toProfile}');
	        getInfiniteChat('${id}', '${param.toID}', '${fromProfile}', '${toProfile}');
	        getInfiniteUnread();
	    });
    </script>
    <jsp:include page="../footer.jsp"/>
</body>
</html>