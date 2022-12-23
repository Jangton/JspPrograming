<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
    
<%@include file="../includes/header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">게시글 등록</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            게시글 등록
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">

														<form action="/board/register" method="post">
	                            <div class="form-group">
	                                <label>Title</label>
	                                <input class="form-control" name="title">
	                                <p class="help-block">나의 노하우를 얘기해보아요!</p>
	                            </div>	
                              <div class="form-group">
                                   <label>Content</label>
                                   <textarea class="form-control" rows="3" name="content"></textarea>
                              </div>
	                            <div class="form-group">
	                                <label>Writer</label>
	                                <input class="form-control" name="writer">
	                                <p class="help-block">별명도 상관없어요!</p>
	                            </div>
	                            <button type="submit" class="btn btn-default">작성</button>
                              <button type="reset" class="btn btn-default">초기화</button>	                              												
														</form>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->


<%@include file="../includes/footer.jsp"%>