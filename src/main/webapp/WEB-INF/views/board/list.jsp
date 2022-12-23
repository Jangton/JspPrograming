<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
    
<%@include file="../includes/header.jsp" %>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">게시판</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Board List Page
                            <button id="regBtn" type="button" class="btn btn-xs pull-right">새로운 글 쓰러가기</button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        <div id="outter">
						<div style="float: right;">
							<select id="cntPerPage" name="sel" onchange="selChange()">
								<option value="5"
									<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
								<option value="10"
									<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
								<option value="15"
									<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
								<option value="20"
									<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
							</select>
						</div> <!-- 옵션선택 끝 -->
                            <table width="100%" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                        <th>수정일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="board" items="${list}">
                                    <tr class="odd gradeX">
                                        <td><c:out value='${board.bno}'/></td>
                                        <td><a class="move" href="<c:out value='${board.bno}'/>"><c:out value='${board.title}'/></a></td>
                                        <td><c:out value='${board.writer}'/></td>
                                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate}"/></td>
                                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}"/></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <!-- /.table-responsive -->

							<div class="pull-right">
							 <ul class="pagination">
							<c:if test="${pageMaker.prev}">
							<li class="page-item">
							<a class="page-link" href="${pageMaker.startPage-1 }">Previous</a>
							</li>
							</c:if>
														    
							<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<li class="page-item ${pageMaker.cri.pageNum == num ? 'active':''}">
								<a class="page-link" href="${num}">${num}</a>
							</li>
							</c:forEach>	
														    
							<c:if test="${pageMaker.next}">
							<li class="page-item">
							<a class="page-link" href="${pageMaker.endPage+1 }">Next</a>
							</li>
							</c:if>
							</ul>
						</div><!-- end of pagination -->
														
						<form id="pageForm" action="/board/list"  method="get">
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
							<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						</form>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        Modal body..
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		var result = '<c:out value="${result}"/>';
		
		checkModal(result);
		
		history.replaceState({}, null, null); //브라우저 주소창에 보관하고 있는 정보 지우기
		
		function checkModal(result){
			
			if(result ===''|| history.state){ //브라우저 기록 스택의 맨위에 있는 상태값 가져오기. 상태값이 있으면 return
				return;
				
			}else if(result ==='registered'){
				$(".modal-title").html("게시글 등록");
				$(".modal-body").html("새 게시글이 등록되었습니다.");
				
			}else if(result ==='modified'){
				$(".modal-title").html("게시글 수정");
				$(".modal-body").html("게시글이 수정되었습니다.");
				
			}else if(result ==='removed'){
				$(".modal-title").html("게시글 삭제");
				$(".modal-body").html("게시글이 삭제되었습니다.");
				
			}
			$("#myModal").modal("show");
		}
		
		$("#regBtn").click(function(){
			self.location = "/board/register";
			//window.location = "/board/register";
		});
		
		
		$(".move").on("click", function(e){
			e.preventDefault();
			
			var targetBno = $(this).attr("href");
			console.log(targetBno);
			pageForm.append("<input type='hidden' name='bno' value='" + targetBno + "'>");
			pageForm.attr("action", "/board/get");
			pageForm.submit();
		});
	});
	
</script>

<%@include file="../includes/footer.jsp"%>