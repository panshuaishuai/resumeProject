<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<title><spring:message code="title" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link href="${ctx }/plugins/bootstrap/bootstrap.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="${ctx }/css/style.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="${ctx }/plugins/fontawesome/font-awesome.min.css"
	rel="stylesheet" type="text/css" media="all" />
<link
	href="${ctx }/plugins/air-datepicker/css/datepicker.min.css"
	rel="stylesheet" type="text/css" media="all" />
</head>

<body>
	<!-- banner -->
	<div class="banner" id="home">
		<div class="container">
			<!-- container class 用于包裹页面上的内容 -->
			<div class="top-header row">
				<!-- 实现弹出隐藏导航栏的效果js -->
				<!--top-nav-->
				<div class="logo">轻实训</div>
				<div class="top-nav">
					<div class="nav-icon">
						<a href="#" class="right-bt" id="activator"><span> </span> </a>
						<div class="form-group">
							<select class="select-content select-content-btn">
								<option value="zh_CN"
									<c:if test="${encoding eq 'zh_CN' }">selected</c:if>>中文</option>
								<option value="en_US"
									<c:if test="${encoding eq 'en_US' }">selected</c:if>>English</option>
							</select> <i class="select-arrow"></i>
						</div>
					</div>
					<div class="box" id="box">
						<div class="box-content">
							<div class="box-content-center">
								<div class="form-content">
									<div class="menu-box-list">
										<ul>
											<li><a class="scroll" href="#home"><span>首页</span></a></li>
											<li><a class="scroll" href="#about"><span>关于我</span></a></li>
											<li><a class="scroll" href="#skills"><span>专业技能</span></a></li>
											<li><a class="scroll" href="#education"><span>教育经历</span></a></li>
											<li><a class="scroll" href="#experience"><span>工作经验</span></a></li>
											<li><a class="scroll" href="#honor"><span>荣誉&amp;证书</span></a></li>
											<li><a class="scroll" href="#hobby"><span>爱好</span></a></li>
											<li><a class="scroll" href="#contact"><span>给我留言</span></a></li>
											<div class="clearfix"></div>
										</ul>
									</div>
									<a class="boxclose" id="boxclose"> <span></span></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!---start-click-drop-down-menu-->
				<div class="clearfix"></div>
			</div>
			<div class="banner-info row">
				<div class="banner-left col-md-3 col-md-offset-2">
					<img class="updateImage" src="${ctx }/image/my-avatar.png" />
					<p>
						<label for="imageInput" class="photo-btn"><input
							id="imageInput" type="file" name="files" style="display: none"></label>
					</p>
					<input type="hidden" name="photo" id="photo" value="">
					<div id="tip-queue1"></div>
				</div>
				<div class="banner-right col-md-7">
					<h1>轻实训</h1>
					<div class="border"></div>
					<h2>一个有理想的程序员！</h2>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--about-->
	<div class="about" id="about">
		<div class="container">
			<h3 class="text-center">关于我</h3>
			<div class="strip text-center">
				<img src="${ctx }/image/about.png" class="aboutMe-btn" data-url="/about/edit" data-id = "${aboutMe.id }">
			</div>
			<div class="container row">
				<div class="about-grids">
					<div class="col-md-4 ">
						<h4><span>姓名：</span>${aboutMe.name }</h4>
					</div>
					<div class="col-md-4 ">
					<c:if test="${aboutMe.gender == 'male'}">
						<h4><span>性别：</span>男</h4>
						</c:if>
						<c:if test="${aboutMe.gender == 'female'}">
						<h4><span>性别：</span>女</h4>
						</c:if>
					</div>
					<div class="col-md-4 ">
						<h4><span>生日：</span>${aboutMe.birthdayStr }</h4>
					</div>
				</div>
				<div class="about-grids">
					<div class="col-md-4 ">
						<h4><span>学历：</span>${aboutMe.educationDegree.name }</h4>
					</div>
					<div class="col-md-4 ">
						<h4><span>工作年限：</span>${aboutMe.workingYears }</h4>
					</div>
					<div class="col-md-4 ">
						<h4><span>工作状态：</span>${aboutMe.workingStatus.name }</h4>
					</div>
				</div>
				<div class="about-grids">
					<div class="col-md-4 ">
						<h4><span>居住地：</span>${aboutMe.residence }</h4>
					</div>
					<div class="col-md-4 ">
						<h4><span>邮件：</span>${aboutMe.email }</h4>
					</div>
					<div class="col-md-4 ">
						<h4><span>手机：</span>${aboutMe.mobile }</h4>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--my skill-->
	<div class="my-skills text-center" id="skills">
		<div class="container">
			<h3>专业技能</h3>
			<div class="strip text-center">
				<img src="${ctx }/image/skill.png" class="skill-btn"
					data-url="/skill/edit" />
			</div>
			<div class="skill-grids">
			<c:forEach var="skill" items="${skills }" varStatus="status">
				<div class="col-md-2 col-sm-4 col-xs-6 skills-grid text-center">
					<input type="hidden" value="${skill.id }">
					<div class="circle" id="circles-${status.index }" data-level="${skill.level }"></div>
					<p>${skill.name }</p>
				</div>
				</c:forEach>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--education-->
	<div class="education" id="education">
		<div class="container">
			<div class="edu-info text-center">
				<h3>教育经历</h3>
			</div>
			<div class="strip text-center">
				<img src="${ctx }/image/edu.png" class="education-btn"
					data-url="/education/edit">
			</div>
			<div class="edu-grid">
				<div class="col-md-6 edu-grid-left">
					<h4>2011 - 2015</h4>
				</div>
				<div class="col-md-6 edu-grid-right">
					<h5>武汉大学</h5>
					<p>计算机网络通讯专业（本科）</p>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="edu-grid">
				<div class="col-md-6 edu-grid-left">
					<h4>2015 - 2018</h4>
				</div>
				<div class="col-md-6 edu-grid-right">
					<h5>华中科技大学</h5>
					<p>计算机软件工程专业（硕士）</p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--work-->
	<div class="work-experience text-center" id="experience">
		<div class="container">
			<div class="work-info">
				<h3>工作经验</h3>
			</div>
			<div class="strip text-center">
				<img src="${ctx }/image/work.png" class="experience-btn"
					data-url="/experience/edit" />
			</div>
			<div class="work-grids">
				<div class="col-md-4 w-grid">
					<div class="work-grid">
						<h3>2014.7 - 2016.9</h3>
						<div class="work-grid-info">
							<h4>武汉明博科技有限公司</h4>
							<p>• 实训在线平台开发</p>
							<p>• 系统架构设计</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 w-grid">
					<div class="work-grid">
						<h3>2016.9 - 2017.5</h3>
						<div class="work-grid-info">
							<h4>实训在线教育科技</h4>
							<p>• 电子商城平台设计&开发</p>
							<p>• 主流在线教育技术跟踪及预研</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 w-grid">
					<div class="work-grid">
						<h3>2017.5 - 至今</h3>
						<div class="work-grid-info">
							<h4>XXX</h4>
							<p>• XXX</p>
							<p>• XXX</p>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--honor-->
	<div class="honor text-center" id="honor">
		<div class="container">
			<div class="honor-info">
				<h3>荣誉&amp;证书</h3>
			</div>
			<div class="strip text-center">
				<img src="${ctx }/image/honor.png" class="honor-btn"
					data-url="/honor/edit" />
			</div>
			<div class="honor-grids">
				<div class="col-md-3 col-sm-6 honor-grid">
					<h3>优秀学生</h3>
					<p>2015~2016</p>
				</div>
				<div class="col-md-3 col-sm-6 honor-grid">
					<h3>一等奖学金</h3>
					<p>2015 获校一等奖学金</p>
				</div>
				<div class="col-md-3 col-sm-6 honor-grid">
					<h3>计算机二级</h3>
					<p>2016 通过计算机二级</p>
				</div>
				<div class="col-md-3 col-sm-6 honor-grid">
					<h3>英语四级</h3>
					<p>2015 通过英语四级</p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--hobby-->
	<div class="hobby text-center" id="hobby">
		<div class="container">
			<h3>爱好</h3>
			<div class="strip text-center">
				<img src="${ctx }/image/pro.png" alt=" " class="hobby-btn"
					data-url="/hobby/edit" />
			</div>
			<div class="hobby-girds">
				<div class="col-md-2 col-sm-4 col-xs-6 hobby-pad">
					<div class="hobby-gird">
						<div class="hobby-image-0"></div>
						<p>旅游</p>
					</div>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6 hobby-pad">
					<div class="hobby-gird">
						<div class="hobby-image-1"></div>
						<p>读书</p>
					</div>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6 hobby-pad">
					<div class="hobby-gird">
						<div class="hobby-image-2"></div>
						<p>运动</p>
					</div>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6 hobby-pad">
					<div class="hobby-gird">
						<div class="hobby-image-3"></div>
						<p>打游戏</p>
					</div>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6 hobby-pad">
					<div class="hobby-gird">
						<div class="hobby-image-4"></div>
						<p>电影</p>
					</div>
				</div>
				<div class="col-md-2 col-sm-4 col-xs-6 hobby-pad">
					<div class="hobby-gird">
						<div class="hobby-image-5"></div>
						<p>美食</p>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--contact-->
	<div class="contact" id="contact">
		<div class="container">
			<div class="contact-info text-center">
				<h3>给我留言</h3>
				<div class="strip text-center">
					<img src="${ctx }/image/con1.png" class="contact-btn" data-url = "/contact/edit"/>
				</div>
			</div>
			<div class="contact-grids">
				<div class="col-md-12 ">
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="请输入姓名...">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="请输入邮箱地址...">
						</div>
						<div class="form-group">
							<!-- 文本框 -->
							<textarea class="form-control" rows="7"
								placeholder="请输入留言内容详情..."></textarea>
						</div>
						<div class="form-group">
							<!-- 按钮 -->
							<button type="button" class="btn btn-primary btn-lg btn-block">发送</button>
						</div>
					</form>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<div class="download-resume text-center">
		<div class="container">
			<div class="strip text-center">
				<img src="${ctx }/image/down.png" class="upload-btn" data-url = "/upload/edit">
			</div>
			<div class="down">
				<a href="#">下载我的简历</a>
			</div>
		</div>
	</div>
	<!--footer-->
	<div class="footer">
		<div class="container">
			<p>Copyright &copy; 2017.轻实训版权所有.</p>
		</div>
	</div>
	<div id="aboutMe-content-panel"></div>
	<div id="skills-content-panel"></div>
	<div id="education-content-panel"></div>
	<div id="experience-content-panel"></div>
	<div id="honor-content-panel"></div>
	<div id="hobby-content-panel"></div>
	<div id="contact-content-panel"></div>
	<div id="upload-content-panel"></div>

	<script type="text/javascript"
		src="${ctx }/plugins/jquery-2.1.3.min.js"></script>
	<script type="text/javascript" src="${ctx }/plugins/jquery.form.min.js"></script>
	<script type="text/javascript"
		src="${ctx }/plugins/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${ctx }/plugins/uploadifive/jquery.uploadifive.js"></script>
	<script type="text/javascript"
		src="${ctx }/plugins/air-datepicker/js/datepicker.min.js"></script>
	<script type="text/javascript"
		src="${ctx }/plugins/air-datepicker/js/i18n/datepicker.zh.js"></script>
	<script type="text/javascript"
		src="${ctx }/plugins/pagination/jquery.twbsPagination.js"></script>
	<script type="text/javascript" src="${ctx }/plugins/circles/circles.js"></script>
	<script type="text/javascript">
	var ctx = "${ctx }";
		$(function() {
			//弹出顶部导航菜单
			$('#activator').click(function() {
				$('#box').animate({
					'top' : '0px'
				}, 500);
			});
			//关闭顶部导航菜单
			$('#boxclose').click(function() {
				$('#box').animate({
					'top' : '-1000px'
				}, 500);
			});

			//基于SVG的轻量级js圆形进度条插件
			$('#skills .circle').each(function(index, el) {
				var percentage = $(this).data('level');
				Circles.create({
					id : 'circles-' + index,
					percentage : percentage,
					radius : 80,
					width : 10,
					number : percentage / 1,
					text : '%',
					colors : [ '#ffffff', '#a2e0aa' ]
				});
			});

			// 上传头像
			$("#imageInput").uploadifive({
				"auto" : true,
				"uploadScript" : ctx + "/file/upload",
				"fileObjName" : "files",
				"queueID" : "tip-queue1",
				"fileType" : "image/*",
				"multi" : false,
				"fileSizeLimit" : 5242880,
				"uploadLimit" : 10,
				"queueSizeLimit" : 1,
				"removeCompleted" : true,
				"dnd" : true,
				"buttonText" : "请选择头像",
				"onUploadComplete" : function(file, data) {
					//设置图片预览  
					$(".updateImage").prop("src", "${ctx }/image/" + file.name);
				}
			});
			
			// 关于我的编辑
			var aboutMeBtn = $(".aboutMe-btn");
			var aboutMeUrl = aboutMeBtn.data("url");
			var aboutMeId = aboutMeBtn.data("id");
			$("#aboutMe-content-panel").load(ctx + aboutMeUrl, {aboutMeId : aboutMeId}, function() {
				var $aboutMeEditPanel = $("#aboutMeEditPanel");
				bottomContent(aboutMeBtn, $aboutMeEditPanel);
				closeBottomContent($aboutMeEditPanel);
				});
			
			// 专业技能的编辑
			var skillBtn = $(".skill-btn");
			var skillUrl = skillBtn.data("url");
			var skillInputs = $(".skills-grid").find("input[type='hidden']");
			// 获取input的id列表
			var skillIds = "";
			// 循环遍历input
			skillInputs.each(function () {
				skillIds += $(this).val() + ",";
			});
			// 截取多余字符
			skillIds = skillIds.substr(0, skillIds.length -1);
			$("#skills-content-panel").load(ctx + skillUrl, {skillIds : skillIds}, function() {
				var $skillEditPanel = $("#skillEditPanel");
					bottomContent(skillBtn, $skillEditPanel);
					closeBottomContent($skillEditPanel);
				});
			
			// 教育经历的编辑
			var educationBtn = $(".education-btn");
			var educationUrl = educationBtn.data("url");
			var educationId = educationBtn.data("id");
			$("#education-content-panel").load(ctx + educationUrl, {educationId : educationId}, function() {
				var $educationEditPanel = $("#educationEditPanel");
					bottomContent(educationBtn, $educationEditPanel);
					closeBottomContent($educationEditPanel);
				});
			
			// 工作经验的编辑
			var experienceBtn = $(".experience-btn");
			var experienceUrl = experienceBtn.data("url");
			var experienceId = experienceBtn.data("id");
			$("#experience-content-panel").load(ctx + experienceUrl, {experienceId : experienceId}, function() {
				var $experienceEditPanel = $("#experienceEditPanel");
					bottomContent(experienceBtn, $experienceEditPanel);
					closeBottomContent($experienceEditPanel);
				});
			
			// 荣誉证书的编辑
			var honorBtn = $(".honor-btn");
			var honorUrl = honorBtn.data("url");
			var honorId = honorBtn.data("id");
			$("#honor-content-panel").load(ctx + honorUrl, {honorId : honorId}, function() {
				var $honorEditPanel = $("#honorEditPanel");
					bottomContent(honorBtn, $honorEditPanel);
					closeBottomContent($honorEditPanel);
				});
			
			// 爱好的编辑
			var hobbyBtn = $(".hobby-btn");
			var hobbyUrl = hobbyBtn.data("url");
			var hobbyId = hobbyBtn.data("id");
			$("#hobby-content-panel").load(ctx + hobbyUrl, {hobbyId : hobbyId}, function() {
				var $hobbyEditPanel = $("#hobbyEditPanel");
					bottomContent(hobbyBtn, $hobbyEditPanel);
					closeBottomContent($hobbyEditPanel);
				});
			
			// 联系我的编辑
			var contactBtn = $(".contact-btn");
			var contactUrl = contactBtn.data("url");
			var contactId = contactBtn.data("id");
			$("#contact-content-panel").load(ctx + contactUrl, {contactId : contactId}, function() {
				var $contactEditPanel = $("#contactEditPanel");
					bottomContent(contactBtn, $contactEditPanel);
					closeBottomContent($contactEditPanel);
				});
			
			// 上传简历的编辑
			var uploadBtn = $(".upload-btn");
			var uploadUrl = uploadBtn.data("url");
			var uploadId = uploadBtn.data("id");
			$("#contact-content-panel").load(ctx + uploadUrl, {uploadId : uploadId}, function() {
				var $uploadEditPanel = $("#uploadEditPanel");
					bottomContent(uploadBtn, $uploadEditPanel);
					closeBottomContent($uploadEditPanel);
				});
		});
		
		//从浏览器底部弹出编辑窗口
		function bottomContent(btn, $editPanel) {
			btn.on("click", function(event) {
			event.preventDefault();
			$editPanel.animate({
				'left' : '0px',
				'bottom' : '0px'
			}, 300);
		});
		}

		//关闭编辑窗口
		function closeBottomContent($editPanel) {
			$editPanel.on('click', '.close-button', function(event) {
			event.preventDefault();
			$editPanel.animate({
				'left' : '0px',
				'bottom' : '-450px'
			}, 300);
		});
		}
		
		function loadIndexContent() {
			$("body").load(ctx + "/index");
		}
	</script>
</body>

</html>