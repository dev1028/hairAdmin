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

			/* fixedColumns : {
				leftColumns : 10,
				heightMatch : 'none'
			}, */
			"paging" : true, //페이징처리
			"ordering" : true, //칼럼별 정렬기능
			"autoWidth" : true, //가로자동
			"lengthChange" : false, //데이터건수 변경
			"pageLength" : 10, //기본 데이터건수
			//"lengthMenu": [[50, 100, 1000], [50, 100, "Max(1000)"]], //데이터건수옵션
			 "order": [1,'desc'], //기본 정렬칼럼
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
			"columnDefs" : [ {
				"orderable" : false,
				"width" : ".001em",
				"targets" : 0
			}, {
				//"width" : "1em",
				"targets" : 1,
				"orderable" : true
			}, {
				//"width" : "1em",
				"targets" : 2
			}, {
				//"width" : "1em",
				"targets" : 3,
				"orderable" : true
			}, {
				//"width" : "1em",
				"targets" : 4,
				"orderable" : true
			}, {
				//"width" : "1em",
				"targets" : 5,
				"orderable" : true
			}, {
				//"width" : "1em",
				"targets" : 6,
				"orderable" : true
			}, {
				//"width" : "1em",
				"targets" : 7,
				"orderable" : true
			} ]
		});

		$("#all").on("click", function() {

			var check = $("#all").prop("checked");
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

							var a = document.createElement('a');
							a.href = data_type + ',%EF%BB%BF' + table_html;
							a.download = 'test' + '_excel' + '.xls';
							a.click();

						})
		$(document).on("click", "#insert", function() {
			$("#myModal").modal('toggle');

		})
	})
</script>


</head>
<body>

	<br>

	<div class="container">

		<div class="col">
			<div class="card">
				
			
				<div class="card-body" id="result">
				<div>
					<h3 class="card-title">발급 쿠폰 목록</h3>
				</div>
	<div class="btn-list justify-content-end  input-group">

					<input type="button" class="pull-right btn btn-secondary "
						value="등록" id="insert">
					<button type="submit" value="0" id="delete"
						class="pull-right btn btn-outline-danger ">삭제</button>
					<button id="excel" class="pull-right btn btn-secondary ">excel</button>
				</div>
				
			
				
					<form
						action="${pageContext.request.contextPath}/admin/adminCouponDelete.do">
		
<div>

						<table
							class="table table-bordered table-sm text-center card-table table-vcenter text-nowrap datatable"
							id="table" width="100%" cellspacing="0">

							<thead>
								<tr>
									<th><input type="checkbox" name="all" id="all" class="chk"></th>
									<th>쿠폰번호</th>
									<th>상태</th>
									<!--  <th>발급</th> -->
									<th>쿠폰명</th>
									<th>할인율</th>
									<th>사용기간</th>
									<th>잔여수</th>
									<th>헤어샵</th>
									<!-- <th>수정</th>
						<th>발급내역</th> -->
								</tr>
							</thead>
							<tbody id="tbody">
								<c:forEach items="${list }" var="l">
									<tr>

										<td><input type="checkbox" class="chk" name="hsc_no"
											value="${l.hsc_no }"></td>
										<td>${l.hsc_no }</td>
										<td>${l.hsc_status }</td>
										<!--  <td></td> -->
										<td>${ l.hsc_name}</td>
										<td>${ l.hsc_discount_rate}%</td>
										<td>${l.hsc_issuedate}~${ l.hsc_expiredate}</td>
										<td>${ l.hsc_coupon_quantity}</td>

										<td>${l.hs_name }</td>
										<!-- <td></td>
								<td></td> -->
									</tr>
								</c:forEach>
							</tbody>
						</table>
						</div>
					</form>
				</div>
				<!-- <div class="btn-list justify-content-end  input-group">

					<input type="button" class="pull-right btn btn-secondary "
						value="등록" id="insert">
					<button type="submit" value="0" id="delete"
						class="pull-right btn btn-secondary ">삭제</button>
					<button id="excel" class="pull-right btn btn-secondary ">excel</button>
				</div> -->
			</div>
		</div>


		<!-- <button type="button" id="excel">excel</button> -->




		<div class="modal fade" id="myModal" data-backdrop="static"
			data-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<form id="empUpdatefrm"
						action="${pageContext.request.contextPath}/admin/adminCouponInsertSubmit.do">
						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title" id="modal_title">쿠폰 등록</h4>
							<button type="button" class="close" data-dismiss="modal"></button>
						</div>



						<div class="modal-body">
							<div class="container">


								<div class="card">
									<div class="card-body">

										<div class="form-group">
											<label for="hs_name">쿠폰명</label> <input class="form-control"
												type="text" name="hsc_name" id="hs_no" value="" />
										</div>
										<label for="hs_name">사용기간</label>
										<div class="form-group ">
											<div class="row">
												<div class="col">
													<input type="date" class="form-control"
														name="hsc_issuedate">

												</div>
												-
												<div class="col">
													<input type="date" class="form-control"
														name="hsc_expiredate">
												</div>
											</div>
										</div>
										<!-- <div class="col"> -->
										<div class="form-group">
											<label for="hs_comp_no">할인율</label> <input
												class="form-control" type="text" name=hsc_discount_rate
												id="hs_comp_no" value="" />
										</div>
										<div class="form-group">
											<label for="hs_owner">최대할인금액</label> <input
												class="form-control" type="text" name="hsc_maxdiscount_pay"
												id="hs_owner" value="" />
										</div>
										<div class="form-group">

											<label for="hs_email">대상미용실</label> <select id="hs_no"
												name="hs_no" class="form-control">

												<c:forEach items="${ hairshoplist}" var="i">

													<option value="${ i.hs_no}">${i.hs_name }</option>
												</c:forEach>


											</select>
										</div>
										<div class="form-group">
											<label for="hs_pw">발급매수</label> <input class="form-control"
												type="text" name="hsc_coupon_quantity" id="hs_pw" value=""
											/>
										</div>

										<div></div>






									</div>
								</div>



							</div>
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">

							<button type="submit" value="Submit" id="submit"
								class="btn btn-secondary"  >등록</button>
							<button type="button" class="btn btn-outline-danger" data-dismiss="modal">닫기</button>

						</div>
					</form>
				</div>
			</div>
		</div>

	</div>
</body>
</html>