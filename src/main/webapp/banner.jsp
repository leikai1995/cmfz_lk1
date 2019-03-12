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



<table class="table easyui-datagrid" id="t">
</table>
<div id="dgUpdate" style="display:none">
    <form id="updateForm" method="post">
        <input type="hidden" name="id" />
        <table cellpadding="0" cellspacing="0" border="0" class="form_table">
            <tr>
                <td valign="middle" align="right">
                    title:
                </td>
                <td valign="middle" align="left">
                    <input id="title" type="text" class="inputgri" name="title" />
                </td>
            </tr>
            <tr>
                <td valign="middle" align="right">
                    description:
                </td>
                <td valign="middle" align="left">
                    <input id="description" type="text" class="inputgri" name="description"/>
                </td>
            </tr>
            <tr>
                <td valign="middle" align="right">
                    status:
                </td>
                <td valign="middle" align="left">
                    <input id="status" type="text" class="inputgri" name="status"/>
                </td>
            </tr>

        </table>

    </form>
</div>
<div id="dgAdd" style="display:none">
    <form id="addForm" enctype="multipart/form-data"  method="post">

        <table cellpadding="0" cellspacing="0" border="0" class="form_table">
            <tr>
                <td valign="middle" align="right">
                    title:
                </td>
                <td valign="middle" align="left">
                    <input id="addTitle" type="text" class="inputgri" name="title"/>
                </td>
            </tr>
            <tr>
                <td valign="middle" align="right">
                    description:
                </td>
                <td valign="middle" align="left">
                    <input id="addDescription" type="text" class="inputgri" name="description"/>
                </td>
            </tr>
            <tr>
                <td valign="middle" align="right">
                    status:
                </td>
                <td valign="middle" align="left">
                    <input id="addStatus" type="text" class="inputgri" name="status"/>
                </td>
            </tr>
            <tr>
                <td valign="middle" align="right">
                    selectImg:
                </td>
                <td valign="middle" align="left">
                    <input id="AddImg" type="text" name="upfile" />
                </td>
            </tr>

        </table>

    </form>
