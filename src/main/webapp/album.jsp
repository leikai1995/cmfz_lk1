<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>

<html>
<head>
    <title>album</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/themes/default/easyui.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/datagrid-detailview.js"></script>

        </head>
<body>

    <table id="albumTable" style="width:600px;height:400px"></table>

    <div id="showAlbum" style="display:none;">
        <div>封面照片：<img  width="30%" id="showCoverImg" src="" /></div><br>
        专辑名称：<span id="showTitle"></span><br/>
        专辑评分：<span id="showScore"></span><br/>
        作者：<span id="showAuthor"></span><br/>
        播音：<span id="showBrodcast"></span><br/>
        集数：<span id="showCount"></span><br/>
        发布日期：<span id="showDate"></span><br/>
        内容简介：<span id="showBrief"></span><br/>
        状态：<span id="showStatus"></span><br/>


    </div>
    <div id="dgAddChapter" style="display:none">
        <form id="addChapterForm" method="post" enctype="multipart/form-data">
            <input type="hidden" name="albumId" id="albumId"/>
            <table cellpadding="0" cellspacing="0" border="0" class="form_table">
                <tr>
                    <td valign="middle" align="right">
                        title:
                    </td>
                    <td valign="middle" align="left">
                        <input id="title" type="text"  name="title" />
                    </td>
                </tr>

                <tr>
                    <td valign="middle" align="right">
                        audio:
                    </td>
                    <td valign="middle" align="left">
                        <input id="addAudio" type="text" name="upfile" />
                    </td>
                </tr>

            </table>

        </form>
    </div>
    <div id="dgAddAlbum" style="display:none">

        <form id="addAlbumFrom" enctype="multipart/form-data"  method="post">

            <table cellpadding="0" cellspacing="0" border="0" class="form_table">
                <tr>
                    <td valign="middle" align="right" >
                        title:
                    </td>
                    <td valign="middle" align="left">
                        <input id="addTitle" type="text"  name="title"/>
                    </td>
                </tr>
                <tr>
                    <td valign="middle" align="right">
                        brodcast:
                    </td>
                    <td valign="middle" align="left">
                        <input id="addBrodcast" type="text"  name="brodcast"/>
                    </td>
                </tr>

                <tr>
                    <td valign="middle" align="right">
                        author:
                    </td>
                    <td valign="middle" align="left">
                        <input id="addAuthor" type="text"  name="author"/>
                    </td>
                </tr>
                <tr>
                    <td valign="middle" align="right">
                        brief:
                    </td>
                    <td valign="middle" align="left">
                        <input id="addBrief" type="text"  name="brief"/>
                    </td>
                </tr>
                <tr>
                    <td valign="middle" align="right">
                        status:
                    </td>
                    <td valign="middle" align="left">
                        <input id="addStatus" type="text"  name="status"/>
                    </td>
                </tr>
                <tr>
                    <td valign="middle" align="right">
                        coverImg:
                    </td>
                    <td valign="middle" align="left">
                        <input id="AddImg" type="text" name="upfile" />
                    </td>
                </tr>

            </table>

        </form>
    </div>







