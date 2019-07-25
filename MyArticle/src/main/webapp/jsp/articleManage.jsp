
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% String basePath = request.getScheme() + "://" + request.getServerName() +
        ":" + request.getServerPort() + request.getContextPath() + "/";%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>

    <base href="<%=basePath%>">
    <title>Title</title>
    <link rel="stylesheet" href="static/layui/css/layui.css"/>
    <link rel="stylesheet" href="static/css/bootstrap.min.css"/>
</head>
<body>
<div class="container" style="width: 90%;">
    <br/>
    <br/>
        <fieldset class="layui-elem-field layui-field-title">
            <legend style="margin-left: 20px;padding: 0 10px;text-align: left;width: 170px;border-bottom: none;"><strong>文章信息列表</strong></legend>
        </fieldset>
        <br/>
        <h5 style="margin-top: -20px;">
            <i class="fa fa-paper-plane-o fa-fw" style="color: #299A74"></i>
            <span style="color: #299A74;"><strong>输入查询信息</strong></span>
        </h5>
        <hr style="margin-top: 0;"/>
        <div class="form table">
            <div>
                <form class="layui-form form-inline" action="article/findByPage" role="form" method="post">
                    <div class="layui-form-item">
                        <label class="layui-form-label" style="margin-left: -10px;padding-left:0;"><strong>文章作者</strong></label>
                        <div class="layui-input-inline">
                            <input name="author" placeholder="请输入文章作者姓名查询" class="layui-input" type="text">
                        </div>
                        <label class="layui-form-label" style="width:8%;"><strong>审核状态</strong></label>
                        <div class="layui-input-inline" style="width: 100px;">
                            <select name="r_verify">
                                <option></option>
                                <option>已审核</option>
                                <option>未审核</option>
                            </select>
                        </div>
                        <label class="layui-form-label" style="width:8%;"><strong>发布状态</strong></label>
                        <div class="layui-input-inline" style="width: 100px;">
                            <select name="r_publish">
                                <option></option>
                                <option>已发布</option>
                                <option>未发布</option>
                            </select>
                        </div>
                        <label class="layui-form-label" style="width:8%;"><strong>存在状态</strong></label>
                        <div class="layui-input-inline" style="width: 100px;">
                            <select name="r_status">
                                <option></option>
                                <option>存在</option>
                                <option>已删除</option>
                            </select>
                        </div>
                        <div class="layui-input-inline" style="margin-left: 50px;">
                            <button class="layui-btn" type="submit">查询</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    <h5>
        <i class="fa fa-paper-plane-o fa-fw" style="color: #299A74"></i>
        <span style="color: #299A74;"><strong>查询结果展示</strong></span>
    </h5>
    <hr style="margin-top: 0;"/>
        <div class="layui-inline">
            <button type="button" id="cleanBtnMore" class="layui-btn layui-btn-danger">批量删除</button>
            <a href="article/toArticleWrite"><button type="button" id="addBtn" class="layui-btn layui-btn">添加文章</button></a>
        </div>
    <br/>
    <br/>
    <div class="table-responsive">
        <table class="table table-striped table-hover" id="countTable">
            <thead>
            <tr>
                <th style="text-align: center"><input type="checkbox" id="all"/></th>
                <th style="text-align: center;">文章编号</th>
                <th style="text-align: center">文章简介</th>
                <th style="text-align: center">文章作者</th>
                <th style="text-align: center">发表日期</th>
                <th style="text-align: center">审核状态</th>
                <th style="text-align: center">发布状态</th>
                <th style="text-align: center">存在状态</th>
                <th style="text-align: center;">操作</th>
            </tr>
            </thead>
            <tbody style="text-align: center">
            <c:forEach items="${page.beanList}" var="article">
                <tr>
                    <td><input name="id" value="${article.id}" type="checkbox"/></td>
                    <td>${article.id}</td>
                    <td>${article.summary}</td>
                    <td>${article.author}</td>
                    <td>${article.date}</td>
                        <td>
                            <c:if test="${article.verify eq 0}">
                                <label style="color: #FF5722">未审核</label>
                            </c:if>
                            <c:if test="${article.verify eq 1}">
                                已审核
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${article.publish eq 0}">
                                未发布
                            </c:if>
                            <c:if test="${article.publish eq 1}">
                                已发布
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${article.status eq 0}">
                                <label style="color: #FF5722">已删除</label>
                            </c:if>
                            <c:if test="${article.status eq 1}">
                                存在
                            </c:if>
                        </td>
                        <td>
                            <a href="article/toArticleView?id=${article.id}"><button type="button" class="layui-btn layui-btn-sm">查看</button>
                            <a href="article/toEditPage?id=${article.id}"><button type="button" class="layui-btn layui-btn-sm layui-btn-normal">编辑</button></a>
                            <button type="button" onclick="return clean(${article.id});" class="layui-btn layui-btn-sm layui-btn-danger">删除</button>
                        </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <form class="listForm" name="listForm" method="post" action="article/findByPage">
        <div class="row">
            <div class="form-inline" style="margin-left: 15px;">
                <label style="font-size:14px;margin-top:22px;">
                    <strong>共<b>${page.totalCount}</b>条记录，共<b>${page.totalPage}</b>页</strong>
                    &nbsp;
                    &nbsp;
                    <strong>每页显示</strong>
                    <select class="form-control" name="pageSize">
                        <option value="2"
                                <c:if test="${page.pageSize == 2}">selected</c:if> >2
                        </option>
                        <option value="3"
                                <c:if test="${page.pageSize == 3}">selected</c:if> >3
                        </option>
                        <option value="4"
                                <c:if test="${page.pageSize == 4}">selected</c:if> >4
                        </option>
                        <option value="5"
                                <c:if test="${page.pageSize == 5}">selected</c:if> >5
                        </option>
                    </select>
                    <strong>条</strong>
                    &nbsp;
                    &nbsp;
                    <strong>到第</strong>&nbsp;<input type="text" size="3" id="page" name="pageCode"
                                                    class="form-control input-sm"
                                                    style="width:11%"/>&nbsp;<strong>页</strong>
                    &nbsp;
                    <button type="submit" class="btn btn-sm btn-info">GO!</button>
                </label>
                <ul class="pagination" style="float:right;">
                    <li>
                        <a href="article/findByPage?pageCode=1"><strong>首页</strong></a>
                    </li>
                    <li>
                        <c:if test="${page.pageCode > 2}">
                            <a href="article/findByPage?pageCode=${page.pageCode - 1}">&laquo;</a>
                        </c:if>
                    </li>

                    <!-- 写关于分页页码的逻辑 -->
                    <c:choose>
                        <c:when test="${page.totalPage <= 5}">
                            <c:set var="begin" value="1"/>
                            <c:set var="end" value="${page.totalPage}"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="begin" value="${page.pageCode - 1}"/>
                            <c:set var="end" value="${page.pageCode + 3}"/>

                            <!-- 头溢出 -->
                            <c:if test="${begin < 1}">
                                <c:set var="begin" value="1"/>
                                <c:set var="end" value="5"/>
                            </c:if>

                            <!-- 尾溢出 -->
                            <c:if test="${end > page.totalPage}">
                                <c:set var="begin" value="${page.totalPage -4}"/>
                                <c:set var="end" value="${page.totalPage}"/>
                            </c:if>
                        </c:otherwise>
                    </c:choose>

                    <!-- 显示页码 -->
                    <c:forEach var="i" begin="${begin}" end="${end}">
                        <!-- 判断是否是当前页 -->
                        <c:if test="${i == page.pageCode}">
                            <li class="active"><a href="javascript:void(0);">${i}</a></li>
                        </c:if>
                        <c:if test="${i != page.pageCode}">
                            <li>
                                <a href="article/findByPage.do?pageCode=${i}">${i}</a>
                            </li>
                        </c:if>
                    </c:forEach>

                    <li>
                        <c:if test="${page.pageCode < page.totalPage}">
                            <a href="article/findByPage.do?pageCode=${page.pageCode + 1}">&raquo;</a>
                        </c:if>
                    </li>
                    <li>
                        <a href="article/findByPage.do?pageCode=${page.totalPage}"><strong>末页</strong></a>
                    </li>
                </ul>
            </div>
        </div>
    </form>