</div>
<script type="text/javascript">
    $(function(){
        $.extend($.messager.defaults,{
            ok:"确定",
            cancel:"取消"
        });
        $("#title").textbox({
            width:150,
            type:'text',
            labelAlign:'left',
            required:true,
            validType:'length[2,10]',
            missingMessage:'图片标题不能为空',
            invalidMessage:'图片标题长度在2-10之间'

        });
        $("#description").textbox({
            width:150,
            type:'text',
            labelAlign:'left',
            required:true,
            validType:'length[2,10]',
            missingMessage:'图片描述不能为空',
            invalidMessage:'图片描述长度在2-10之间'

        });

        $("#status").textbox({
            width:150,
            required:true,
            validType:'length[1,1]',
            missingMessage:'请输入图片状态（1代表可用；0代表不可用）',
            invalidMessage:'图片状态为1或0',
            type:'text'
        });

        $('#updateForm').form({
            type:'POST',
            url:'${pageContext.request.contextPath }/banner/updateImg.do',
            onSubmit:function(){
                var b =  $('#updateForm').form('validate');
                return b;
            },
            success:function(data){
                $('#dgUpdate').dialog('close');
                $.messager.alert('提示信息','修改成功','info'),
                $('#t').datagrid('reload');
            },
            ajax:true
        });



        $("#t").datagrid({
            checkOnSelect:false,// 选中行同时是否勾选checkbox
            selectOnCheck:true,// 勾选checkbox是否选中行
            loadMsg:'正在努力加载中...',
            singleSelect:false,
            ctrlSelect:true,
            title:'轮播图信息展示',
            url:'${pageContext.request.contextPath }/banner/showBanner.do',
            fitColumns:true,
            //分页
            /*pagination:true,
            pagePosition:'bottom',
            pageSize:5,
            pageList:[5,10,15,20],*/
            columns:[[
                {field:'ck',width:100,checkbox:true},
                {field:'id',width:100,title:'id',hidden:true},
                {field:'title',width:100,title:'title'},
                {field:'status',width:100,title:'status'},
                {field:'description',width:100,title:'description'},
                {field:'img_Path',width:100,title:'img_Path'},
                {field:'createTime',width:100,title:'createTime'},


            ]],
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath }' + rowData.img_Path + '" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>description: ' + rowData.description + '</p>' +
                    '<p>createTime: ' + rowData.createTime + '</p>' +
                    '<p>img_Path: ' + rowData.img_Path + '</p>' +
                    '</td>' +
                    '</tr></table>';
            },
            toolbar:[ // 工具栏
                {
                    text:'添加图片',
                    iconCls:'icon-add',
                    handler:function(){
                        $('#dgAdd').dialog({
                            title:"添加图片",
                            width:400,
                            higth:300,
                            buttons:[{
                                text:"提交",
                                iconCls:'icon-ok',
                                handler:function(){
                                    $('#addForm').submit();
                                }
                            }]
                        });
                    }
                },
                {
                    text:'修改',
                    iconCls:'icon-edit',
                    handler:function(){
                        var selectRow = $('#t').datagrid('getSelected');
                        if(selectRow){
                            $('#updateForm').form('load',{
                                id:selectRow.id,
                                title:selectRow.title,
                                description:selectRow.description,
                                status:selectRow.status,
                            });
                            $('#dgUpdate').dialog({
                                title:"修改部门信息",
                                width:400,
                                higth:300,
                                buttons:[{
                                    text:"提交",
                                    iconCls:'icon-ok',
                                    handler:function(){

                                        $('#updateForm').submit();

                                    }
                                }]
                            });
                        }else{
                            $.messager.alert('提示信息','请选中一行数据！~','warning');
                        }

                    }
                },
                {
                    text:'删除',
                    iconCls:'icon-remove',
                    handler:function(){


                        var checkedRow = $('#t').datagrid('getChecked');
                        console.log(checkedRow);
                        if(checkedRow.length){
                            $.messager.confirm('提示确认','您是否要删除', function(r){
                                var array = [];
                                $(checkedRow).each(function(idx,obj){
                                    array.push(obj.id);
                                });
                                var json = JSON.stringify(array);
                                $.ajax({
                                    type:"POST",
                                    url:"${pageContext.request.contextPath }/banner/deleteImg.do",
                                    data:json,
                                    contentType:'application/json',
                                    success:function(){
                                        $.messager.alert('提示信息','删除成功','info'),
                                        $('#t').datagrid('reload');
                                    }
                                });
                            });
                        }else{
                            $.messager.alert('提示信息','请选中删除的数据！~','warning');
                        }

                    }
                },
                {
                    text:'刷新',
                    iconCls:'icon-reload',
                    handler:function(){

                        $('#t').datagrid('reload');
                    }
                }
            ],



        });

        $("#addTitle").textbox({
            width:150,
            promp:"请输入图片标题",
            type:'text',
            labelAlign:'left',
            required:true,
            validType:'length[2,10]',
            missingMessage:'图片标题不能为空',
            invalidMessage:'部门名称长度在2-10之间'

    });

        $("#addDescription").textbox({
            width:150,
            promp:"请输入图片描述",
            required:true,
            validType:'length[3,20]',
            missingMessage:'图片描述不能为空',
            invalidMessage:'图片描述长度为3-20',
            type:'text'
        });
        $("#addStatus").textbox({
            width:150,
            promp:"请输入图片状态（1代表可用；0代表不可用）",
            required:true,
            validType:'length[1,1]',
            missingMessage:'图片状态不能为空',
            invalidMessage:'图片状态为1或0',
            type:'text'
        });
        $('#AddImg').filebox({
            width:150,
            buttonText: '选择文件',
            buttonAlign: 'right',
            required:true
        })

        $('#addForm').form({
            url:'${pageContext.request.contextPath }/banner/addImg.do',
            onSubmit:function(){
                var b =  $('#addForm').form('validate');
                console.log("addFrom  == "+b);
                return b;
            },
            success:function(data){
                $('#dgAdd').dialog('close');
                $.messager.alert('提示信息','添加成功','info'),
                $('#t').datagrid('reload');
                $('#addForm').form('clear');

            },
            ajax:true
        });

    });
</script>


</body>
</html>
