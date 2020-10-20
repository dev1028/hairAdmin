
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="${pageContext.request.contextPath}/decorator/ges/dist/css/styles.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/decorator/ges/dist/css/styles.css"
	rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
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
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<%-- <script
	src="${pageContext.request.contextPath}/decorator/tabler-gh-pages/assets/js/require.min.js"></script>
 --%>
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


<script type="text/javascript">
	$(function() {
		$('#dataTable1').dataTable({
			language : {
				"emptyTable" : "일치하는 데이터가 없습니다",
				"lengthMenu" : "페이지당 _MENU_ 개씩 보기",
				"info" : "현재 _START_ - _END_ / _TOTAL_건",
				"infoEmpty" : "데이터 없음",
				"infoFiltered" : "( _MAX_건의 데이터에서 필터링됨 )",
				"search" : "에서 검색: ",
				"zeroRecords" : "일치하는 데이터가 없습니다",
				"loadingRecords" : "로딩중...",
				"processing" : "잠시만 기다려 주세요...",
				"paginate" : {
					"next" : "다음",
					"previous" : "이전"
				}
			},
			fixedColumns : {
				leftColumns : 10,
				heightMatch : 'none'
			},
			"paging" : true, //페이징처리
			"ordering" : true, //칼럼별 정렬기능
			//"autoWidth": false, //가로자동
			"lengthChange" : false, //데이터건수 변경
			"pageLength" : 25, //기본 데이터건수
			//"lengthMenu": [[50, 100, 1000], [50, 100, "Max(1000)"]], //데이터건수옵션
			// "order": [2,'desc'], //기본 정렬칼럼
			"searching" : false, //검색
			"columnDefs" : [//칼럼조작
			//가로길이         //칼럼제목   //데이터타겟    //해당칼럼만 정렬기능사용안함
			{
				"width" : "1em",
				"targets" : 0,
				"orderable" : false
			}, {
				"width" : "1em",
				"targets" : 1,
				"orderable" : true
			}, {
				"width" : "1em",
				"targets" : 2
			}, {
				"width" : "1em",
				"targets" : 3,
				"orderable" : true
			}, {
				"width" : "1em",
				"targets" : 4,
				"orderable" : false
			}, {
				"width" : "1em",
				"targets" : 5,
				"orderable" : true
			}, {
				"width" : "1em",
				"targets" : 6,
				"orderable" : false
			}, {
				"width" : "1em",
				"targets" : 7,
				"orderable" : true
			}, {
				"width" : "1em",
				"targets" : 8,
				"orderable" : true
			} ]
		});
		$("#start").attr('value', '');
		var date = new Date();
		endDate(date);

		$(".dateBtn").on("click", function() {
			if ($(this).is("#today") === true) {
				today();
			} else if ($(this).is("#three") === true) {
				three();
			} else if ($(this).is("#seven") === true) {
				week();
			} else if ($(this).is("#month") === true) {
				mon();
			} else {
				$("#start").attr('value', '');
				var date = new Date();
				endDate(date);

			}
		})

		function startDate(d) {
			$("#start").attr('value', moment(d).format('YYYY-MM-DD'));
		}
		function endDate(d) {
			$("#end").attr('value', moment(d).format('YYYY-MM-DD'));
		}
		function today() {
			var d = new Date();

			startDate(d);
			endDate(d);
			console.log(d);

		}
		function three() {
			var d = new Date();
			endDate(d);
			d.setDate(d.getDate() - 3);
			startDate(d);
			console.log(d);

		}
		function week() {
			var d = new Date();
			endDate(d);
			startDate(d.setDate(d.getDate() - 7));
			console.log(d);

		}

		function mon() {
			var d = new Date();
			endDate(d);

			startDate(d.setMonth(d.getMonth() - 1));
			console.log(d);

		}

	})
</script>

