<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="./api_css/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="./api_css/themes/icon.css">
<link rel="stylesheet" type="text/css" href="./api_css/themes/color.css">
<link rel="stylesheet" type="text/css" href="./highlight/Styles/SyntaxHighlighter.css">
<link rel="stylesheet" type="text/css" href="./api_css/api-util.css">  
<script type="text/javascript" src="./api_js/jquery.min.js"></script> 
<script type="text/javascript" src="./api_js/jquery.easyui.min.js"></script>  
<script type="text/javascript" src="./api_js/jquery.json.min.js"></script>    
<script type="text/javascript" src="./highlight/Scripts/shCore.js"></script> 
<script type="text/javascript" src="./highlight/Scripts/shBrushJScript.js"></script>   
<script type="text/javascript" src="./api_js/jsonformat.js"></script>
<script type="text/javascript" src="./api_js/api-util.js"></script>
<title>Api调试工具</title>
</head>    

<body>
	
	<div id="loading" style="position: absolute; z-index: 1000; top: 0px; left: 0px; width: 100%; height: 100%; background: #DDDDDB; text-align: center; padding-top: 20%;"></div> 
	<span class="lab">Api：</span>
	<input id="apiList" class="easyui-combobox" name="api" style="width:50%"
            data-options="
                url: 'api.json?method=getAllTemplates',   
                method: 'get',    
                valueField:'value',
                textField:'text',
                groupField:'group'"> 
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" id="deleteApi">删除模板</a>  
	<br/><br/><hr/>    
	
	<span class="lab">Method：</span>
	<select class="easyui-combobox" name="state" style="width:80px;" id="method">
        <option value="get">Get</option> 
        <option value="post">Post</option>   
    </select>  
	<span class="lab">URL：</span>
	<input name="value" class="easyui-textbox" required="false" id="requestURL" style="width: 400px;">     
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" id="sendRequest">发送请求</a>  
    <span class="lab"><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" id="saveApi">保存模板</a></span>  
    <br/><br/>
	
	<!-- Header start -->
	<div class="header_div">
		<table id="headerTab" title="Header" class="easyui-datagrid" style="width:400px;height:200px" 
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
	             <input name="key" class="easyui-textbox" required="true" id="headerKey">   
	        </div>
	        <div class="fitem">
	             <label>Value:</label>
	             <input name="value" class="easyui-textbox" required="false" id="headerValue"> 
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
		<table id="paramsTab" title="Params" class="easyui-datagrid" style="width:400px;height:200px" 
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
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newParam()">新增</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editParam()">编辑</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteParam()">删除</a>
	   </div>  
	  <div id="paramsKeyValueDialog" class="easyui-dialog" style="width:350px;height:200px;padding:10px 20px" 
	  		closed="true" buttons="#paramsKeyValueDialog-buttons"  resizable="true"  modal="true"> 
	        <div class="ftitle">Params</div> 
	        <div class="fitem">
	             <label>Name:</label> 
	             <input name="key" class="easyui-textbox" required="true" id="paramKey">   
	        </div>
	        <div class="fitem">
	             <label>Value:</label>  
	             <input name="value" class="easyui-textbox" required="false" id="paramValue"> 
	         </div>
	    </div>
	    <div id="paramsKeyValueDialog-buttons">
	        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveParam()" style="width:90px">Save</a> 
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#paramsKeyValueDialog').dialog('close')" style="width:90px">Cancel</a>
	    </div>
    </div>
    
    <div id="responseSource" class="easyui-panel" title="响应内容" style="width:1000px;padding:10px;">    
    	<div id="responseSourceCode"></div>   
     </div>
      
    <div id="responseFormat" class="easyui-panel" title="响应内容(格式化后)" style="width:1000px;padding:10px;">  
        <div id="responseFormatCode"></div>
     </div>  
    <!-- Params end -->
    
    <!-- DeleteApiDialog -->
     <div id="deleteApiDialog" class="easyui-dialog" title="删除Api" style="width:400px;height:200px;padding:10px" closed="true"  resizable="true"  modal="true"
            data-options="
                iconCls: 'icon-delete', 
                buttons: '#deleteApiDialogButs' 
            "> 
            <p id="deleteApiTips"></p>
    </div>
    <div id="deleteApiDialogButs">  
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:doDeleteApi()">删除</a>  
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#deleteApiDialog').dialog('close')">取消</a> 
    </div>
    <!--  -->
    
    <!-- SaveApiDialog -->
     <div id="saveApiDialog" class="easyui-dialog" title="保存Api模板" style="width:400px;height:200px;padding:10px" closed="true"  resizable="true"  modal="true"
            data-options="
                iconCls: 'icon-delete', 
                buttons: '#saveApiDialogButs' 
            "> 
	        <div class="fitem">
	             <label>分组:</label> 
	             <input name="key" class="easyui-textbox" required="true" id="saveApiGroup">   
	        </div> 
	        <div class="fitem">
	             <label>名称:</label>   
	             <input name="value" class="easyui-textbox" required="false" id="saveApiName"> 
	         </div> 
    </div>
    <div id="saveApiDialogButs">    
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:doSaveApi()">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#saveApiDialog').dialog('close')">取消</a> 
    </div>
    
     <div id="requestProgressDialog" class="easyui-dialog" title="正在请求..."   
   		  style="width:300px;height:180px;padding:10px" closed="true"  resizable="false"  modal="true"
          >
	      <center><img src="api_img/loading.gif" /></center>  
    </div>  
    
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