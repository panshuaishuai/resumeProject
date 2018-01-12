<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<div id="honorEditPanel" class="edit-panel">
	<div class="edit-panel-header">
		<button type="button" class="close close-button"
			data-dismiss="edit-panel" aria-label="Close">
			<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
		</button>
		<h4 class="edit-panel-title">荣誉&amp;证书</h4>
	</div>
	<div class="edit-panel-body row">
		<!-- 荣誉管理页面 -->
		<div id="honorMainPanel" class="form-group col-md-12">
			<!-- 保存当前页数（第几页） -->
			<input type="hidden" class="current-page" value="1">
			<!-- 新增荣誉证书 按钮 -->
			<a class="btn btn-success btn-sm"
				href="JavaScript:openModalWindow('/honor/add',null);"> <i
				class="fa fa-plus"></i> 新增
			</a>
			<div id="honorList">
				<!-- 列表显示所有荣誉数据 -->
				<table class="table table-striped">
					<thead>
						<tr>
							<th>#</th>
							<th>名称</th>
							<th>简介</th>
							<th width="10%">操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>优秀学生</td>
							<td>2015~2016</td>
							<td><button type="button" class="btn btn-primary btn-xs"
									onclick="doEditHonor('1')">
									<i class="fa fa-pencil fa-fw"></i> 编辑
								</button>
								<button type="button" class="btn btn-danger btn-xs"
									onclick="doDeleteHonor('1')">
									<i class="fa fa-trash-o fa-fw"></i> 删除
								</button></td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>一等奖学金</td>
							<td>2015 获校一等奖学金</td>
							<td><button type="button" class="btn btn-primary btn-xs"
									onclick="doEditHonor('2')">
									<i class="fa fa-pencil fa-fw"></i> 编辑
								</button>
								<button type="button" class="btn btn-danger btn-xs"
									onclick="doDeleteHonor('2')">
									<i class="fa fa-trash-o fa-fw"></i> 删除
								</button></td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>计算机二级</td>
							<td>2016 通过计算机二级</td>
							<td><button type="button" class="btn btn-primary btn-xs"
									onclick="doEditHonor('3')">
									<i class="fa fa-pencil fa-fw"></i> 编辑
								</button>
								<button type="button" class="btn btn-danger btn-xs"
									onclick="doDeleteHonor('3')">
									<i class="fa fa-trash-o fa-fw"></i> 删除
								</button></td>
						</tr>
						<tr>
							<th scope="row">4</th>
							<td>英语四级</td>
							<td>2015 通过英语四级</td>
							<td><button type="button" class="btn btn-primary btn-xs"
									onclick="doEditHonor('4')">
									<i class="fa fa-pencil fa-fw"></i> 编辑
								</button>
								<button type="button" class="btn btn-danger btn-xs"
									onclick="doDeleteHonor('4')">
									<i class="fa fa-trash-o fa-fw"></i> 删除
								</button></td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- 数据分页区 -->
			<div class="pagination-wrapper">
				<div class="inner clearfix">
					<section id="main-content">
						<div class="text-center">
							<ul class="pagination-control pagination">
								<li class="first disabled"><a href="#">首页</a></li>
								<li class="prev disabled"><a href="#">上一页</a></li>
								<li class="page active"><a href="#">1</a></li>
								<li class="page"><a href="#">2</a></li>
								<li class="next"><a href="#">下一页</a></li>
								<li class="last"><a href="#">尾页</a></li>
							</ul>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- <script>
	$(function() {
		var $educationMainPanel = $('#educationMainPanel');
		var $educationListPanel = $('#educationList');
		var $educationListPagingPanel = $educationMainPanel
				.find('.pagination-control');

		// 总页数
		var totalPage = '2';
		console.log('totalPage:' + totalPage)

		// 解除分页绑定
		$educationListPagingPanel.empty().removeData("twbs-pagination").unbind(
				"page");

		//如果总页数不为0，则初始化分页插件
		if (totalPage != 0) {
			// 初始化分页插件
			$educationListPagingPanel.twbsPagination({
				first : Message.paging_first,
				prev : Message.paging_prev,
				next : Message.paging_next,
				last : Message.paging_last,
				totalPages : totalPage,
				visiblePages : 6,
				version : '1.1',
				onPageClick : function(event, page) {
					//分页加载荣誉证书 数据（page为页数，即第几页）
					doLoadEducationList(page);
				}
			});
		}

		//根据当前页数，加载荣誉证书 列表
		doLoadEducationListByCurrentPage();
	});

	//根据指定页数，加载荣誉证书 列表
	function doLoadEducationList(pageNo) {
		$('#educationList').load(ctx + '/education/list/' + pageNo,
				function(e) {
					//设置当前页数
					setCurrentPage(pageNo);
				});
	}

	//根据当前页数，加载荣誉证书 列表
	function doLoadEducationListByCurrentPage() {
		doLoadEducationList(getCurrentPage());
	}

	//编辑荣誉证书 
	function doEditHonor(id) {
		openModalWindow('/honor/edit/' + id, null);
	}

	//删除荣誉证书 
	function doDeleteHonor(id) {
		bootbox.confirm(Message.is_confirm_delete, function(result) {
			if (result == true) {
				// 发送ajax请求删除
				$.ajax({
					url : ctx + '/honor/delete/' + id,
					type : 'DELETE',
					success : function(data) {
						// 如果状态为0表示删除成功
						if (data.status == '0') {
							toastr.success(Message.delete_success);
							//删除成功后，触发编辑荣誉按钮，重新加载荣誉列表数据
							$('#honor .edit-btn').click();

							//加载（刷新）主页面荣誉数据
							loadHonorContent();
						} else {
							toastr.error(Message.delete_fail + data.data);
						}
					}
				});
			}
		});
	}
	//设置当前页数
	function setCurrentPage(pageNo) {
		$('#educationMainPanel').find('.current-page').val(pageNo);
	}

	//获取当前页数
	function getCurrentPage() {
		return $('#educationMainPanel').find('.current-page').val();
	} 
</script> -->