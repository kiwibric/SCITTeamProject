<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>게시판</title>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
        <script src="//cdn.ckeditor.com/4.7.1/standard/ckeditor.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                 
                CKEDITOR.replace( 'content' );
                CKEDITOR.config.height = 500;
                 
                $("#boardList").click(function(){
                    location.href = "/board/list?target=${boardView.target}";
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
                            target		: $("#target").val(),
                            subject     : $("#subject").val(),
                            password    : $("#password").val(),
                            content     : content
                    };
                     
                    //ajax 호출
                    $.ajax({
                        url         :   "/board/save",
                        dataType    :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :   "post",
                        data        :   objParams,
                        success     :   function(retVal){
 
                            if(retVal.code == "OK") {
                                alert(retVal.message);
                                location.href = "/board/list";  
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
    </head>
    <body>
    	<input type="hidden" id="target" name="target" value="${boardView.target }">
        <input type="hidden" id="cmt_id" name="cmt_id" value="${boardView.cmt_id}" />
        <div align="center">
            </br>
            </br>
            <table width="1200px">
                <tr>
                    <td>
                        제목: <input type="text" id="subject" name="subject" style="width:600px;" placeholder="제목" value="${boardView.subject}"/>
                        비밀번호: <input type="password" id="password" name="password" style="width:170px;" maxlength="10" placeholder="패스워드"/>
                        <button id="save" name="save">저장</button>                           
                    </td>
                </tr>
                <tr>
                    <td>
                        <textarea name="content" id="content" rows="10" cols="80">${boardView.content}</textarea>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <button type="button" id="boardList">계시판</button>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</html>