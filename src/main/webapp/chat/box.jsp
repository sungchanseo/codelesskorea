<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>CodeLess</title>
	<jsp:include page="../head.jsp"></jsp:include>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<!-- 	<script src="./js/chat.js"></script> -->
	<style type="text/css">	
		#boxTable *{
			font-family: 'TheJamsil5Bold' !important;
/* 			display: block; */
		}
		.chatNameM { font-size: 1em; color: #f6df66;}
		.chatContentM { font-size: 1.3em; color: #3e3d43;}
		.chatNameY { font-size: 1.3em; color: #6589f6;}
		.chatContentY { font-size: 1.7em; color: black;}
		.chatTime { font-size: 0.7em; color: gray;}
		.unRead { 
			float: right;
			font-size: 1.2em;
			font-stretch: expanded ; 
			background-color: red; 
			color: white; 
			border-radius: 0.5em;
			display: inline-block;
			position: relative;
			right: 5%;
			top: 40%;
			margin-left: 30px;
 			padding: 0.2em 0.7em; 
			position: absolute;
			
		
		}
		.chatbox {position: relative;}
	</style>
	<script type="text/javascript">
	    function getUnread() {
	    	$.ajax({
	    		type: "POST",
	    		url: "./ChatUnreadAction.ch",
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
	    	var userID = '${id}'
	    	$.ajax({
	    		type: "POST",
	    		url: "./ChatBoxAction.ch",
	    		data: {
	    			userID: encodeURIComponent(userID),
	    		},
	    		success: function(data) {
	    			if(data == "") {
	    				$('#boxTable').html('<span class="chatContentY">받은메세지가 없습니다.</span>');
	    				return;
	    			}
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
	    	var str = "";
	    	if(unread != 0) {
	    		str = '<div class="unRead">'+unread+'</div>';
	    	}
	    	$('#boxTable').append(
	    			'<tr onclick="location.href=\'ChatToSeller.ch?toID=' + encodeURIComponent(toID) + '\'">' +
	    			'<td style="width: 150px; position: relative;">' + 
	    			'<br>' +
	    			'<img class="media-object img-circle" style="margin: 0 auto; max-width: 40px; max-height: 40px; border-radius: 20px;" src="' + profile + '">' +                       
// 	    			'<h5>' + 
					'<br>' +
					'<span class="chatNameM">' +
	    			lastID + 
	    			'</span>' +
// 	    			'</h5>' +
	    			'</td>' + 
	    			'<td class="chatbox">' +
// 	    			'<h5>' + 
	    			'<br>' +
	    			'<span class="chatContentM">' +
	    			chatContent +
	    			'</span>' +
	    			'<br>' +
// 	    			'<span class="label label-info">' + 
// 	    			unread + 
// 	    			'</span>' +
// 	    			'</h5>' + 
// 	    			'<div class="pull-right">' + 
					'<span class="chatTime">' + 
	    			chatTime + 
	    			' </span>' +
// 	    			'</div>' + 
	    			str +
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
    <div class="col-sm-8" style="margin:auto;">
 	<div id="right" style="margin-left: 150px; width: 100%;">
        <table class="table" style="margin: 0 auto;">
            <thead>
                <tr>
                    <th><span class="chatContentY">주고받은 메시지 목록</span><br></th>
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
    </div>
    </div>
    
	<%
//         String messageContent = null;
//         if (session.getAttribute("messageContent") != null) {
//         	messageContent = (String) session.getAttribute("messageContent");
//         }
//         String messageType = null;
//         if (session.getAttribute("messageType") != null) {
//         	messageType = (String) session.getAttribute("messageType");
//         }
    %>
    <c:if test="${!empty messageContent }">
	    <div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
	        <div class="vertical-alignment-helper">
	            <div class="modal-dialog vertical-align-center">
<%-- 	                <div class="modal-content <% if(messageType.equals("오류 메시지")) out.println("panel-warning"); else out.println("panel-success"); %>"> --%>
	                <c:if test="${messageType eq '오류메세지' }">
		                <div class="modal-content panel-warning">
	                </c:if>
	                <c:if test="${!messageType eq '오류메세지' }">
		                <div class="modal-content panel-success">
	                </c:if>
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
	    <c:remove var="messageContent" scope="session"/>
	    <c:remove var="messageType" scope="session"/>
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