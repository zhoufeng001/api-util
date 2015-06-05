	var insert = "insert";
	var update = "update";
	var saveType = insert ;
	var updateRowId ;
	
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
	
	