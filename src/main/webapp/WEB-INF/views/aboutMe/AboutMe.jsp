<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<div id="aboutMeEditPanel" class="edit-panel">
	<div class="edit-panel-header">
		<button type="button" class="close close-button"
			data-dismiss="edit-panel" aria-label="Close">
			<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
		</button>
		<h4 class="edit-panel-title">关于我</h4>
	</div>
	<div class="edit-panel-body">
		<form id="aboutMe" method="post" action="${ctx }/about/add">
			<input id="id" name="id" type="hidden" value="${aboutMe.id }">
			<div class="form-group col-md-4">
				<!-- 姓名 -->
				<label for="names">姓名：</label> <input id="names" name="name"
					placeholder="请输入姓名" autofocus class="form-control"
					required type="text" maxlength="100" value="${aboutMe.name }">
			</div>
			<div class="form-group col-md-4">
				<!-- 性别 -->
				<label>性别：</label>
				<div>
					<label class="radio-inline"> <input id="gender1"
						name="gender" type="radio" value="male" checked>男
					</label> <label class="radio-inline"> <input id="gender2"
						name="gender" type="radio" value="female" <c:if test="${aboutMe.gender == 'female' }">checked</c:if>>女
					</label>
				</div>
			</div>
			<div class="form-group col-md-4 date">
				<!-- 生日 -->
				<label for="birthday">生日：</label> <input id="birthday"
					name="birthday" placeholder="请选择日期" class="form-control date-picker"
					required="required" readonly="readonly" type="text"
					 maxlength="100" value="${aboutMe.birthdayStr }" data-language="zh">
			</div>
			<div class="form-group col-md-4">
				<!-- 教育程度 -->
				<label for="educationDegreeId">学历：</label> <select
					id="educationDegreeId" name="educationDegree.id"
					class="form-control">
					<c:forEach var="education_degree" items="${educationDegree }">
						<option value="${education_degree.id }" <c:if test="${education_degree.id == aboutMe.educationDegree.id }">selected</c:if>>${education_degree.name }</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group col-md-4">
				<!-- 工作年限 -->
				<label for="workingYears">工作年限：</label> <input id="workingYears"
					name="workingYears" placeholder="请输入工作年限" class="form-control"
					required="required" type="text" maxlength="100" value="${aboutMe.workingYears }">
			</div>
			<div class="form-group col-md-4">
				<!-- 工作状态 -->
				<label for="workingStatusId">工作状态：</label> <select
					id="workingStatusId" name="workingStatus.id" class="form-control">
					<c:forEach var="ws" items="${workingStatus }">
						<option value="${ws.id }" <c:if test="${ws.id == aboutMe.workingStatus.id }">selected</c:if>>${ws.name }</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group col-md-4">
				<!-- 居住地 -->
				<label for="residence">居住地：</label> <input id="residence"
					name="residence" placeholder="请输入你的居住地" class="form-control"
					required="required" type="text" maxlength="200" value="${aboutMe.residence }">
			</div>
			<div class="form-group col-md-4">
				<!-- 邮件 -->
				<label for="email">邮件：</label> <input id="email" name="email"
					placeholder="请输入你的邮件地址" class="form-control" required="required"
					type="text" maxlength="100" value="${aboutMe.email }">
			</div>
			<div class="form-group col-md-4">
				<!-- 手机 -->
				<label for="mobile">手机：</label> <input id="mobile" name="mobile"
					placeholder="请输入手机号" class="form-control" required="required"
					type="text" maxlength="50" value="${aboutMe.mobile }">
			</div>
			<div class="form-group col-md-12">
				<!-- 人生格言 -->
				<label for="motto">人生格言：</label> <input id="motto" name="motto"
					placeholder="请输入人生格言" class="form-control" required="required"
					type="text" maxlength="300" value="${aboutMe.motto }">
			</div>
			<div class="edit-panel-footer col-md-12">
				<!-- 保存 -->
				<button class="btn btn-primary save-btn save-aboutMe-btn">
					<i class="fa fa-floppy-o"></i> 保存
				</button>
				<!-- 取消 -->
				<button class="btn btn-default cancel-btn close-button">
					<i class="fa fa-times"></i> 取消
				</button>
			</div>
		</form>
	</div>
</div>

<script type="text/javascript">
	$(function() {
		var $aboutMeForm = $("#aboutMe");
		
		//初始化日期生日选择
        $("#birthday").datepicker({
            dateFormat: "yyyy-mm-dd",
            autoClose: true
        });
		
		// 初始化表单
		$aboutMeForm.on("submit", function(e) {
			// 阻止表单默认提交
			e.preventDefault();
			var $this = $(this);
			
			$this.ajaxSubmit({
				success: function() {
					// 刷新界面
					loadIndexContent();
				}
			});
		});
	});
</script>