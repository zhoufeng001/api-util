
$(function(){
	
	var tabs = new Array() ;
	
	var $apiTree = $("#apiTree");
	var $apiTabs = $("#apiTabs");
	
	$apiTree.tree({
		onClick:function(apiNode){
			console.log(apiNode);
			if($apiTree.tree("isLeaf",apiNode.target)){
				openTab(apiNode);
			}
		}
	});
	
	function openTab(apiNode){
		$apiTabs.tabs("add",{
			title:apiNode.text,
			selected:true,
			href:"api-util.jsp",
			width:"1000px",
			height:"600px",
			collapsible:"true",
			closable:true
			    
		});
	}
	
	
});    


