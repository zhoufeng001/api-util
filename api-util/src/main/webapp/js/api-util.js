var insert = "insert";
var update = "update";
var saveType = insert ;
var updateRowId ;

var currentApi ;

// -- Header      ---
function newHeader(){
	saveType = insert ;  
	$('#headerKeyValueDialog').dialog('open').dialog('setTitle','新增Header');  
	resetHeaderKeyValueDialog(); 
}

function resetHeaderKeyValueDialog(){ 
	$("#headerKey").textbox("setValue","") ;
	$("#headerValue").textbox("setValue","") ;    
}

function saveHeader(){  
	var kye = $("#headerKey").textbox("getValue") ;
	var value = $("#headerValue").textbox("getValue") ; 
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
		$("#headerKey").textbox("setValue",row.key) ;
		$("#headerValue").textbox("setValue",row.value) ; 
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

// -------      ---


// -- Params  ---------

function newParam(){
	saveType = insert ;  
	$('#paramsKeyValueDialog').dialog('open').dialog('setTitle','新增Param');  
	resetParamKeyValueDialog(); 
}

function resetParamKeyValueDialog(){ 
	$("#paramKey").textbox("setValue","") ;
	$("#paramValue").textbox("setValue","") ;    
}

function saveParam(){  
	var kye = $("#paramKey").textbox("getValue") ;
	var value = $("#paramValue").textbox("getValue") ; 
	$('#paramsKeyValueDialog').dialog('close'); 
	if(saveType === insert){
		$('#paramsTab').datagrid('appendRow',{key:kye,value:value});          
	}else if(saveType === update){
		$('#paramsTab').datagrid('updateRow',
				{
			index:updateRowId,
			row:{key:kye,value:value} 
				}
		);       
	}
}

function editParam(){
	var row = $('#paramsTab').datagrid('getSelected');
	if (row){
		resetParamKeyValueDialog(); 
		$("#paramKey").textbox("setValue",row.key) ;
		$("#paramValue").textbox("setValue",row.value) ; 
		updateRowId = $('#paramsTab').datagrid("getRowIndex",row);
		saveType = update ; 
		$('#paramsKeyValueDialog').dialog('open').dialog('setTitle','编辑Param');
	}
}

function deleteParam(){
	var row = $('#paramsTab').datagrid('getSelected');
	if (row){
		var rowindex = $('#paramsTab').datagrid("getRowIndex",row);
		$('#paramsTab').datagrid("deleteRow",rowindex); 
	}
}


function deleteApi(){
	var currentApi = $("#apiList").combobox('getValue');    
	if(currentApi && currentApi != ""){
		$("#deleteApiDialog").dialog("open"); 
		$("#deleteApiTips").html("确定要删除Api[" + currentApi + "]吗？"); 
	}   
}

function doDeleteApi(){
	var currentApi = $("#apiList").combobox('getValue');    
	if(currentApi && currentApi != ""){
		$.post(
				"api.json",
				{
					method:"deleteTemplate",
					name:currentApi  
				},
				function(result){   
					console.log("删除api" + currentApi + "的结果是：" + result);  
					$("#apiList").combobox('reload');  
					alert("删除模板[" + currentApi + "]" + result);  
				}
		);
	}  
	$("#deleteApiDialog").dialog("close");
}

function saveApi(){
	if(currentApi){
		var currentApiName = currentApi.value;        
		var currentApiGroup = currentApi.group;          
	}
	$("#saveApiName").textbox("setValue",currentApiName);
	$("#saveApiGroup").textbox("setValue",currentApiGroup );
	$("#saveApiDialog").dialog("open") ;  
}

function doSaveApi(){
	var groupValid = $("#saveApiGroup").textbox("isValid");
	var nameValid = $("#saveApiName").textbox("isValid");  
	var urlValid = $("#requestURL").textbox("isValid");  
	if(!groupValid){
		alert("分组不能为空");
		return ;
	}
	if(!nameValid){
		alert("名称不能为空");
		return ;
	}
	if(!urlValid){
		alert("URL不能为空");
		return ;  
	}
	$("#saveApiDialog").dialog("close") ; 
	var api = getApi();
	console.log($.toJSON(api)); 
	$.post(
			"api.json",
			{
				method:"saveTemplate",
				apiJson:$.toJSON(api)
			},
			function(result){    
				console.log("保存模板" + result);
				$("#apiList").combobox('reload');  
				alert("保存模板" + result);  
			}
	);
}     

function sendRequest(){
	var urlValid = $("#requestURL").textbox("isValid");  
	if(!urlValid){
		alert("URL不能为空");
		return; 
	}
	var api = getApi();
	$("#responseSourceCode").html("");
	$("#responseFormatCode").html("");
	$.post(
			"api.json",
			{
				method:"doRequest",
				apiJson:$.toJSON(api)
			},
			function(result){    
				$("#responseSourceCode").text(result);   
				var formatResult = JSON.stringify(eval("(" + result + ")"), null, '\t');   
				formatResult = toHtml(formatResult );  
				$("#responseFormatCode").html(formatResult);  
			}
	);
}

function getApi(){
	var group = $("#saveApiGroup").textbox("getValue");
	var name = $("#saveApiName").textbox("getValue");
	var method = $("#method").combobox('getValue'); 
	var url = $("#requestURL").textbox("getValue");
	var headers = $("#headerTab").datagrid("getRows");  
	var params = $("#paramsTab").datagrid("getRows");
	var api = {    
			method:method,
			url:url,
			headerKeyValues:headers,
			paramsKeyValues:params,
			name :name,
			group:group     
	}; 
	return api ;
}

function initTemplate(api){
	$("#method").combobox('select',api.method);    
	$("#requestURL").textbox("setValue",api.url); 
	$("#headerTab").datagrid('loadData',{total:0,rows:[]}); //清空header
	if(api.headers){
		for(var key in api.headers){   
			$('#headerTab').datagrid('appendRow',{key:key,value:(api.headers)[key]});    
		}  
	} 
	$("#paramsTab").datagrid('loadData',{total:0,rows:[]}); //清空params
	if(api.params){
		for(var key in api.params){  
			$('#paramsTab').datagrid('appendRow',{key:key,value:(api.params)[key]}); 
		}
	}
}  


$(function(){

	$("#apiList").combobox({
		onSelect: function(api){
			currentApi = api ; 
			var apiName = api.value ;
			$.post(
					"api.json",
					{
						method:"getTemplateByName",
						name:apiName
					},
					function(result){  
						console.log(eval("(" + result + ")"));      
						initTemplate(eval("(" + result + ")")) ;   
					}
			);
		} 
	});

	$('#deleteApi').bind('click', function(){
		deleteApi();  
	});


	$('#saveApi').bind('click', function(){
		saveApi();  
	});

	$('#sendRequest').bind('click', function(){
		sendRequest();  
	});



});


function toHtml(str){
	var formatStr = "";
	if(str == null){
		return formatStr ;
	}
	for(var i = 0 ; i < str.length ; i++){
		var c = str.charAt(i);    
		if (c == '\t') 
			formatStr += "&nbsp;&nbsp;&nbsp;&nbsp; ";   
		else if   (c == '\n')   
			formatStr += "<br/>";  
		else if   (c == ' ')
			formatStr += "&nbsp;";   
		else    
			formatStr += c;   
	}
	return formatStr ;  
}
