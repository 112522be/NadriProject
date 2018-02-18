<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>

function join(val) {
	var form = document.MemberJoinForm;
	form.action = "/member/join.asp";
	var param = "";
	var strURL = "";
	if (val == "snsJoin") {
		param+= "&snsid="+valsnsid;
		param+= "&usermail=" + valusermail;
		param+= "&snsusername=" + valname_val;
		param+= "&snsisusing=Y"
		param+= "&snsgubun="+valsnsgubun;
		param+= "&tenbytenid="+valtenbytenid;
		param+= "&tokenval="+acc_token_val;
		param+= "&age="+valage;
		param+= "&sexflag="+valsexflag;
		strURL="/user/addUserView" + param;
		if(typeof(opener.window)=="object"){
			opener.top.location.href = strURL;
		}
		self.close();
	} 
}

function jsGoURL(strURL){
	if(typeof(opener.window)=="object"){
		opener.top.location.href = strURL;
	}	
	self.close();
}

function winOpen()
{
window.open("loginView2.jsp","new","width=600,height=500,top=250,left=600"); 
} 
</script>
</head>
<body>
<a href="javascript:;" onclick="winOpen()">·Î±×ÀÎ</a>

</body>
</html>