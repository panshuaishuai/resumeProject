<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<div id="uploadEditPanel" class="edit-panel">
	<div class="edit-panel-header">
		<button type="button" class="close close-button"
			data-dismiss="edit-panel" aria-label="Close">
			<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
		</button>
		<h4 class="edit-panel-title">上传简历</h4>
	</div>
	<div class="edit-panel-body row">
		<!-- 上传简历文件表单 -->
		<form id="educationForm" name="education"
			enctype="multipart/form-data">
			<input type="hidden" name="id" value="1"> <input
				type="hidden" name="name" value="明博">
			<div class="col-md-4">
				<div class="form-group">
					<div class="input-group">
						<input id="resumeFile" type="file" class="form-control"
							name="file" required="required">
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<!-- 简历文件信息 -->
				<p id="resumeFileInfo"></p>
			</div>
			<div class="col-md-4">
				<!-- 上传文件进度信息 -->
				<p id="uploadProgressInfo"></p>
			</div>
			<div class="col-md-12">
				<!-- 上传文件进度条 -->
				<div class="progress">
					<div id="uploadProgressBar"
						class="progress-bar progress-bar-success progress-bar-striped active"
						role="progressbar" aria-valuemin="0" aria-valuemax="100"
						style="width: 0%"></div>
				</div>
			</div>
			<div class="edit-panel-footer col-md-12">
				<!-- 上传按钮 -->
				<button id="uploadResumeBtn" type="button" class="btn btn-primary"
					onclick="uploadResuleFile();" disabled="disabled">
					<i class="fa fa-floppy-o"></i> 上传
				</button>
				<!-- 取消按钮 -->
				<button type="button" class="btn btn-default cancel-btn">
					<i class="fa fa-times"></i> 取消
				</button>
			</div>
		</form>
	</div>
</div>

<!-- <script>
	$(function() {
		//为文件选择组件 onchange 绑定处理函数事件
		$('#resumeFile').change(
				function() {
					var file = this.files[0];
					var name = file.name;//文件名称
					var size = file.size;//文件大小
					var type = file.type;//文件类型
					$('#resumeFileInfo').html(
							Message.file_type + '：' + type + ' '
									+ Message.file_size + '：'
									+ bytesToSize(size));
					//上传按初始为“禁用”状态，选择文件后，改为可用状态（去掉 disabled 属性）
					$('#uploadResumeBtn').removeAttr('disabled');
				});

	});

	//开始上传简历文件
	function uploadResuleFile() {
		//创建 FormData 对象，初始化内容为form表单中的数据（可以利用 formData.append("property", "value"); 向 formData 添加元素）
		var formData = new FormData($('#educationForm')[0]);
		//利用 jQuery ajax 异步上传文件
		$
				.ajax({
					url : ctx + '/download/upload',
					type : "POST",
					data : formData,
					xhr : function() { //ajaxSettings中的xhr对象，为 upload 属性绑定 progress 处理函数
						var xhrObj = $.ajaxSettings.xhr();
						if (xhrObj.upload) { //检查upload属性是否存在
							//绑定progress事件的回调函数
							xhrObj.upload.addEventListener('progress',
									uploadProgressHandler, false);
						}
						return xhrObj;
					},
					success : function(result) {
						toastr.success(Message.resume_upload_success);
						//刷新下载简历内容
						loadDownloadResumeContent();
					},
					error : function(context, xhr) {
						toastr.error(Message.resume_upload_fail
								+ context.responseText);
					},
					contentType : false,
					processData : false
				});
	}

	//文件上传进度回调函数
	function uploadProgressHandler(e) {
		if (e.lengthComputable) {
			var percent = (e.loaded / e.total * 100).toFixed(0) + '%';
			//更新文件上传进度条
			$('#uploadProgressBar').css({
				width : percent
			});
			//更新文件上传信息
			$('#uploadProgressInfo').html(
					bytesToSize(e.loaded) + "/" + bytesToSize(e.total) + " "
							+ percent);
		}
	}

	//将文件大小单位转换
	function bytesToSize(bytes) {
		if (bytes === 0) {
			return '0 B';
		}
		var k = 1024;
		var sizes = [ 'B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB' ];
		var i = Math.floor(Math.log(bytes) / Math.log(k));
		return (bytes / Math.pow(k, i)).toFixed(2) + ' ' + sizes[i];
	}
</script> -->