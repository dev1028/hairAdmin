<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Admin</title>

<link href="/hairapp/decorator/ges/dist/css/styles.css" rel="stylesheet" />

<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link
	href="${pageContext.request.contextPath}/decorator/ges/dist/css/styles.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/decorator/ges/dist/css/styles.css"
	rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<%-- <script
	src="${pageContext.request.contextPath}/decorator/tabler-gh-pages/assets/js/require.min.js"></script> --%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script
	src="${pageContext.request.contextPath}/decorator/ges/dist/js/scripts.js"></script>
<script
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
	crossorigin="anonymous"></script>
<script
	src="${pageContext.request.contextPath}/decorator/ges/dist/assets/demo/datatables-demo.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,500,500i,600,600i,700,700i&amp;subset=latin-ext">


<script>
	requirejs
			.config({
				baseUrl : "${pageContext.request.contextPath}/decorator/tabler-gh-pages"
			});
</script>
<!-- Dashboard Core -->
<link
	href="${pageContext.request.contextPath}/decorator/tabler-gh-pages/assets/css/dashboard.css"
	rel="stylesheet" />
<script
	src="${pageContext.request.contextPath}/decorator/tabler-gh-pages/assets/js/dashboard.js"></script>
<!-- c3.js Charts Plugin -->
<link
	href="${pageContext.request.contextPath}/decorator/tabler-gh-pages/assets/plugins/charts-c3/plugin.css"
	rel="stylesheet" />
<script
	src="${pageContext.request.contextPath}/decorator/tabler-gh-pages/assets/plugins/charts-c3/plugin.js"></script>
<!-- Google Maps Plugin -->
<link
	href="${pageContext.request.contextPath}/decorator/tabler-gh-pages/assets/plugins/maps-google/plugin.css"
	rel="stylesheet" />
<script
	src="${pageContext.request.contextPath}/decorator/tabler-gh-pages/assets/plugins/maps-google/plugin.js"></script>
<!-- Input Mask Plugin -->
<script
	src="${pageContext.request.contextPath}/decorator/tabler-gh-pages/assets/plugins/input-mask/plugin.js"></script>


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
	crossorigin="anonymous"></script>



<%-- <decorator:head></decorator:head> --%>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<a class="navbar-brand"
			href="${pageContext.request.contextPath}/admin/adminMain.do">우동#</a>
		<button class="btn btn-link btn-sm order-1 order-lg-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<div class="input-group"></div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="userDropdown" href="#"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<a class="dropdown-item" href="#">마이페이지</a> <a
						class="dropdown-item" href="#">내가쓴 글</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item"
						href="${pageContext.request.contextPath}/login/logoutProcess">로그아웃</a>
				</div></li>
		</ul>
	</nav>
	<!-- 	상단네비 -->


	<!-- 사이드바시 -->
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">




						<div class="sb-sidenav-menu-heading">게시판</div>


						<a class="nav-link collapsed"
							href="${pageContext.request.contextPath}/admin/adminCustomerManage.do"
							data-toggle="collapse" data-target="#collapseLayouts"
							aria-expanded="false" aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 게시물관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>





						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link"
									href="${pageContext.request.contextPath}/admin/qnaManage.do">QnA
									게시물 관리 </a> <a class="nav-link"
									href="${pageContext.request.contextPath}/admin/noticeManage.do">공지사항
									게시물 관리</a>

							</nav>
						</div>

						<a class="nav-link"
							href="${pageContext.request.contextPath}/admin/boardSetting.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> 게시판 설정
						</a>




						<div class="sb-sidenav-menu-heading">이벤트</div>
						<a class="nav-link"
							href="${pageContext.request.contextPath}/admin/adminCouponManage.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 쿠폰관리
						</a>





						<div class="sb-sidenav-menu-heading">통계</div>
						<a class="nav-link"
							href="${pageContext.request.contextPath}/admin/hairshopAnalysis.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 헤어샵별 통계
						</a> <a class="nav-link"
							href="${pageContext.request.contextPath}/admin/adminAnalysisByTreat.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 헤어 시술별 통계
						</a>


						<%-- 	<a class="nav-link"
							href="${pageContext.request.contextPath}/admin/designerAnalysis.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 디자이너별 통계
						</a><a class="nav-link"
							href="${pageContext.request.contextPath}/admin/hairAnalysis.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 헤어별통계
						</a>
 --%>




						<div class="sb-sidenav-menu-heading">회원</div>



						<a class="nav-link collapsed"
							href="${pageContext.request.contextPath}/admin/adminCustomerManage.do"
							data-toggle="collapse" data-target="#collapsePages"
							aria-expanded="false" aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 회원관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>

						<div class="collapse" id="collapsePages"
							aria-labelledby="headingOne" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link"
									href="${pageContext.request.contextPath}/admin/memberManage.do">일반
									회원 관리 </a> <a class="nav-link"
									href="${pageContext.request.contextPath}/admin/hairshopManage.do">헤어샵
									회원 관리</a> <a class="nav-link"
									href="${pageContext.request.contextPath}/admin/designerManage.do">디자이너
									회원 관리 </a> <a class="nav-link"
									href="${pageContext.request.contextPath}/admin/newHairshopList.do">헤어샵
									가입요청 </a>
							</nav>
						</div>



						<div class="sb-sidenav-menu-heading">시술</div>



						<a class="nav-link collapsed"
							href="${pageContext.request.contextPath}/admin/adminCustomerManage.do"
							data-toggle="collapse" data-target="#collapsePages1"
							aria-expanded="false" aria-controls="collapsePages1">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 시술관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>

						<div class="collapse" id="collapsePages1"
							aria-labelledby="headingOne" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<%-- 	<a class="nav-link"
									href="${pageContext.request.contextPath}/admin/ttCategoryManage.do">시술분류 관리
								 </a> --%>
								<a class="nav-link"
									href="${pageContext.request.contextPath}/admin/ttCategoryManage.do">시술
									분류 관리 </a> <a class="nav-link"
									href="${pageContext.request.contextPath}/admin/ttCategoryRequest.do">시술
									요청 관리 </a>
							</nav>
						</div>






						<div class="sb-sidenav-menu-heading">코드관리</div>
						<a class="nav-link"
							href="${pageContext.request.contextPath}/admin/codeList.do">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 공통코드
						</a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<c:if test="${sessionscope.loginCheck eq true} }">
						<div class="small">${sessionScope.name }님</div>
					${sessionScope.email }</c:if>
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<%-- 	<decorator:body></decorator:body> --%>
			<tiles:insertAttribute name="body" />
		</div>
	</div>

	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="/hairapp/decorator/ges/dist/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>

</body>
</html>
