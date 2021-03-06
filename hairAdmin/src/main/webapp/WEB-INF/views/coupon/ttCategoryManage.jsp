<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>codeList</title>
<style>
.toggleupdate {
	display: none;
}

#updateslide {
	display: none;
}

.table-box-wrap {
	position: relative;
	/*width:509px;*/
	margin-top: 20px;
	padding-top: 40px;
}

.table-box-wrap .table-box {
	max-height: 258px;
	overflow: auto;
	overflow-x: hidden;
}

.table-box-wrap .table-box table {
	width: 100%;
	table-layout: fixed;
	border-spacing: 0;
	border-collapse: collapse;
}

.table-box-wrap .table-box table thead tr {
	position: absolute;
	top: 0;
}

.table-box-wrap .table-box table thead tr th {
	font-weight: normal;
	width: 120px;
	height: 40px;
}

.table-box-wrap .table-box table td {
	text-align: center;
	height: 40px;
	border-top: 1px solid #ccc;
}

.table-box-wrap .table-box table tr {
	display: inline-table;
	width: 100%;
	table-layout: fixed;
}

.table-box-wrap .table-box table tbody tr {
	display: table-row;
}
</style>
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
<script type="text/javascript">
	var btnPrimaryCodeCnt = 0;
	$(document)
			.ready(
					function() {
						$('#table').dataTable({
							"scrollY" : "500px",
							fixedColumns : {
								leftColumns : 10,
								heightMatch : 'none'
							},
							"paging" : false, //페이징처리
							"ordering" : true, //칼럼별 정렬기능
							"autoWidth" : true, //가로자동
							"lengthChange" : false, //데이터건수 변경
							"pageLength" : 25, //기본 데이터건수
							//"lengthMenu": [[50, 100, 1000], [50, 100, "Max(1000)"]], //데이터건수옵션
							"order" : [ 0, 'desc' ], //기본 정렬칼럼
							"searching" : false, //검색
							"language" : {
								"emptyTable" : "일치하는 데이터가 없습니다. ",
								"lengthMenu" : "페이지당 _MENU_ 개씩 보기",
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
							"columnDefs" : [

							{
								"width" : "1em",
								"targets" : 0,
								"orderable" : true
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
								"width" : ".5em",
								"targets" : 4,
								"orderable" : false
							}, {
								"width" : ".5em",
								"targets" : 5,
								"orderable" : false
							} ]
						});
						$("#approval")
								.on(
										"click",
										function() {
											var $finTr = $(this).closest("tr")
													.children();
											console.log($finTr);
											console.log($(this));
											var finUpdate1 = $finTr.eq(0)
													.text();
											console.log(finUpdate1);

											$
													.ajax({
														url : "${pageContext.request.contextPath}/admin/tmicUpdate.do",
														data : {
															tmic_no : finUpdate1,
															tmic_status : "1"

														},
														type : "post",
														dataType : "json",
														success : function(data) {

															console.log(data)
															if (data.tmic_no != null
																	&& data.tmic_no != "") {
																$(
																		"#btnUpdateFin")
																		.closest(
																				"tr")
																		.prev()
																		.children()
																		.eq(1)
																		.text(
																				data.tmac_name);
																$(
																		"#btnUpdateFin")
																		.closest(
																				"tr")
																		.prev()
																		.children()
																		.eq(2)
																		.text(
																				data.tmic_explication);

															}
														}
													});
										});

						$("#tmic_insert")
								.on(
										"click",
										function() {
											$
													.ajax(
															"${pageContext.request.contextPath}/admin/tmicInsert.do",
															{
																data : $(
																		"#tmic_insert_frm")
																		.serialize(),
																dataType : "json",
																method : "post",
																success : function(
																		data) {

																	if (data.code_no != null
																			&& data.code_no != "") {
																		//	$("#primary_codeInsert").val("");
																		var trCode = $("<tr>")
																		trCode
																				.append($(
																						"<td>")
																						.text(
																								data.tmic_no));
																		trCode
																				.append($(
																						"<td>")
																						.text(
																								data.tmac_name));
																		trCode
																				.append($(
																						"<td>")
																						.text(
																								data.tmic_explication));
																		trCode
																				.append($(
																						"<td>")
																						.text(
																								data.tmic_status));
																		trCode
																				.append($(
																						"<td>")
																						.html(
																								'<div class="btn-group btn-group-sm" role="group" aria-label="Basic example"><button type="button" class="btn btn-secondary btncodeUpdate">수정</button><button type="button" class="btn btn-danger btncodeDelete">삭제</button></div>'));
																		$(
																				"#codelisttable_tbody")
																				.prepend(
																						trCode);

																		setTimeout(
																				function() {
																					//$("#btnPrimaryCodeAlret").html("");
																				},
																				3000);
																	}
																	btnPrimaryCodeCnt = 0;
																}
															});
										})

						$("#codelisttable_tbody")
								.on(
										"click",
										".btncodeDelete",
										function() {
											var $tr = $(this).closest("tr");
											$
													.ajax({
														url : "${pageContext.request.contextPath}/admin/tmicDelete.do", // 클라이언트가 요청을 보낼 서버의 URL 주소
														data : {
															tmic_no : $(this)
																	.closest(
																			"tr")
																	.children()
																	.eq(0)
																	.text()
														},
														type : "GET", // HTTP 요청 방식(GET, POST)
														success : function(data) {
															if (data != 0) {
																$tr.remove();
															} else {
																alert("실패");
															}
														}
													});
										});

						var cntForUpdateBtn = 0;
						var whichUpdateBtn;
						$("#codelisttable_tbody")
								.on(
										"click",
										".btncodeUpdate",
										function() {
											if (cntForUpdateBtn == 0) {
												whichUpdateBtn = $(this);
												whichUpdateBtn.next().attr(
														'disabled', true);

												cntForUpdateBtn++;
												var alistjson = JSON
														.parse('${alistjson}');
												var $slideSelect = $("<select>");
												$slideSelect.attr("id",
														"toggleupdateSelect");
												console.log(alistjson);
												for (i = 0; i < alistjson.length; i++) {
													if (alistjson[i].tmac_name == whichUpdateBtn
															.closest("tr")
															.children().eq(1)
															.text()) {
														$slideSelect
																.append($(
																		"<option>")
																		.val(
																				alistjson[i].tmac_name)
																		.text(
																				alistjson[i].tmac_name)
																		.attr(
																				"selected",
																				"selected")
																		.data(
																				"tmic_explication",
																				alistjson[i].tmic_explication));
													} else {
														$slideSelect
																.append($(
																		"<option>")
																		.val(
																				alistjson[i].tmac_name)
																		.text(
																				alistjson[i].tmac_name)
																		.data(
																				"tmic_explication",
																				alistjson[i].tmic_explication));
													}
												}

												var $slideDiv = $("<tr>")
														.attr("id",
																"updateslide")
														.append(
																"<td><div class='toggleupdate'>"
																		+ whichUpdateBtn
																				.closest(
																						"tr")
																				.children()
																				.eq(
																						0)
																				.text()
																		+ "</div></td>")
														.append(
																$("<td>")
																		.append(
																				$(
																						"<div>")
																						.attr(
																								"class",
																								"toggleupdate")
																						.append(
																								$slideSelect)))
														.append(
																$("<td>")
																		.append(
																				$(
																						"<div>")
																						.attr(
																								"class",
																								"toggleupdate")
																						.append(
																								$(
																										"<input>")
																										.attr(
																												'id',
																												'tmic_name')
																										.val(
																												whichUpdateBtn
																														.closest(
																																"tr")
																														.children()
																														.eq(
																																2)
																														.text()))))
														.append(
																$("<td>")
																		.append(
																				$(
																						"<div>")
																						.attr(
																								"class",
																								"toggleupdate")
																						.append(
																								$(
																										"<input>")
																										.attr(
																												'id',
																												'tmic_explication')
																										.val(
																												whichUpdateBtn
																														.closest(
																																"tr")
																														.children()
																														.eq(
																																3)
																														.text()))))

														.append(
																"<td><div class='toggleupdate'>"
																		+ whichUpdateBtn
																				.closest(
																						"tr")
																				.children()
																				.eq(
																						4)
																				.text()
																		+ "</div></td>")

														.append(
																"<td><div class='toggleupdate'><button type='button' id='btnUpdateFin' class='btn btn-sm btn-warning'>&nbsp&nbsp&nbsp 수정 &nbsp&nbsp&nbsp</button></div></td>")

														.css(
																"background-color",
																"#FFE3AA");

												$(this).closest("tr").after(
														$slideDiv)

												$("#updateslide").show("slow");
												whichUpdateBtn.text("취소");

												$(".toggleupdate").slideToggle(
														"fast");
											} else {
												if ($(this).closest("tr")
														.children().eq(0)
														.text() == whichUpdateBtn
														.closest("tr")
														.children().eq(0)
														.text()) {
													$(".toggleupdate")
															.slideToggle("fast");
													$("#updateslide").hide(
															"slow");
													setTimeout(
															function() {
																$(
																		"#updateslide")
																		.remove();
																cntForUpdateBtn = 0;
																whichUpdateBtn
																		.text("수정");
																whichUpdateBtn
																		.next()
																		.attr(
																				'disabled',
																				false);
																whichUpdateBtn = null;
															}, 1000);
												}
											}

										});

						$("#codelisttable_tbody")
								.on(
										"change",
										"#toggleupdateSelect",
										function() {
											$("#toggleupdateDivCodeName")
													.text(
															$(
																	"#toggleupdateSelect option:selected")
																	.data(
																			"tmic_explication"));

										});
						$("#codelisttable_tbody")
								.on(
										"click",
										"#btnUpdateFin",
										function() {
											var $finTr = $(this).closest("tr")
													.children();
											if ($("#tmic_name").val() != null
													&& $("#tmic_explication")
															.val() != "") {
												var finUpdate1 = $finTr.eq(0)
														.find("div").text();
												var finUpdate2 = $(
														"#toggleupdateSelect option:selected")
														.val();

												var finUpdate3 = $("#tmic_name")
														.val();
												var finUpdate4 = $(
														"#tmic_explication")
														.val();
												$
														.ajax({
															url : "${pageContext.request.contextPath}/admin/tmicUpdate.do",
															data : {
																tmic_no : finUpdate1,
																tmac_name : finUpdate2,
																tmic_name : finUpdate3,
																tmic_explication : finUpdate4,

															},
															type : "post",
															dataType : "json",
															success : function(
																	data) {

																console
																		.log(data)
																if (data.tmic_no != null
																		&& data.tmic_no != "") {
																	$(
																			"#btnUpdateFin")
																			.closest(
																					"tr")
																			.prev()
																			.children()
																			.eq(
																					1)
																			.text(
																					data.tmac_name);
																	$(
																			"#btnUpdateFin")
																			.closest(
																					"tr")
																			.prev()
																			.children()
																			.eq(
																					2)
																			.text(
																					data.tmic_explication);

																	$(
																			".toggleupdate")
																			.slideToggle(
																					"fast");
																	$(
																			"#updateslide")
																			.hide(
																					"slow");
																	setTimeout(
																			function() {
																				$(
																						"#updateslide")
																						.remove();
																				cntForUpdateBtn = 0;
																				whichUpdateBtn
																						.text("수정");
																				whichUpdateBtn
																						.next()
																						.attr(
																								'disabled',
																								false);
																				whichUpdateBtn = null;
																			},
																			1000);
																} else {
																	$(
																			".toggleupdate")
																			.slideToggle(
																					"fast");
																	$(
																			"#updateslide")
																			.hide(
																					"slow");
																	setTimeout(
																			function() {
																				$(
																						"#updateslide")
																						.remove();
																				cntForUpdateBtn = 0;
																				whichUpdateBtn
																						.text("수정");
																				whichUpdateBtn
																						.next()
																						.attr(
																								'disabled',
																								false);
																				whichUpdateBtn = null;
																			},
																			1000);
																}
															}
														});
											}
										});

					});
</script>
</head>
<body>
	<div class="container">
		<br>
		<h3 class="font-weight-bold">시술 분류 관리</h3>
		<hr>
		<form id="tmic_insert_frm">
			<div>
				<label>대분류선택</label> <select name="tmac_no">
					<c:forEach items="${alist }" var="i">
						<option value="${i.tmac_no }">${i.tmac_name }</option>
					</c:forEach>

				</select> <label>중분류 이름</label> <input type="text" name="tmic_name">
				<label>중분류 설명</label> <input type="text" name="tmic_explication">
				<button id="tmic_insert" class=" btn btn-outline-primary ">등록</button>
			</div>
		</form>
		<div class="table-box-wrap">





			<div class="dataTables_scrollHeadInner">
				<table
					class="table table-bordered table-hover table-sm text-center TABLE table-bordered"
					id="table" width="100%" cellspacing="0">
					<thead class="thead-dark">
						<tr>
							<th scope="row">중분류번호</th>
							<th scope="row">대분류</th>
							<th scope="row">중분류 이름</th>
							<th scope="row">중분류 설명</th>
							<th scope="row">인증상태</th>
							<th scope="row">수정/삭제</th>
						</tr>

					</thead>

					<tbody id="codelisttable_tbody" class="table table-striped  ">
						<c:forEach items="${ilist}" var="a">
							<tr>
								<td>${a.tmic_no}</td>
								<td>${a.tmac_name }</td>
								<td>${a.tmic_name}</td>
								<td>${a.tmic_explication}</td>
								<td><c:choose>
										<c:when test="${a.tmic_status ==1}">승인완료</c:when>
										<c:when test="${a.tmic_status ==0 }">미승인<button
												id="approval">승인</button>
										</c:when>
										<c:when test="${a.tmic_status ==2 }">보류</c:when>
										<c:when test="${a.tmic_status ==3 }">거절</c:when>


									</c:choose></td>
								<td><div class="btn-group btn-group-sm" role="group"
										aria-label="Basic example">
										<button type="button" class="btn btn-secondary btncodeUpdate">수정</button>
										<button type="button" class="btn btn-danger btncodeDelete">삭제</button>
									</div></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>
	</div>
	<hr>
</body>
</html>