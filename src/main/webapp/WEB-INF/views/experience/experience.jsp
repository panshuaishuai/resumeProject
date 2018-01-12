<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<div id="experienceEditPanel" class="edit-panel">
	<div class="edit-panel-header">
		<button type="button" class="close close-button"
			data-dismiss="edit-panel" aria-label="Close">
			<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
		</button>
		<h4 class="edit-panel-title">工作经验</h4>
	</div>
	<div class="edit-panel-body row">
		<!-- 工作经验管理页面 -->
		<div id="experienceMainPanel" class="form-group col-md-12">
			<!-- 保存当前页数（第几页） -->
			<input type="hidden" class="current-page" value="1">
			<!-- 新增工作经验按钮 -->
			<a class="btn btn-success btn-sm"
				href="JavaScript:openModalWindow('/experience/add',null);"> <i
				class="fa fa-plus"></i> 新增
			</a>
			<div id="experienceList">
				<!-- 工作经验数据列表 -->
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
							<td>2014.7 - 2016.9</td>
							<td>武汉明博科技有限公司</td>
							<td>实训在线平台开发<br>系统架构设计
							</td>
							<td><button type="button" class="btn btn-primary btn-xs"
									onclick="doEditExperience('1')">
									<i class="fa fa-pencil fa-fw"></i> 编辑
								</button>
								<button type="button" class="btn btn-danger btn-xs"
									onclick="doDeleteExperience('1')">
									<i class="fa fa-trash-o fa-fw"></i> 删除
								</button></td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>2016.9 - 2017.5</td>
							<td>实训在线教育科技</td>
							<td>电子商城平台设计&amp;开发<br>主流在线教育技术跟踪及预研
							</td>
							<td><button type="button" class="btn btn-primary btn-xs"
									onclick="doEditExperience('2')">
									<i class="fa fa-pencil fa-fw"></i> 编辑
								</button>
								<button type="button" class="btn btn-danger btn-xs"
									onclick="doDeleteExperience('2')">
									<i class="fa fa-trash-o fa-fw"></i> 删除
								</button></td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>2017.5 - 至今</td>
							<td>XXX</td>
							<td>XXXXXX<br>YYYYYY
							</td>
							<td><button type="button" class="btn btn-primary btn-xs"
									onclick="doEditExperience('3')">
									<i class="fa fa-pencil fa-fw"></i> 编辑
								</button>
								<button type="button" class="btn btn-danger btn-xs"
									onclick="doDeleteExperience('3')">
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
								<li class="next disabled"><a href="#">下一页</a></li>
								<li class="last disabled"><a href="#">尾页</a></li>
							</ul>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	/* $(function() {
		var $experienceMainPanel = $('#experienceMainPanel');
		var $experienceListPanel = $('#experienceList');
		var $experienceListPagingPanel = $experienceMainPanel
				.find('.pagination-control');

		// 总页数
		var totalPage = '1';
		console.log('totalPage:' + totalPage)

		// 解除分页绑定
		$experienceListPagingPanel.empty().removeData("twbs-pagination")
				.unbind("page");

		//如果总页数不为0，则初始化分页插件
		if (totalPage != 0) {
			// 初始化分页插件
			$experienceListPagingPanel.twbsPagination({
				first : Message.paging_first,
				prev : Message.paging_prev,
				next : Message.paging_next,
				last : Message.paging_last,
				totalPages : totalPage,
				visiblePages : 6,
				version : '1.1',
				onPageClick : function(event, page) {
					//分页加载工作经验数据（page为页数，即第几页）
					doLoadExperienceList(page);
				}
			});
		}

		//根据当前页数，加载工作经验列表
		doLoadExperienceListByCurrentPage();
	});

	//根据指定页数，加载工作经验列表
	function doLoadExperienceList(pageNo) {
		$('#experienceList').load(ctx + '/experience/list/' + pageNo,
				function(e) {
					//设置当前页数
					setCurrentPage(pageNo);
				});
	}

	//根据当前页数，加载工作经验列表
	function doLoadExperienceListByCurrentPage() {
		doLoadExperienceList(getCurrentPage());
	}

	//编辑工作经验
	function doEditExperience(id) {
		openModalWindow('/experience/edit/' + id, null);
	}

	//删除工作经验
	function doDeleteExperience(id) {
		bootbox.confirm(Message.is_confirm_delete, function(result) {
			if (result == true) {
				// 发送ajax请求删除
				$.ajax({
					url : ctx + '/experience/delete/' + id,
					type : 'DELETE',
					success : function(data) {
						// 如果状态为0表示删除成功
						if (data.status == '0') {
							toastr.success(Message.delete_success);
							//删除成功后，重新加载工作经验列表数据（根据当前页数）
							doLoadExperienceListByCurrentPage();
							//加载（刷新）主页面工作经验数据
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
		$('#experienceMainPanel').find('.current-page').val(pageNo);
	}

	//获取当前页数
	function getCurrentPage() {
		return $('#experienceMainPanel').find('.current-page').val();
	} */
</script>