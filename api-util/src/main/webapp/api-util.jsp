<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="./css/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="./css/themes/icon.css">
<link rel="stylesheet" type="text/css" href="./css/themes/color.css">
<link rel="stylesheet" type="text/css" href="./css/api-util.css">  
<script type="text/javascript" src="./js/jquery.min.js"></script> 
<script type="text/javascript" src="./js/jquery.easyui.min.js"></script>
<title>Insert title here</title>
</head>  

<body>
	<script type="text/javascript" src="./js/api-util.js"></script>
	<div id="loading" style="position: absolute; z-index: 1000; top: 0px; left: 0px; width: 100%; height: 100%; background: #DDDDDB; text-align: center; padding-top: 20%;"></div> 
	<span class="lab">Api：</span>
	<input class="easyui-combotree" data-options="url:'tree_data1.json',method:'get',required:true" style="width:200px;">
	<span class="lab"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存模板</a></span>
	<br/><br/>
	
	<!-- Header start -->
	<div class="header_div">
		<table id="headerTab" title="Header" class="easyui-datagrid" style="width:400px;height:250px" 
	            toolbar="#headerToolbar"   
	            rownumbers="true" fitColumns="true" singleSelect="true">
	        <thead>
	            <tr>
	                <th field="key" width="50">key</th>
	                <th field="value" width="50">value</th>
	            </tr>
	        </thead>
	    </table>
	   <div id="headerToolbar">
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newHeader()">新增</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editHeader()">编辑</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteHeader()">删除</a>
	   </div>  
	  <div id="headerKeyValueDialog" class="easyui-dialog" style="width:350px;height:200px;padding:10px 20px" 
	  		closed="true" buttons="#headerKeyValueDialog-buttons"  resizable="true"  modal="true"> 
	        <div class="ftitle">Header</div> 
	        <div class="fitem">
	             <label>Key:</label> 
	             <input name="key" class="easyui-textbox" required="true" id="key">   
	        </div>
	        <div class="fitem">
	             <label>Value:</label>
	             <input name="value" class="easyui-textbox" required="false" id="value"> 
	         </div>
	    </div>
	    <div id="headerKeyValueDialog-buttons">
	        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveHeader()" style="width:90px">Save</a> 
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#headerKeyValueDialog').dialog('close')" style="width:90px">Cancel</a>
	    </div>
    </div>
    <!-- Header end -->
    
    
    <!-- Params start -->
	<div class="params_div">
		<table id="paramsTab" title="Params" class="easyui-datagrid" style="width:400px;height:250px" 
	            toolbar="#paramsToolbar"   
	            rownumbers="true" fitColumns="true" singleSelect="true">
	        <thead>
	            <tr>
	                <th field="key" width="50">key</th>
	                <th field="value" width="50">value</th>
	            </tr>
	        </thead>
	    </table>
	   <div id="paramsToolbar">
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newHeader()">新增</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editHeader()">编辑</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteHeader()">删除</a>
	   </div>  
	  <div id="paramsKeyValueDialog" class="easyui-dialog" style="width:350px;height:200px;padding:10px 20px" 
	  		closed="true" buttons="#paramsKeyValueDialog-buttons"  resizable="true"  modal="true"> 
	        <div class="ftitle">Params</div> 
	        <div class="fitem">
	             <label>Name:</label> 
	             <input name="key" class="easyui-textbox" required="true" id="key">   
	        </div>
	        <div class="fitem">
	             <label>Value:</label>
	             <input name="value" class="easyui-textbox" required="false" id="value"> 
	         </div>
	    </div>
	    <div id="paramsKeyValueDialog-buttons">
	        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveHeader()" style="width:90px">Save</a> 
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#paramsKeyValueDialog').dialog('close')" style="width:90px">Cancel</a>
	    </div>
    </div>
    <!-- Params end -->
    <script type="text/javascript">
	    function show(){
	        $("#loading").fadeOut("normal", function(){
	             $(this).remove();
	         });
	     }      
	     var delayTime;
	     $.parser.onComplete = function(){
	         if(delayTime) 
	             clearTimeout(delayTime);
	         delayTime = setTimeout(show,500); 
	     }
    </script>
</body>

</html> 