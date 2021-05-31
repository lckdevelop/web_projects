<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<c:set var="dto" value="${customerDTO}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>ThankStore 거래내역</title>
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<link 
	href="${app}/resources/customer/css/customer.css" rel="stylesheet">
<link
	href="${app}/resources/customer/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jquery 경로 -->
<script type="text/javascript"
	src="${app}/resources/customer/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<!-- 전체 컨테이너 입니다.  -->
<div id='container'>
	<!-- 카테고리 바입니다. -->
    <div id='box-left'>
		<jsp:include page="/WEB-INF/views/customer/fragment/categorybar.jsp" flush="true" />
    </div>
    <!-- 프로필 바입니다. -->
    <div id='box-center'>
		<jsp:include page="/WEB-INF/views/customer/fragment/profilebar.jsp" flush="true" />
    </div>
    <div id='box-right'>
    <div id="product-search-box">
   			<div class="row">
	   			<div class="col-md-11">
	    			<h3>거래내역 조회</h3>
	       		</div>
	   		</div>
	   	</div>
    	<hr style="border: solid 3px #1b4af5;">
    	
 <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">${dto.name} 회원님의 거래내역 조회</h4>
                                <div class="table-responsive">
                                    <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4">
                                    	
                                    	<div class="row">
                                    	<div class="col-sm-12">
                                    	<table class="table table-striped table-bordered zero-configuration dataTable" id="DataTables_Table_0" role="grid" aria-describedby="DataTables_Table_0_info">
                                        	<thead>
	                                            <tr role="row">
	                                            	<th class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 168.2px;">
	                                            		거래번호
	                                            	</th>
	                                            	<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 270.6px;">
	                                            		거래명
	                                            	</th>
	                                            	<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending" style="width: 123.4px;">
	                                            		일시
	                                            	</th>
	                                            	<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending" style="width: 57px;">
	                                            		충전금액
	                                            	</th>
	                                            	<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 113px;">
	                                            		결제비용
	                                            	</th>
	                                            	<th class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 95.6px;">
	                                            		비고
	                                            	</th>
	                                            </tr>
                                        	</thead>
                                        	<tbody>
		                                        <tr role="row" class="odd">
		                                                <td class="sorting_1">Airi Satou</td>
		                                                <td>Accountant</td>
		                                                <td>Tokyo</td>
		                                                <td>33</td>
		                                                <td>2008/11/28</td>
		                                                <td>$162,700</td>
		                                            </tr><tr role="row" class="even">
		                                                <td class="sorting_1">Angelica Ramos</td>
		                                                <td>Chief Executive Officer (CEO)</td>
		                                                <td>London</td>
		                                                <td>47</td>
		                                                <td>2009/10/09</td>
		                                                <td>$1,200,000</td>
		                                            </tr><tr role="row" class="odd">
		                                                <td class="sorting_1">Ashton Cox</td>
		                                                <td>Junior Technical Author</td>
		                                                <td>San Francisco</td>
		                                                <td>66</td>
		                                                <td>2009/01/12</td>
		                                                <td>$86,000</td>
		                                            </tr><tr role="row" class="even">
		                                                <td class="sorting_1">Bradley Greer</td>
		                                                <td>Software Engineer</td>
		                                                <td>London</td>
		                                                <td>41</td>
		                                                <td>2012/10/13</td>
		                                                <td>$132,000</td>
		                                            </tr><tr role="row" class="odd">
		                                                <td class="sorting_1">Brenden Wagner</td>
		                                                <td>Software Engineer</td>
		                                                <td>San Francisco</td>
		                                                <td>28</td>
		                                                <td>2011/06/07</td>
		                                                <td>$206,850</td>
		                                            </tr><tr role="row" class="even">
		                                                <td class="sorting_1">Brielle Williamson</td>
		                                                <td>Integration Specialist</td>
		                                                <td>New York</td>
		                                                <td>61</td>
		                                                <td>2012/12/02</td>
		                                                <td>$372,000</td>
		                                            </tr><tr role="row" class="odd">
		                                                <td class="sorting_1">Bruno Nash</td>
		                                                <td>Software Engineer</td>
		                                                <td>London</td>
		                                                <td>38</td>
		                                                <td>2011/05/03</td>
		                                                <td>$163,500</td>
		                                            </tr><tr role="row" class="even">
		                                                <td class="sorting_1">Caesar Vance</td>
		                                                <td>Pre-Sales Support</td>
		                                                <td>New York</td>
		                                                <td>21</td>
		                                                <td>2011/12/12</td>
		                                                <td>$106,450</td>
		                                            </tr><tr role="row" class="odd">
		                                                <td class="sorting_1">Cara Stevens</td>
		                                                <td>Sales Assistant</td>
		                                                <td>New York</td>
		                                                <td>46</td>
		                                                <td>2011/12/06</td>
		                                                <td>$145,600</td>
		                                            </tr><tr role="row" class="even">
		                                                <td class="sorting_1">Cedric Kelly</td>
		                                                <td>Senior Javascript Developer</td>
		                                                <td>Edinburgh</td>
		                                                <td>22</td>
		                                                <td>2012/03/29</td>
		                                                <td>$433,060</td>
		                                            </tr>
		                                        </tbody>
                                  		  </table>
                                    	</div>
                                    </div>
                                   
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    	
		<form>
    	<div class="row">
    		<!-- <div class='col-md-5'></div> -->
   			<div class='col' style="margin-top:5px;">
				<c:if test="${searchDTO.pagingDTO.startPage == 1}">
				<a class="btn btn-default">Previous</a>
				</c:if>
				<c:if test="${searchDTO.pagingDTO.startPage != 1}">
				<a href="/store/customer/transactionhistory?pg=${searchDTO.pagingDTO.startPage-1}" class="btn btn-default">Previous</a>
				</c:if>
				
				<c:forEach var="i" begin="${searchDTO.pagingDTO.startPage}" end="${searchDTO.pagingDTO.endPage}">
				<c:if test="${searchDTO.pagingDTO.pg == i}">
				<a href="#" class="btn btn-warning">${i}</a>
				</c:if>
				<c:if test="${searchDTO.pagingDTO.pg != i}">
				<a href="/store/customer/transactionhistory?pg=${i}" class="btn btn-warning">${i}</a>
				</c:if>
				</c:forEach>
				
				
				<c:if test="${searchDTO.pagingDTO.endPage == searchDTO.pagingDTO.totalPage}">
				<a class="btn btn-default">Next</a>
				</c:if>
				<c:if test="${searchDTO.pagingDTO.endPage != searchDTO.pagingDTO.totalPage}">
				<a href="/store/customer/transactionhistory?pg=${searchDTO.pagingDTO.endPage+1}" class="btn btn-default">Next</a>
				</c:if>
			</div>
		</div>
		</form>
    </div>
</div>
</body>
</html>