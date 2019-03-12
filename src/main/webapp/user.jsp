<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>department</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/themes/default/easyui.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/datagrid-detailview.js"></script>

        </head>
<body>


<table class="table easyui-datagrid" id="tuser">
</table>


<script type="text/javascript">


    $(function(){
        $("#tuser").datagrid({
            fit:true,
            loadMsg:'正在努力加载中...',
            singleSelect:false,
            ctrlSelect:true,
            title:'用户信息展示',
            url:'${pageContext.request.contextPath }/user/showUser.do',
            fitColumns:true,
            //分页
            pagination:true,
            pagePosition:'bottom',
            pageNumber:1,
            pageSize:10,
            pageList:[5,10,15,25],
            columns:[[
                {field:'dharmaName',width:100,title:'法名'},
                {field:'realname',width:100,title:'真实姓名'},
                {field:'sex',width:100,title:'性别',
                    formatter:function(value,row,index){
                        if(value=='m'){
                            return '<span >男</span>'
                        }else{
                            return '<span >女</span>'
                        }
                    }
                },
                {field:'province',width:100,title:'省份'},
                {field:'city',width:100,title:'城市'},
                {field:'phone',width:100,title:'手机号'},
                {field:'createTime',width:100,title:'创建时间'},
                {field:'status',width:100,title:'用户状态',
                    formatter:function(value,row,index){
                        if(value==0){
                            return '<span style="color: red">冻结</span>'
                        }else{
                            return '<span style="color: green">正常</span>'
                        }
                    }
                }


            ]],
            toolbar:[
                {
                    text:'下载',
                    iconCls:'icon-redo',
                    handler:function(){

                        window.location.href="${pageContext.request.contextPath }/user/download.do";

                    }
                }
            ]

        });



    });
</script>


</body>
</html>
