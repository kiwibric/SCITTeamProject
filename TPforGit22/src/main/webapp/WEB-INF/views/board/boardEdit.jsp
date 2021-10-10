<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>投稿</title>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
        <script src="//cdn.ckeditor.com/4.7.1/standard/ckeditor.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                 
                CKEDITOR.replace( 'content' );
                CKEDITOR.config.height = 500;
                 
                $("#boardList").click(function(){
                	if ($("#list_target").val().trim() != "") {
	                    location.href = "/board/list?target=${list[0].target}";
					}
                	else location.href = "/board/list?target=${boardView.target}";
                });
                 
                $("#save").click(function(){
                     
                    // 에디터 내용 가져옴
                    var content = CKEDITOR.instances.content.getData();
                     
                    // NULL 검사
                    if($("#subject").val().trim() == ""){
                        alert("제목을 입력하세요.");
                        $("#subject").focus();
                        return false;
                    }
                     
                    if($("#password").val().trim() == ""){
                        alert("비밀번호를 입력하세요.");
                        $("#password").focus();
                        return false;
                    }
                     
                    //값 셋팅
                    var objParams = {
                    		
                            <c:if test="${boardView.cmt_id != null}"> //있으면 수정 없으면 등록
                            cmt_id          : $("#cmt_id").val(),
                            </c:if>
                            
                            <c:choose>
                            	<c:when test="${list[0].target != null}">
                            	target		: $("#list_target").val(),
                            	</c:when>
                            	<c:when test="${boardView.target != null}">
                            	target		: $("#boardView.target").val(),
                            	</c:when>
                            </c:choose>
                            
                            subject     : $("#subject").val(),
                            password    : $("#password").val(),
                            content     : content
                    };
                     
                    //ajax 호출
                    $.ajax({
                        url         :   "/board/save",
                        dataType    :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8", // default
                        type        :   "post",
                        data        :   objParams,
                        success     :   function(retVal){
 
                            if(retVal.code == "OK") {
                                alert(retVal.message);
                                if ($("#list_target").val().trim() != "") {
            	                    location.href = "/board/list?target=${list[0].target}";
            					}
                            	else location.href = "/board/list?target=${boardView.target}";  
                            } else {
                                alert(retVal.message);
                            }
                             
                        },
                        error       :   function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                     
                });
                 
            });
        </script>
        <style type="text/css">
        </style>
    </head>
    <body>
    	<input type="hidden" id="list_target" name="list_target" value="${list[0].target }">
    	<input type="hidden" id="boardView_target" name="boardView_target" value="${boardView.target }">
        <input type="hidden" id="cmt_id" name="cmt_id" value="${boardView.cmt_id}" />
        <div align="center">
            </br>
            <table width="1200px">
            	<tr>
            		<td align="left">
                        <button type="button" id="boardList">戻る</button>
                    </td>
            	</tr>
                <tr>
                    <td>
                        タイトル: <input type="text" id="subject" name="subject" style="width:600px;" placeholder="Title" value="${boardView.subject}"/>
                        パスワード: <input type="password" id="password" name="password" style="width:170px;" maxlength="10" placeholder="Password"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <textarea name="content" id="content" rows="10" cols="80">${boardView.content}</textarea>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <button id="save" name="save" class="write">投稿する</button>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>