</div>
</body>
<script src="static/js/jquery-3.3.1.min.js"></script>
<script src="static/layui/layui.all.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script type="text/javascript">
    layui.use('element', function () {
        var element = layui.element;
    });
</script>
<script type="text/javascript">
    //删除
    function clean(r_id){
        layer.open({
            title: '警告信息',
            content: '你确定要删除？（文章将保存在回收站中）',
            btn: ['确定','取消'],
            btn1: function(index,layero){
                $.ajax({
                    url: '<%=basePath%>/article/clean.do',
                    type: 'POST',
                    data: {r_id: r_id},
                    success: function(data){
                        layer.open({
                            title: '提示信息',
                            content: '删除成功',
                            time: 2000
                        });
                        $("body").html(data);
                    },
                    error: function(){
                        layer.open({
                            title: '提示信息',
                            content: '删除失败'
                        });
                    }
                });
                layer.close(index);
            }
        });
    }

    //编辑
    function edit(r_id){
        $.ajax({
            url: '<%=basePath%>/article/toEditPage.do',
            type: 'GET',
            data: {r_id: r_id},
            success: function(data){
                $("body").html(data);
            },
            error: function(){
                     title: '提示信息',
                    content: '发生错误'
                });
            }
        });
    }

    $("#cleanBtnMore").click(function(){
        layer.open({
            title: '警告信息',
            content: '你确定要删除所选文章吗？',
            btn: ['确定','取消'],
            btn1: function(index,layero){
                layer.close(index);
            }
        });
    });

    //全选
    var all = $("#all");
    var id = $("#a_id");
    all.onclick = function(){
        for (var i = 0;i<id.length;i++){
            id[i].checked = all.checked;
        }
    }
</script>
</html>
