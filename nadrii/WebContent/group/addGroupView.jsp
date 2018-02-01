<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>���̹� :: Smart Editor 2 &#8482;</title>
<script type="text/javascript" src="/resources/smartEditor2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body>
<form name="addGroup" action="../group/addGroup" method="post">
	<select name="categoryCode" style="width:100px">
		<option>���Ӹ� ����</option>
		<option value="1">���Ӹ�1</option>
		<option value="2">���Ӹ�2</option>
		<option value="3">���Ӹ�3</option>
		<option value="4">���Ӹ�4</option>
	</select>
	<input type="text" name="title" style="width:656px"/>
	
	<textarea name="text" id="ir1" rows="10" cols="100" style="width:766px; height:412px; display:none;"></textarea>
	<!--textarea name="ir1" id="ir1" rows="10" cols="100" style="width:100%; height:412px; min-width:610px; display:none;"></textarea-->
	<p>
		<input type="button" onclick="showHTML();" value="���� ���� ��������" />
		<input type="button" onclick="submitContents(this);" value="������ ���� ����" />
	</p>
</form>

<script type="text/javascript">
var oEditors = [];
var sLang = "ko_KR";	// ��� (ko_KR/ en_US/ ja_JP/ zh_CN/ zh_TW), default = ko_KR
// �߰� �۲� ���
//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "/resources/smartEditor2/SmartEditor2Skin.html",	
	htParams : {
		bUseToolbar : true,				// ���� ��� ���� (true:���/ false:������� ����)
		bUseVerticalResizer : true,		// �Է�â ũ�� ������ ��� ���� (true:���/ false:������� ����)
		bUseModeChanger : true,			// ��� ��(Editor | HTML | TEXT) ��� ���� (true:���/ false:������� ����)
		//bSkipXssFilter : true,		// client-side xss filter ���� ���� (true:������� ���� / �׿�:���)
		//aAdditionalFontList : aAdditionalFontSet,		// �߰� �۲� ���
		fOnBeforeUnload : function(){
			//alert("�Ϸ�!");
		},
		I18N_LOCALE : sLang
	}, //boolean
	fOnAppLoad : function(){
		//���� �ڵ�
		oEditors.getById["ir1"].exec("PASTE_HTML", ["���� �̸� <input type='text' name='groupName'></br>"]);
	},
	fCreator: "createSEditor2"
});

function showHTML() {
	var sHTML = oEditors.getById["ir1"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);	// �������� ������ textarea�� ����˴ϴ�.
	
	// �������� ���뿡 ���� �� ������ �̰����� document.getElementById("ir1").value�� �̿��ؼ� ó���ϸ� �˴ϴ�.
	
	try {
		elClickedObj.form.submitSave();
	} catch(e) {}
	alert(this);
}

function submitSave(){
	alert(this);
	submitContents(this);
	
	$("form").attr("method" , "POST").attr("action" , "/group/addGroup").submit();
}
</script>

</body>
</html>