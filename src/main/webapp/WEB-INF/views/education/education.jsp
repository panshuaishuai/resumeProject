<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<div id="educationEditPanel" class="edit-panel">
	<div class="edit-panel-header">
		<button type="button" class="close close-button"
			data-dismiss="edit-panel" aria-label="Close">
			<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
		</button>
		<h4 class="edit-panel-title">教育经历</h4>
	</div>
	<div class="edit-panel-body row">
		<!-- 教育经历管理页面 -->
		<div id="educationMainPanel" class="form-group col-md-12">
			<!-- 保存当前页数（第几页） -->
			<input type="hidden" class="current-page" value="1">
			<!-- 新增教育经历按钮 -->
			<a class="btn btn-success btn-sm"
				href="JavaScript:openModalWindow('/education/add',null);"> <i
				class="fa fa-plus"></i> 新增
			</a>
			<div id="educationList">
				<!-- 教育经历数据列表 -->
				<table class="table table-striped">
					<thead>
						<tr>
							<th>#</th>
							<th>日期</th>
							<th>标题</th>
							<th>简介</th>
							<th width="10%">操作</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>2011 - 2015</td>
							<td>武汉大学</td>
							<td>计算机网络通讯专业(本科)</td>
							<td><button type="button" class="btn btn-primary btn-xs"
									onclick="doEditEducation('1')">
									<i class="fa fa-pencil fa-fw"></i> 编辑
								</button>
								<button type="button" class="btn btn-danger btn-xs"
									onclick="doDeleteEducation('1')">
									<i class="fa fa-trash-o fa-fw"></i> 删除
								</button></td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>2015 - 2018</td>
							<td>华中科技大学</td>
							<td>计算机软件工程专业(硕士)</td>
							<td><button type="button" class="btn btn-primary btn-xs"
									onclick="doEditEducation('2')">
									<i class="fa fa-pencil fa-fw"></i> 编辑
								</button>
								<button type="button" class="btn btn-danger btn-xs"
									onclick="doDeleteEducation('2')">
									<i class="fa fa-trash-o fa-fw"></i> 删除
								</button></td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>2014 - 2015</td>
							<td>Java 开发培训</td>
							<td>在明博参加 Java 开发培训</td>
							<td><button type="button" class="btn btn-primary btn-xs"
									onclick="doEditEducation('5')">
									<i class="fa fa-pencil fa-fw"></i> 编辑
								</button>
								<button type="button" class="btn btn-danger btn-xs"
									onclick="doDeleteEducation('5')">
									<i class="fa fa-trash-o fa-fw"></i> 删除
								</button></td>
						</tr>
						<tr>
							<th scope="row">4</th>
							<td>2015 - 2016</td>
							<td>数据库管理培训</td>
							<td>Oracle 数据库管理培训</td>
							<td><button type="button" class="btn btn-primary btn-xs"
									onclick="doEditEducation('6')">
									<i class="fa fa-pencil fa-fw"></i> 编辑
								</button>
								<button type="button" class="btn btn-danger btn-xs"
									onclick="doDeleteEducation('6')">
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
					//分页加载教育经历数据（page为页数，即第几页）
					doLoadEducationList(page);
				}
			});
		}

		//根据当前页数，加载教育经历列表
		doLoadEducationListByCurrentPage();
	});

	//根据指定页数，加载教育经历列表
	function doLoadEducationList(pageNo) {
		$('#educationList').load(ctx + '/education/list/' + pageNo,
				function(e) {
					//设置当前页数
					setCurrentPage(pageNo);
				});
	}

	//根据当前页数，加载教育经历列表
	function doLoadEducationListByCurrentPage() {
		doLoadEducationList(getCurrentPage());
	}

	//编辑教育经历
	function doEditEducation(id) {
		openModalWindow('/education/edit/' + id, null);
	}

	//删除教育经历
	function doDeleteEducation(id) {
		bootbox.confirm(Message.is_confirm_delete, function(result) {
			if (result == true) {
				// 发送ajax请求删除
				$.ajax({
					url : ctx + '/education/delete/' + id,
					type : 'DELETE',
					success : function(data) {
						// 如果状态为0表示删除成功
						if (data.status == '0') {
							toastr.success(Message.delete_success);
							//删除成功后，重新加载教育经历列表数据（根据当前页数）
							doLoadEducationListByCurrentPage();
							//加载（刷新）主页面教育经历数据
							loadExperienceContent();
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