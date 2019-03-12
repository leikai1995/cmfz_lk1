<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>持名法州主页</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/themes/default/easyui.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/datagrid-detailview.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/echarts.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/china.js"></script>
    <script type="text/javascript" src="http://cdn-hangzhou.goeasy.io/goeasy.js"></script>
    <script type="text/javascript">
        // 添加功能函数的封装
        function addTab(title,href,icon){
            var options={"title":title,"href":href,"closable":true,"iconCls":icon}
            // 判断是否存在添加的新选项卡
            if(!$('#tt').tabs('exists',options.title)){
                // 执行添加
                $('#tt').tabs('add',options);
            }else{
                // 选中对应选项卡
                $('#tt').tabs('select',options.title);
            }
        }
        $(function () {
            $.get('${pageContext.request.contextPath }/menu/showMenu.do',function (list) {
                $(list).each(function(idx,menu){
                    var context="";
                    $(menu.slist).each(function(sidx,smenu){
                        var title="\'"+smenu.title+"\'";
                        var href = "\'${pageContext.request.contextPath }"+smenu.href+"\'";
                        var sicon ="\'"+smenu.iconCls+"\'";
                        context+= '<div style="text-align: center;margin-top:10px">' +
                                    '<a onclick="addTab('+title+','+href+','+sicon+');" data-options="iconCls:'+sicon+'" class="easyui-linkbutton" style="width:100%">'+smenu.title+'</a>' +
                                  '</div>'
                    })
                    if(idx==0){
                        $('#dm').accordion('add',{
                            title:menu.title,
                            iconCls:menu.iconCls,
                            content:context,
                            selected:true
                        })
                    }else{
                        $('#dm').accordion('add',{
                            iconCls:menu.iconCls,
                            title:menu.title,
                            content:context,
                            selected:false
                        })
                    }
                })
            },'json')

            $('#dm').accordion({
                border:false,
                selected:0
            });
        })
    </script>
</head>
<body class="easyui-layout">   
    <div data-options="region:'north',split:true" style="height:60px;background-color:  #5C160C">
    	<div style="font-size: 24px;color: #FAF7F7;font-family: 楷体;font-weight: 900;width: 500px;float:left;padding-left: 20px;padding-top: 10px" >持名法州后台管理系统</div>
    	<div style="font-size: 16px;color: #FAF7F7;font-family: 楷体;width: 300px;float:right;padding-top:15px">欢迎您:${sessionScope.admin.name } &nbsp;<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改密码</a>&nbsp;&nbsp;<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-01'">退出系统</a></div>
    </div>   
    <div data-options="region:'south',split:true" style="height: 40px;background: #5C160C">
    	<div style="text-align: center;font-size:15px; color: #FAF7F7;font-family: 楷体" >&copy;百知教育 htf@zparkhr.com.cn</div>
    </div>   
       
    <div  data-options="region:'west',title:'导航菜单',split:true" style="width:220px;">
        <div id="dm" class="easyui-accordion" data-options="fit:true">

        </div>
    </div>


    <div data-options="region:'center'">
    	<div id="tt" class="easyui-tabs" data-options="fit:true,narrow:true,pill:true">   
		    <div title="主页" data-options="iconCls:'icon-neighbourhood',"  style="background-image:url(img/shouye.jpg);background-repeat: no-repeat;background-size:100% 100%;">
            </div>
		</div>  
    </div>   
</body> 
</html>