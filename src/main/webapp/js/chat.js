function autoClosingAlert(selector, delay) {
	var alert = $(selector);
	alert.show();
	window.setTimeout(function() { alert.hide() }, delay);
}
function submitFunction(fromID, toID) {
//	var fromID = '${id}';
//	var toID = '${param.toID}';
	var chatContent = $('#chatContent').val();
	$.ajax({
		type: "POST",
		url: "./ChatSubmitAction.ch",
		data: {
			fromID: encodeURIComponent(fromID),
			toID: encodeURIComponent(toID),
			chatContent: encodeURIComponent(chatContent),
		},
		success: function(result) {
			if(result == 1) {
				autoClosingAlert('#successMessage', 2000);
			} else if(result == 0) {
				autoClosingAlert('#dangerMessage', 2000);
			} else {
				autoClosingAlert('#warningMessage', 2000);
			}
		}
	});
	$('#chatContent').val('');
}
var lastID = 0;
function chatListFunction(type, fromID, toID, fromProfile, toProfile) {
//	var fromID = '${id}';
//	var toID = '${param.toID}';
	$.ajax({
		type: "POST",
		url: "./ChatListAction.ch",
		data: {
			fromID: encodeURIComponent(fromID),
			toID: encodeURIComponent(toID),
			listType: type
		},
		success: function(data) {
			if(data == "") return;
			var parsed = JSON.parse(data);
			var result = parsed.result;
			for(var i=0; i<result.length; i++) {
				if(result[i][0].value == fromID) {
					result[i][0].value = '나';
				}
				addChat(result[i][0].value, result[i][2].value, result[i][3].value, fromProfile, toProfile);
			}	
			lastID = Number(parsed.last);
		}
	});
}
function addChat(chatName, chatContent, chatTime, fromProfile, toProfile) {
	if(chatName == '나') {
    	$('#chatList').append(
    			'<div class="row">' +
    			'<div class="col-lg-12">' +
    			'<div class="media">' + 
    			'<img class="media-object img-circle" style="width: 30px; height: 30px;" src="'+fromProfile+'" alt="">' +
    			'<div class="media-body">' + 
    			'<h4 class="media-heading">'+
    			chatName +
    			'<span class="small pull-right">' + 
    			chatTime + 
    			'</span>' + 
    			'</h4>' + 
    			'<p>' + 
    			chatContent + 
    			'</p>' + 
    			'</div>' + 
    			'</div>' + 
    			'</div>' + 
    			'</div>' + 
    			'<hr>');	  
	} else {
    	$('#chatList').append('<div class="row">' +
    			'<div class="col-lg-12">' +
    			'<div class="media">' + 
    			'<img class="media-object img-circle" style="width: 30px; height: 30px;" src="'+toProfile+'" alt="">' +
    			'<div class="media-body">' + 
    			'<h4 class="media-heading">'+
    			chatName +
    			'<span class="small pull-right">' + 
    			chatTime + 
    			'</span>' + 
    			'</h4>' + 
    			'<p>' + 
    			chatContent + 
    			'</p>' + 
    			'</div>' + 
    			'</div>' + 
    			'</div>' + 
    			'</div>' + 
    			'<hr>');	
	}
	$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
}
function getInfiniteChat(fromID, toID, fromProfile, toProfile) {
	setInterval(function() {
		chatListFunction(lastID, fromID, toID, fromProfile, toProfile);
	}, 3000);
}
function getUnread(id) {
	$.ajax({
		type: "POST",
		url: "./ChatUnreadAction.ch",
		data: {
			userID: encodeURIComponent(id),
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
	    function chatBoxFunction(userID) {
//	    	var userID = '${id}';
	    	$.ajax({
	    		type: "POST",
	    		url: "./ChatBoxAction.ch",
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
	    	$('#boxTable').append('<tr onclick="location.href=\'ChatToSeller.ch?toID=' + encodeURIComponent(toID) + '\'">' +
	    			'<td style="width: 150px;">' + 
	    			'<img class="media-object img-circle" style="margin: 0 auto; max-width: 40px; max-height: 40px;" src="' + profile + '">' +                       
	    			'<h5>' + lastID + '</h5></td>' + 
	    			'<td>' +
	    			'<h5>' + chatContent +
	    			'<span class="label label-info">' + unread + '</span></h5>' + 
	    			'<div class="pull-right">' + chatTime + '</div>' + 
	    			'</td>' + 
	    			'</tr>');
	    }
	    function getInfiniteBox(userID) {
	    	setInterval(function() {
	    		chatBoxFunction(userID);
	    	}, 3000);
	    }