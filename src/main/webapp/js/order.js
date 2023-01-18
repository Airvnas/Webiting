
	$(document).ready(function () {
		
		$("#drop_out_of_member").click(function(event) {
			event.preventDefault();
			
			var userid =  $("#inputId").val();
			location.assign("/member/delete/" + userid);
		});
		
		$("#back_to_main").click(function() {
			location.assign("/");
		});
		
		$("#update_userInfo").click(function() {
			var userid = $("#inputId").val();
			location.assign("/member/update/" + userid);
		});
		
		$("#go_to_member_insert").click(function(event) {
			event.preventDefault();
			
			location.assign("/member/insert");
		});
		
		$("#mypage_btn").click(function(event) {
			event.preventDefault();
			var userid = $("#login_userid").val();
			
			location.assign("/member/read/" + userid);
		})
		
		$("#logout_btn").click(function(event) {
			event.preventDefault();
			
			var logout = confirm("로그아웃 하시겠습니까?");
			
			if (logout) {
				location.assign("/member/logout");
			} 
		});
		
	});