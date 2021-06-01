<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="app" value="${pageContext.request.contextPath}" />
<c:set var="dto" value="${customerDTO}" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>ThankStore 거래내역</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${app}/resources/quixlab/themes/quixlab/images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="${app}/resources/quixlab/themes/quixlab/css/style.css" rel="stylesheet">
<script type="text/javascript"
	src="${app}/resources/customer/js/jquery-3.6.0.min.js"></script>
</head>

<body>

    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->

    
    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">

        <!--**********************************
            Nav header start
        ***********************************-->
        <div class="nav-header" style="background-color:white">
			<img src="${app}/resources/logo_copy.png" style='height: 100%; width: 100%; object-fit: contain'alt="">
        </div>
        <!--**********************************
            Nav header end
        ***********************************-->

        <!--**********************************
            Header start
        ***********************************-->
         <div class="header">    
            <div class="header-content clearfix">
                
                <div class="nav-control">
                    <div class="hamburger">
                        <span class="toggle-icon"><i class="icon-menu"></i></span>
                    </div>
                </div>
                <div class="header-left">
                    <div class="input-group icons">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3" id="basic-addon1"><i class="mdi mdi-magnify"></i></span>
                        </div>
                        <!-- 화면에 어디에 뜨는지 이해불가 -->
                        <div class="drop-down   d-md-none">
							<form action="#">
								<input type="text" class="form-control" placeholder="Search">
							</form>
                        </div>
                        <!-- 이해불가 -->
                    </div>
                </div>
                
            </div>
        </div>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->
        <div class="nk-sidebar" style="height: 880px;  width: 243px; padding-bottom:0px">         
			<jsp:include page="/WEB-INF/views/customer/fragment/newcategorybar.jsp" flush="true" />			
        </div>
        <!--**********************************
            Sidebar end
        ***********************************-->
        <!--**********************************
            profile start
        ***********************************-->
		<div class="nk-sidebar" style="height:1297px; width:243px; margin-left:243px; margin-right:0px">
 			<jsp:include page="/WEB-INF/views/customer/fragment/newprofilebar.jsp" flush="true" />
		</div>
 		 <!--**********************************
            profile end
        ***********************************-->
        <!--**********************************
            Content body start
        ***********************************-->		
       <div class="content-body" style=" margin-left: 486px; ">            
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
    	<div class="row" style="text-align:center;">
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
        <!--**********************************
            Content body end
        ***********************************-->

    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="${app}/resources/quixlab/themes/quixlab/plugins/common/common.min.js"></script>
    <script src="${app}/resources/quixlab/themes/quixlab/js/custom.min.js"></script>
    <script src="${app}/resources/quixlab/themes/quixlab/js/settings.js"></script>
    <script src="${app}/resources/quixlab/themes/quixlab/js/gleek.js"></script>
    <script src="${app}/resources/quixlab/themes/quixlab/js/styleSwitcher.js"></script>

</body>

</html>