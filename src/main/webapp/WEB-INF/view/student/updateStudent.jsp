<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="content-type" content="text/html" charset="UTF-8">
	<title>修改student</title>
</head>
  <body>
     <div style="margin-bottom: 10px">
	    <input type="button" value="返回" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="studentBack()" /> 
		<input type="button" value="保存" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="studentSave()" /> 
		<input type="button" value="取消" style="width: 80px; height: 30px; vertical-align: bottom; line-height: 10px;" class="btn-primary" onclick="studentCancle()" /> 
	 </div>
	 <div>
      <form id="studentUpdateFm" name="studentUpdateFm"  method="post" action="">
          <input type="hidden" name="id" value="${student.id}"/>
          <table border="0" cellpadding="0"  cellspacing="0"
	         class="formlist" style="width: 100%; table-layout: fixed;">
                      <tr>
                            <th>姓名</th>
                            <td><textarea id='sname' name='sname' value='${student.sname}' class="{required:true,maxlength:100}"  rows="2" >${student.sname}</textarea></td>
                            <th>性别</th>
                            <td><select id='sex' name='sex' style="width: 174px;" value='${student.sex}'
								class="publicSelect2" >
									<option value="1">男</option>
									<option value="0">女</option>
							</select></td>
                      </tr>
                      <tr>
                            <th>年龄</th>
                            <td><input id='age'  name='age' value='${student.age}'/></td>
                            <th>生日</th>
                            <td><input id='birthday'  name='birthday' readonly='true' onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" value='<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${student.birthday}" />'/></td>
                      </tr>

          </table>
       </form>
     </div> 
     <script type="text/javascript">
       function studentSave(){//保存
          if($('#studentUpdateFm').valid()){//验证通过
				$.ajax({
					url: $.common.basePath+'/student/update',
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					datatype: 'json',
					type:"post",
					data:$('#studentUpdateFm').serializeObject(),
					success: function(json, status) {
						if(json==true){
							layer.msg('修改成功', {
				    				icon:1, 
								    time: 500,
								    end: function(index, layero){ 
								    	  parent.layer.close(parent.layer.getFrameIndex(window.name));  // 关闭layer
								          window.parent.location.reload(); //刷新父页面
										 //window.location.href=$.common.basePath+'/student/init';
									}
							}); 
						}else{
						    layer.msg('修改失败', {
			    				icon:5, 
							    time: 500,
							    end: function(index, layero){ 
							         parent.layer.close(parent.layer.getFrameIndex(window.name));  // 关闭layer
								     window.parent.location.reload(); //刷新父页面
									 //window.location.href=$.common.basePath+'/student/init';
								}
						    });
						}
					},
					error: function(json, status) {
						layer.msg('系统异常,请稍后重试或联系技术人员', {
		    				icon:5, 
						    time: 1500,
						    end: function(index, layero){ 
						         parent.layer.close(parent.layer.getFrameIndex(window.name));  // 关闭layer
								 window.parent.location.reload(); //刷新父页面
								 //window.location.href=$.common.basePath+'/student/init';
							}
					    });
					}
				});
		  }
       }
       function studentCancle(){//取消
          $(':input','#studentUpdateFm') 
			    .not(':button, :submit, :reset, :hidden') 
			    .val('') 
			    .removeAttr('checked') 
			    .removeAttr('selected');
       }
       function studentBack(){//返回
          parent.layer.close(parent.layer.getFrameIndex(window.name));  // 关闭layer
		  window.parent.location.reload(); //刷新父页面
          //window.location.href=$.common.basePath+'/student/init';
       }
     </script>
  </body>
</html>