</head>
<body>
	<div class="container">

		<h5 class="heading">공지사항 게시판 관리</h5>



		<div class="col">
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">게시글 조회</h3>
				</div>

				<div class="table-responsive" id="result">
					<form
						action="${pageContext.request.contextPath}/admin/noticeFind.do">

						<table
							class='table table-bordered table-sm text-center  table card-table table-vcenter text-nowrap datatable'>



							<tr>
								<td>기간선택</td>
								<td colspan="4">
									<!-- 	<div class="row row-sm align-items-center mb-3"> --> <!-- <div class="col"> -->
									<div class="input-group">
										<div class="col">
											<button type="button" value="0" class="dateBtn form-control "
												id="all">전체</button>
										</div>
										<div class="col">
											<button type="button" value="0" class='dateBtn form-control'
												id="today">오늘</button>
										</div>
										<div class="col">
											<button type="button" value="3" class='dateBtn form-control'
												id="three">3일</button>
										</div>
										<div class="col">
											<button type="button" value="7" class='dateBtn form-control'
												id="seven">7일</button>
										</div>
										<div class="col">



											<button type="button" value="30" class='dateBtn form-control'
												id="month">1개월</button>
										</div>
										<div class="col-3">


											<input type="date" id="start" name="startDate"
												class="form-control">
										</div>
										-
										<div class="col-3">
											<input type="date" id="end" name="endDate"
												class="form-control">

										</div>
									</div>

								</td>
							</tr>

							<tr>
								<td>사용자</td>
								<td><div class="">
										<select name="who" id="who" class="form-control">
											<option class="form-control form-check-input" value="">전체사용자</option>
											<option class="form-control form-check-input" value="j1">미용실</option>
											<option class="form-control form-check-input" value="j2">일반회원</option>
											<option class="form-control form-check-input" value="j3">디자이너</option>
										</select>
									</div></td>

							</tr>
							<tr>
								<td><label>게시글 찾기</label></td>
								<td colspan="4">
									<div class="input-group">

										<div class="col">

											<select name="searchType" id="searchType"
												class="form-control ">
												<option value="title">제목</option>
												<option value="contents">내용</option>


											</select>
										</div>
										<div class="col">
											<input type="text" id="searchVal" name="searchVal"
												class="form-control ">
										</div>
									</div>
								</td>
							</tr>
						</table>

						<div class="btn-list justify-content-end">

							<button type="submit" value="Submit" id="submit"
								class="btn btn-white btn-secondary btn-lg">검색</button>
						</div>
					</form>
				</div>

			</div>

		</div>
	</div>

	<div class="col">
		<div class="card">
			<div class="card-header">
				<h3 class="card-title">공지사항 게시글 목록</h3>
			</div>
			<!-- <div class="form-group" id="result"> -->
			<div class="table-responsive" id="result">

					<div class="table-responsive" id="result">
					<form
						action="${pageContext.request.contextPath}/admin/noticeDelete.do">
						<table
							class="table table-bordered table-sm text-center  table card-table table-vcenter text-nowrap datatable"
							id="dataTable1" width="100%" cellspacing="0">
							<thead>
								<tr>
									<th><input type="checkbox" name="all" id="all" class="chk"></th>
									<th>번호</th>
									<th>분류</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody id="tbody">
								<c:forEach items="${list }" var="l">
									<tr>

										<td><input type="checkbox" class="chk" name="notice_no"
											value="${l.notice_no }"></td>
										<td>${ l.notice_no}</td>
										<td>${ l.notice_whov}</td>
										<td><a
											href="adminNoticeView.do?notice_no=${ l.notice_no}">${ l.notice_title}</a></td>

										<td>${ l.emp_alias}</td>
										<td>${ l.notice_writedate}</td>
										<td>${ l.notice_hits}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>




						<button type="submit" value="0" id="delete"
							class="btn btn-default " style="border: 1px solid gray;">삭제</button>
						<button id="excel" class="btn btn-default "
							style="border: 1px solid gray;">excel</button>


					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>