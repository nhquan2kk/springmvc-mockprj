<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	

<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Skydash Admin</title>
<!-- plugins:css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/webapp/assets/Admin/vendors/feather/feather.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/Admin/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/Admin/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/Admin/vendors/mdi/css/materialdesignicons.min.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/Admin/css/vertical-layout-light/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/Admin/images/favicon.png" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/Admin/css/custom/style.css">
<style type="text/css">
.table td img, .jsgrid .jsgrid-table td img {
	width: 45%;
	border-radius: 0;
	height: 50px;
}

.btn-icon {
	display: inline-block;
	cursor: pointer;
	font-size: 30px;
	margin-right: 5px;
	width: 40px;
	text-align: left;
	color: #4B49AC;
}
</style>
</head>

<body>
	<div class="container-scroller">
		<!-- partial:../../partials/_navbar.html -->
		<jsp:include page="./Shared/Header.jsp"></jsp:include>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:../../partials/_settings-panel.html -->
			<jsp:include page="./Shared/SettingPanel.jsp"></jsp:include>
			<jsp:include page="./Shared/OptionPanel.jsp"></jsp:include>
			<jsp:include page="./Shared/Sidebar.jsp"></jsp:include>
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<h3>Report Manager</h3>
						<div class="col-lg-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<div class="table-responsive pt-3">
										<table class="table table-bordered">
											<thead>
												<tr>
													<th>Name</th>
													<th>Email</th>
													<th>Title</th>
													<th>Detail</th>
													<th>Created</th>
													<th>Action</th>
												</tr>
											</thead>
											<tbody>
												 <c:if test="${not empty reports}">
												    <c:forEach items="${reports}" var="report" varStatus="index">
												        <tr>
												            <td><a href="#" data-toggle="modal" data-target="#updateModal-${report.id}">${report.name}</a></td>
												            <td>${report.email}</td>
												            <td>${report.title}</td>
												            <td>${report.detail}</td>
												            <td>${report.createdAt}</td>
												            <td>
												            	<form id="deleteForm" method="post"
																action="${pageContext.request.contextPath}/contact/delreport">
																<input type="hidden" name="id"
																	value="${report.id }" />
																<button type="button" class="btn " data-toggle="modal"
																	data-target="#exampleModal-${report.id }">
																	<i style="font-size: 30px;"
																		class="mdi mdi-delete-forever btn-icon "></i>
																</button>
																<div class="modal fade"
																	id="exampleModal-${report.id }" tabindex="-1"
																	aria-labelledby="exampleModalLabel" aria-hidden="true">
																	<div class="modal-dialog">
																		<div class="modal-content">
																			<div class="modal-header">
																				<h5 class="modal-title" id="exampleModalLabel">Notification</h5>
																				<button type="button" class="close"
																					data-dismiss="modal" aria-label="Close">
																					<span aria-hidden="true">&times;</span>
																				</button>
																			</div>
																			<div class="modal-body">Do you want to delete
																				${report.name } ?</div>
																			<div class="modal-footer">
																				<button type="button" class="btn btn-secondary"
																					data-dismiss="modal">Cancel</button>
																				<button type="submit" class="btn btn-primary">Delete</button>
																			</div>
																		</div>
																	</div>
																</div>
																
															</form>
												
												            <!-- Update Modal -->
												            <div class="modal fade" id="updateModal-${report.id}" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
												                <div class="modal-dialog" role="document">
												                    <div class="modal-content">
												                        <div class="modal-header">
												                            <h5 class="modal-title" id="updateModalLabel">Update Report</h5>
												                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
												                                <span aria-hidden="true">&times;</span>
												                            </button>
												                        </div>
												                        <form action="${pageContext.request.contextPath}/contact/updatereport" method="post">
												                            <div class="modal-body">
												                                <input type="hidden" name="id" value="${report.id}">
												                                <div class="form-group">
												                                    <label for="name">Name</label>
												                                    <input type="text" class="form-control" name="name" value="${report.name}" required>
												                                </div>
												                                <div class="form-group">
												                                    <label for="email">Email</label>
												                                    <input type="email" class="form-control" name="email" value="${report.email}" required>
												                                </div>
												                                <div class="form-group">
												                                    <label for="title">Title</label>
												                                    <input type="text" class="form-control" name="title" value="${report.title}" required>
												                                </div>
												                                <div class="form-group">
												                                    <label for="detail">Detail</label>
												                                    <textarea class="form-control" name="detail" required>${report.detail}</textarea>
												                                </div>
												                            </div>
												                            <div class="modal-footer">
												                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
												                                <button type="submit" class="btn btn-primary">Update</button>
												                            </div>
												                        </form>
												                    </div>
												                </div>
												            </div>
												            </td>
												        </tr>
												    </c:forEach>
												</c:if>
											</tbody>
										</table>
									</div>
								</div>
							</div>

						</div>
						<c:if test="${numberPage == 1 }">
							<div class="btn-group" role="group" aria-label="Basic example">
								<button type="button" class="btn btn-outline-secondary">Prev</button>
								<button type="button" class="btn btn-outline-secondary">
									<a href="AdminGrammarController?pageId=1">1</a>
								</button>
								<button type="button" class="btn btn-outline-secondary">
									<a href="AdminGrammarController?pageId=2">2</a>
								</button>
								<button type="button" class="btn btn-outline-secondary">
									<a href="AdminGrammarController?pageId=3">3</a>
								</button>
								<button type="button" class="btn btn-outline-secondary">
									<a href="AdminGrammarController?pageId=${numberPage +1}">Next</a>
								</button>
							</div>
						</c:if>
						
					</div>
				</div>
				<!-- content-wrapper ends -->
				<!-- partial:../../partials/_footer.html -->
				<jsp:include page="./Shared/Footer.jsp"></jsp:include>
				<!-- partial -->
			</div>
			<!-- main-panel ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- plugins:js -->
	<script src="${pageContext.request.contextPath}/assets/Admin/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="${pageContext.request.contextPath}/assets/Admin/js/off-canvas.js"></script>
	<script src="${pageContext.request.contextPath}/assets/Admin/js/hoverable-collapse.js"></script>
	<script src="${pageContext.request.contextPath}/assets/Admin/js/template.js"></script>
	<script src="${pageContext.request.contextPath}/assets/Admin/js/settings.js"></script>
	<script src="${pageContext.request.contextPath}/assets/Admin/js/todolist.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page-->
	<!-- End custom js for this page-->
</body>

</html>