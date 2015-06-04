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
    
    
</body>

<script type="text/javascript">
	
	var insert = "insert";
	var update = "update";
	var saveType = insert ;
	var updateRowId ;

	function newHeader(){
		  saveType = insert ;  
		  $('#headerKeyValueDialog').dialog('open').dialog('setTitle','新增Header');  
		  resetHeaderKeyValueDialog(); 
	}
	
	function resetHeaderKeyValueDialog(){ 
		$("#key").textbox("setValue","") ;
		$("#value").textbox("setValue","") ;    
	}
	
	function saveHeader(){  
	    var kye = $("#key").textbox("getValue") ;
	    var value = $("#value").textbox("getValue") ; 
	    $('#headerKeyValueDialog').dialog('close'); 
	    if(saveType === insert){
	        $('#headerTab').datagrid('appendRow',{key:kye,value:value});          
	    }else if(saveType === update){
	    	$('#headerTab').datagrid('updateRow',
    			{
    				index:updateRowId,
    				row:{key:kye,value:value} 
    			}
	    	);       
	    }
	}
	
	function editHeader(){
		var row = $('#headerTab').datagrid('getSelected');
	    if (row){
	    	 resetHeaderKeyValueDialog(); 
	    	 $("#key").textbox("setValue",row.key) ;
	    	 $("#value").textbox("setValue",row.value) ; 
	    	 updateRowId = $('#headerTab').datagrid("getRowIndex",row);
	    	 saveType = update ; 
	    	 $('#headerKeyValueDialog').dialog('open').dialog('setTitle','编辑Header');
	    }
	}
  
	function deleteHeader(){
		var row = $('#headerTab').datagrid('getSelected');
	    if (row){
	    	var rowindex = $('#headerTab').datagrid("getRowIndex",row);
	    	$('#headerTab').datagrid("deleteRow",rowindex); 
	    }
	}
	
	
</script>

</html> 