<script type="text/javascript">
     $(function (){
         $('#albumTable').treegrid({
             url:'${pageContext.request.contextPath }/album/showAllAlbum.do',
             idField:'id',
             treeField:'title',
             fitColumns:true,
             fit:true,
             animate:true,
             columns:[[
                 {title:'名字',field:'title',width:200},
                 {field:'url',title:'下载路径',width:300},
                 {field:'size',title:'章节大小',width:200},
                 {field:'duration',title:'章节时长',width:200}
             ]],
             onLoadSuccess:function () {
                 $('#albumTable').treegrid('collapseAll');
             },
             toolbar:[ // 工具栏
                 {
                     text:'专辑详情',
                     iconCls:'icon-tip',
                     handler:function(){
                         var selectRow = $('#albumTable').treegrid('getSelected');

                         if(selectRow){
                             var selectRow1 = $('#albumTable').treegrid('getChildren',selectRow.id);
                             if(selectRow1.length!=0){

                                 $.get('${pageContext.request.contextPath }/album/showAlbumDetails.do','id='+selectRow.id,function(data){
                                     $("#showCoverImg").prop('src','${pageContext.request.contextPath }'+data.coverImg)
                                     $("#showTitle").html(data.title);

                                     $("#showScore").html(data.score);
                                     $("#showAuthor").html(data.author);
                                     $("#showBrodcast").html(data.brodcast);
                                     $("#showBrief").html(data.brief);
                                     $("#showStatus").html(data.status);
                                     $("#showDate").html(data.releaseTime);
                                     $("#showCount").html(data.count);
                                     $('#showAlbum').dialog({
                                         title:"展示详情",
                                         width:400,
                                         height:300
                                     });
                                 },'json')
                             }else{

                                 var selectRow2 = $('#albumTable').treegrid('getParent',selectRow.id);
                                 $.get('${pageContext.request.contextPath }/album/showAlbumDetails.do','id='+selectRow2.id,function(data){
                                     $("#showCoverImg").prop('src','${pageContext.request.contextPath }'+data.coverImg)
                                     $("#showTitle").html(data.title);

                                     $("#showScore").html(data.score);
                                     $("#showAuthor").html(data.author);
                                     $("#showBrodcast").html(data.brodcast);
                                     $("#showBrief").html(data.brief);
                                     $("#showStatus").html(data.status);
                                     $("#showDate").html(data.releaseTime);
                                     $("#showCount").html(data.count);
                                     $('#showAlbum').dialog({
                                         title:"展示详情",
                                         width:400,
                                         height:300
                                     });
                                 },'json')
                             }
                         }else{
                             $.messager.alert('提示信息','请选中一个专辑！~','warning');
                         }





                     }
                 },
                 {
                     text:'添加专辑',
                     iconCls:'icon-add',
                     handler:function(){
                         $('#dgAddAlbum').dialog({
                             title:"添加专辑",
                             width:400,
                             height:300,
                             buttons:[{
                                 text:"提交",
                                 iconCls:'icon-ok',
                                 handler:function(){
                                     $('#addAlbumFrom').submit();
                                 }
                             }]
                         });
                     }
                 },
                 {
                     text:'添加章节',
                     iconCls:'icon-edit',
                     handler:function(){
                         var selectRow = $('#albumTable').treegrid('getSelected');

                         if(selectRow){
                             var selectRow1 = $('#albumTable').treegrid('getChildren',selectRow.id);
                             if(selectRow1.length!=0){
                                 $('#dgAddChapter').dialog({
                                     title:"添加章节",
                                     width:400,
                                     height:300,
                                     buttons:[{
                                         text:"提交",
                                         iconCls:'icon-ok',
                                         handler:function(){

                                             $('#albumId').val(selectRow.id)
                                             $('#addChapterForm').submit();

                                         }
                                     }]
                                 });
                             }else{
                                 $.messager.alert('提示信息','请选择您要添加章节的专辑！~','warning');
                             }
                         }else{
                             $.messager.alert('提示信息','请选中一个专辑！~','warning');
                         }



                     }
                 },

                 {
                     text:'下载',
                     iconCls:'icon-filesave',
                     handler:function(){
                         var selectRow = $('#albumTable').treegrid('getSelected');

                         if(selectRow){
                             var selectRow1 = $('#albumTable').treegrid('getChildren',selectRow.id);
                             if(selectRow1.length==0){
                                 console.log(selectRow.url);
                                 window.location.href="${pageContext.request.contextPath }/album/downloadAudio.do?url="+selectRow.url+"&title="+selectRow.title;
                                 //直接下载


                             }else{
                                 $.messager.alert('提示信息','请选择您要下载的章节！~','warning');
                             }
                         }else{
                             $.messager.alert('提示信息','请选中一个章节！~','warning');
                         }
                     }
                 }
             ],

         });


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
         $('#addAudio').filebox({
             height:30,
             width:200,
             buttonText: '选择文件',
             buttonAlign: 'right',
             required:true
         })

         $('#addChapterForm').form({
             type:'POST',
             url:'${pageContext.request.contextPath }/album/addChapter.do',
             onSubmit:function(){
                 var b =  $('#addChapterForm').form('validate');
                 return b;
             },
             success:function(data){
                 $('#dgAddChapter').dialog('close');
                 $.messager.alert('提示信息','添加成功','info'),
                     $('#t').datagrid('reload');
             },
             ajax:true
         });

         $("#addTitle").textbox({

             height:30,
             width:200,
             prompt:"请输入图片标题",
             type:'text',
             labelAlign:'left',
             required:true,
             validType:'length[2,10]',
             missingMessage:'图片标题不能为空',
             invalidMessage:'部门名称长度在2-10之间'

         });

         $("#addBrodcast").textbox({
             height:30,
             width:200,
             prompt:"请输入播音人",
             required:true,
             validType:'length[3,20]',
             missingMessage:'播音人不能为空',
             invalidMessage:'播音人姓名长度为2-10',
             type:'text'
         });
         $("#addAuthor").textbox({
             height:30,
             width:200,
             prompt:"请输入作者",
             required:true,
             validType:'length[3,20]',
             missingMessage:'作者不能为空',
             invalidMessage:'作者姓名长度为2-10',
             type:'text'
         });
         $("#addBrief").textbox({
             height:30,
             width:200,
             prompt:"请输入专辑简介",
             required:true,
             validType:'length[10,1000]',
             missingMessage:'专辑简介不能为空',
             invalidMessage:'专辑简介长度为10-1000',
             type:'text',
             multiline:true,

         });
         $("#addStatus").textbox({
             height:30,
             width:200,
             prompt:"请输入专辑状态（1代表可用；0代表不可用）",
             required:true,
             validType:'length[1,1]',
             missingMessage:'专辑状态不能为空',
             invalidMessage:'专辑状态为1或0',
             type:'text'
         });
         $('#AddImg').filebox({
             height:30,
             width:200,
             buttonText: '选择文件',
             buttonAlign: 'right',
             required:true
         })

         $('#addAlbumFrom').form({
             url:'${pageContext.request.contextPath }/album/addAlbum.do',
             onSubmit:function(){
                 var b =  $('#addAlbumForm').form('validate');
                 return b;
             },
             success:function(data){
                 $('#dgAddAlbum').dialog('close');
                 $.messager.alert('提示信息','添加成功','info'),
                     $('#albumTable').datagrid('reload');
                 $('#addAlbumFrom').form('clear');

             },
             ajax:true
         });



     })
</script>


</body>
</html>
