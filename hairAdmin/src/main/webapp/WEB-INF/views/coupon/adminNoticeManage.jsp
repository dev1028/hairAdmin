
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	$(function() {
		$('#table').dataTable({

			"paging" : true, //페이징처리
			"ordering" : true, //칼럼별 정렬기능
			"autoWidth" : false, //가로자동
			"lengthChange" : false, //데이터건수 변경
			"pageLength" : 10, //기본 데이터건수
			"order" : [ 5, 'desc' ], //기본 정렬칼럼
			"searching" : false, //검색
			"language" : {
				"emptyTable" : "일치하는 데이터가 없습니다. ",

				"info" : " _START_ - _END_ / _TOTAL_건",
				"infoEmpty" : "데이터 없음",
				"infoFiltered" : "( _MAX_건의 데이터에서 필터링됨 )",
				"search" : "에서 검색: ",
				"zeroRecords" : "일치하는 데이터가 없습니다. ",
				"loadingRecords" : "로딩중...",
				"processing" : "잠시만 기다려 주세요...",
				"paginate" : {
					"next" : "다음",
					"previous" : "이전"
				}
			},
			"columnDefs" : [ {
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
				"orderable" : false
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
		$("input[id=all]").on("click", function() {

			var check = $("input[id=all]").prop("checked");
			$("input[class=chk]").prop("checked", check);
		})
		$(document)
				.on(
						"click",
						"#excel",
						function() {

							var data_type = 'data:application/vnd.ms-excel;charset=utf-8';
							var table_html = encodeURIComponent(document
									.getElementById('table').outerHTML);
							var ta = encodeURIComponent($("#table")[0].outerHTML);
							var a = document.createElement('a');
							a.href = data_type + ',%EF%BB%BF' + table_html;
							a.download = 'test' + '_excel' + '.xls';
							a.click();

						})

	})
</script>


</head>
<body>
	<div class="container">

		<h4 class="heading">공지사항 게시판 관리</h4>



		<div class="col">
			<div class="card">
				<div class="card-header">
					<h5 class="card-title">게시글 조회</h5>
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
								<td><div class="input-group">
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
											<input type="text" id="searchVal" name="searchInput"
												class="form-control ">
										</div>
										<div>
											<button type="submit" class="btn btn-secondary">검색</button>
										</div>

									</div>

								</td>
							</tr>





						</table>


					</form>
				</div>
			</div>
		</div>

		<div class="col">
			<div class="card">
				<form
					action="${pageContext.request.contextPath}/admin/noticeDelete.do">
					<div>
						<button type="button" id="excel" class="btn btn-secondary">excel</button>
						<button type="submit" class="btn btn-secondary " value="0"
							id="delete">삭제</button>
					</div>

					<div class="table-responsive" id="result">
						<table
							class="table table-bordered table table-hover table-outline table-vcenter text-nowrap card-table"
							id="table" width="100%" cellspacing="0">
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

										<td>${ l.emp_name}</td>
										<td>${ l.notice_writedate}</td>
										<td>${ l.notice_hits}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>