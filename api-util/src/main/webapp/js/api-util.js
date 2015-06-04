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
	