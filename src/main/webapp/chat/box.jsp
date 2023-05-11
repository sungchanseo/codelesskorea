<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../head.jsp"></jsp:include>
<!-- 	<link rel="stylesheet" href="css/bootstrap.css"> -->
<!-- 	<link rel="stylesheet" href="css/custom.css"> -->
	<title></title>
<!-- 	<script src="js/bootstrap.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
	<script type="text/javascript">
	    function getUnread() {
	    	$.ajax({
	    		type: "POST",
	    		url: "./ChatUnreadAction.me",
	    		data: {
	    			userID: encodeURIComponent('${id}'),
	    		},
	    		success: function(result) {
	    			if(result >= 1) {
	    				showUnread(result);
	    			} else {
	    				showUnread('');
	    			}
	    		}
	    	});
	    }
	    function getInfiniteUnread() {
	    	setInterval(function() {
	    		getUnread();
	    	}, 4000);
	    }
	    function showUnread(result) {
	    	$('#unread').html(result);
	    }
	    function chatBoxFunction() {
	    	var userID = '${id}';
	    	$.ajax({
	    		type: "POST",
	    		url: "./ChatBoxAction.me",
	    		data: {
	    			userID: encodeURIComponent(userID),
	    		},
	    		success: function(data) {
	    			if(data == "") return;
	    			$('#boxTable').html('');
	    			var parsed = JSON.parse(data);
	    			var result = parsed.result;
	    			for(var i=0; i<result.length; i++) {
	    				if(result[i][0].value == userID) {
	    					result[i][0].value = result[i][1].value;
	    				} else {
	    					result[i][1].value = result[i][0].value;
	    				}
	    				addBox(result[i][0].value, result[i][1].value, result[i][2].value, result[i][3].value, result[i][4].value, result[i][5].value);
	    			}
	    		}
	    	});
	    }
	    function addBox(lastID, toID, chatContent, chatTime, unread, profile) {
	    	$('#boxTable').append('<tr onclick="location.href=\'ChatToSeller.me?toID=' + encodeURIComponent(toID) + '\'">' +
	    			'<td style="width: 150px;">' + 
// 	    			'<img class="media-object img-circle" style="margin: 0 auto; max-width: 40px; max-height: 40px;" src="' + profile + '">' +                       
	    			'<h5>' + lastID + '</h5></td>' + 
	    			'<td>' +
	    			'<h5>' + chatContent +
	    			'<span class="label label-info">' + unread + '</span></h5>' + 
	    			'<div class="pull-right">' + chatTime + '</div>' + 
	    			'</td>' + 
	    			'</tr>');
	    }
	    function getInfiniteBox() {
	    	setInterval(function() {
	    		chatBoxFunction();
	    	}, 3000);
	    }
	</script>

</head>
<body>
	<jsp:include page="../nav.jsp"/>
    <div class="container">
        <table class="table" style="margin: 0 auto;">
            <thead>
                <tr>
                    <th><h4>주고받은 메시지 목록</h4></th>
                </tr>
            </thead>
            <div style="overflow-y: auto; width: 100%; max-height: 450px;">
                <table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd; margin: 0 auto;">
                    <tbody id="boxTable">
                    </tbody>
                </table>
            </div>
        </table>
    </div>
	<%
        String messageContent = null;
        if (session.getAttribute("messageContent") != null) {
        	messageContent = (String) session.getAttribute("messageContent");
        }
        String messageType = null;
        if (session.getAttribute("messageType") != null) {
        	messageType = (String) session.getAttribute("messageType");
        }
    %>
    <c:if test="${!empty messageContent }">
	    <div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
	        <div class="vertical-alignment-helper">
	            <div class="modal-dialog vertical-align-center">
	                <div class="modal-content <% if(messageType.equals("오류 메시지")) out.println("panel-warning"); else out.println("panel-success"); %>">
<%-- 	                <c:if test="${messageType eq '오류 메세지' }"><c:out value="panel-warning"></c:out></c:if> --%>
<%-- 	                <c:if test="${!messageType eq '오류 메세지' }"><c:out value="panel-success"></c:out></c:if> --%>
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
	                        ${messageType }
	                    </div>
	                    <div class="modal-footer">
	                        <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <c:remove var="messageContent"/>
	    <c:remove var="messageType"/>
    </c:if>
    <script>
        $('#messageModal').modal("show");
    </script>
	<c:if test="${!empty id }">
        <script type="text/javascript">
            $(document).ready(function() {
            	getUnread();
            	getInfiniteUnread();
            	chatBoxFunction();
            	getInfiniteBox();
            });
        </script>

	</c:if>
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>