<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<div id="hobbyEditPanel" class="edit-panel">
	<div class="edit-panel-header">
		<button type="button" class="close close-button"
			data-dismiss="edit-panel" aria-label="Close">
			<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
		</button>
		<h4 class="edit-panel-title">爱好</h4>
	</div>
	<div class="edit-panel-body row">
		<!-- 爱好管理表单 -->
		<form id="hobbyForm" name="education">
			<div class="col-md-2">
				<div class="panel panel-default">
					<div class="panel-heading text-center">爱好 1</div>
					<div class="panel-body">
						<input type="hidden" name="id" value="1">
						<div class="form-group">
							<div class="hobby-imagea"></div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<input type="text" class="form-control validate[required]"
									name="name" value="旅游" placeholder="名称...">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2">
				<div class="panel panel-success">
					<div class="panel-heading text-center">爱好 2</div>
					<div class="panel-body">
						<input type="hidden" name="id" value="2">
						<div class="form-group">
							<div class="hobby-imageb"></div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<input type="text" class="form-control validate[required]"
									name="name" value="读书" placeholder="名称...">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2">
				<div class="panel panel-info">
					<div class="panel-heading text-center">爱好 3</div>
					<div class="panel-body">
						<input type="hidden" name="id" value="3">
						<div class="form-group">
							<div class="hobby-imagec"></div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<input type="text" class="form-control validate[required]"
									name="name" value="旅游" placeholder="名称...">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2">
				<div class="panel panel-warning">
					<div class="panel-heading text-center">爱好 4</div>
					<div class="panel-body">
						<input type="hidden" name="id" value="4">
						<div class="form-group">
							<div class="hobby-imaged"></div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<input type="text" class="form-control validate[required]"
									name="name" value="运动" placeholder="名称...">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2">
				<div class="panel panel-danger">
					<div class="panel-heading text-center">爱好 5</div>
					<div class="panel-body">
						<input type="hidden" name="id" value="5">
						<div class="form-group">
							<div class="hobby-imagee"></div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<input type="text" class="form-control validate[required]"
									name="name" value="打游戏" placeholder="名称...">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2">
				<div class="panel panel-primary">
					<div class="panel-heading text-center">爱好 6</div>
					<div class="panel-body">
						<input type="hidden" name="id" value="6">
						<div class="form-group">
							<div class="hobby-imagef"></div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<input type="text" class="form-control validate[required]"
									name="name" value="美食" placeholder="名称...">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="edit-panel-footer col-md-12">
				<button type="button" class="btn btn-primary save-btn">
					<i class="fa fa-floppy-o"></i> 保存
				</button>
				<button type="button" class="btn btn-default cancel-btn">
					<i class="fa fa-times"></i> 取消
				</button>
			</div>
		</form>
	</div>
</div>

<!-- <script type="text/javascript">
	$(function() {
		$(".save-btn").on("click", function() {
			submitSkillForm();
		})
	})

	// 将表单对象序列化成Json字符串提交，以List接收
	function serializeJson($this) {
		var skillJsonData = {};
		var serializeArray = $this.serializeArray();
		// 先转换成{"id": ["12","14"], "name": ["aaa","bbb"], "pwd":["pwd1","pwd2"]}这种形式
		$(serializeArray).each(
				function() {
					if (skillJsonData[this.name]) {
						if ($.isArray(skillJsonData[this.name])) {
							skillJsonData[this.name].push(this.value);
						} else {
							skillJsonData[this.name] = [
									skillJsonData[this.name], this.value ];
						}
					} else {
						skillJsonData[this.name] = this.value;
					}
				});
		// 再转成[{"id": "12", "name": "aaa", "pwd":"pwd1"},{"id": "14", "name": "bb", "pwd":"pwd2"}]的形式
		var vCount = 0;
		// 计算json内部的数组最大长度
		for ( var item in skillJsonData) {
			var tmp = $.isArray(skillJsonData[item]) ? skillJsonData[item].length
					: 1;
			vCount = (tmp > vCount) ? tmp : vCount;
		}

		if (vCount > 1) {
			var skillJsonData1 = new Array();
			for (var i = 0; i < vCount; i++) {
				var jsonObj = {};
				for ( var item in skillJsonData) {
					jsonObj[item] = skillJsonData[item][i];
				}
				skillJsonData1.push(jsonObj);
			}
			return JSON.stringify(skillJsonData1);
		} else {
			return "[" + JSON.stringify(skillJsonData) + "]";
		}
	}

	function submitSkillForm() {
		var $skillForm = $("#skillForm");
		var jsonStr = serializeJson($skillForm);
		$.ajax({
			url : ctx + "/skill/add",
			type : "POST",
			contentType : 'application/json;charset=utf-8', //设置请求头信息
			dataType : "json",
			data : jsonStr,
			success : function() {
				// 刷新界面
				loadIndexContent();
			}
		});
	}
</script> -->