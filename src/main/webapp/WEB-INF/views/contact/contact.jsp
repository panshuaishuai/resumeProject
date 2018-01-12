<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<div id="contactEditPanel" class="edit-panel">
	<div class="edit-panel-header">
		<button type="button" class="close close-button"
			data-dismiss="edit-panel" aria-label="Close">
			<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
		</button>
		<h4 class="edit-panel-title">联系我</h4>
	</div>
	<div class="edit-panel-body row">
		<div id="contactMainPanel" class="form-group col-md-12">
			<!-- 查询联系我数据 -->
			<form class="form-inline" method="post">
				<div class="form-group">
					<label for="searchName" class="">姓名：</label> <input type="text"
						name="name" class="form-control" id="searchName">
				</div>
				<div class="form-group">
					<label for="searchEmail" class="">邮件：</label> <input type="text"
						name="email" class="form-control" id="searchEmail">
				</div>
				<button type="button" class="btn btn-default search-btn">
					<i class="fa fa-search" aria-hidden="true"></i>
				</button>
				<button type="reset" class="btn btn-default reset-btn">
					<i class="fa fa-refresh" aria-hidden="true"></i>
				</button>
			</form>
			<div id="contactList" class="">
				<!-- 联系我数据列表 -->
				<table class="table table-striped">
					<thead>
						<tr>
							<th>#</th>
							<th>姓名</th>
							<th>邮件</th>
							<th>消息</th>
							<th width="20%">创建日期</th>
							<th width="10%">操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>李实训</td>
							<td>lishixun@innovaee.com</td>
							<td>你的简历非常符合我们的人才需求,希望可以早日合作!</td>
							<td>2017-05-11 15:46:28</td>
							<td>
								<button type="button" class="btn btn-danger btn-xs"
									onclick="doDeleteContact('1')">
									<i class="fa fa-trash-o fa-fw"></i> 删除
								</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<!-- <script>
	$(function() {
		var $contactMainPanel = $('#contactMainPanel');

		//查询联系我数据信息
		$contactMainPanel.find('.search-btn').click(function(e) {
			var nameValue = $.trim($('#searchName').val());
			var emailValue = $.trim($('#searchEmail').val());
			//查询参数
			var searchPara = {
				name : nameValue,
				email : emailValue
			};

			//执行查询并加载数据
			doLoadContactList(searchPara);
		});

		//清除查询条件
		$contactMainPanel.find('.reset-btn').click(function(e) {
			doLoadContactList({});
		});

		//初始显示所有联系我数据
		doLoadContactList({});
	});

	//加载联系我列表
	function doLoadContactList(data) {
		var $contactList = $('#contactList');
		//显示加载中提示
		startLoading($contactList);
		//执行数据加载
		$contactList.load(ctx + '/contact/list', data, function(e) {
			//隐藏加载中提示
			stopLoading($contactList);
		});
	}

	//删除联系我
	function doDeleteContact(id) {
		bootbox.confirm(Message.is_confirm_delete, function(result) {
			if (result == true) {
				// 发送ajax请求删除
				$.ajax({
					url : ctx + '/contact/delete/' + id,
					type : 'DELETE',
					success : function(data) {
						// 如果状态为0表示删除成功
						if (data.status == '0') {
							toastr.success(Message.delete_success);
							//删除成功后，重新加载联系我列表数据（根据当前页数）
							doLoadContactList();
						} else {
							toastr.error(Message.delete_fail + data.data);
						}
					}
				});
			}
		});
	}
</script> -->