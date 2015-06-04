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
<script type="text/javascript" src="./js/api.js"></script>  
<title>Api调试工具</title>  
</head>  
<body>
<div class="easyui-layout" style="width:1300px;height:600px;"> 
   <div data-options="region:'north'" style="height:50px">
   		<center><h1>Api调试工具</h1></center> 
   </div>  
   <div data-options="region:'west',split:true" title="接口索引" style="width:200px;">
   		<ul class="easyui-tree" id="apiTree">
            <li>
                <span>My Documents</span>
                <ul>
                    <li data-options="state:'closed'">
                        <span>Photos</span>
                        <ul>
                            <li>
                                <span>Friend</span>
                            </li>
                            <li>
                                <span>Wife</span>
                            </li>
                            <li>
                                <span>Company</span>  
                            </li>
                        </ul>  
                    </li>
                    <li>
                        <span>Program Files</span>
                        <ul>
                            <li>Intel</li>
                            <li>Java</li>
                            <li>Microsoft Office</li>
                            <li>Games</li>
                        </ul>
                    </li>
                    <li>index.html</li>
                    <li>about.html</li>
                    <li>welcome.html</li>
                </ul>
            </li>
        </ul>
   </div>  
   <div data-options="region:'center',title:'接口调试',iconCls:'icon-man'">
       <div class="easyui-tabs" style="width:1000px;height:500px" id="apiTabs">    
	        <div title="接口调试介绍" style="padding:10px">      
	            <p style="font-size:14px">未经允许不得私自传播</p>       
	            <ul>
	                <li>easyui is a collection of user-interface plugin based on jQuery.</li>
	                <li>easyui provides essential functionality for building modem, interactive, javascript applications.</li>
	                <li>using easyui you don't need to write many javascript code, you usually defines user-interface by writing some HTML markup.</li>
	                <li>complete framework for HTML5 web page.</li>
	                <li>easyui save your time and scales while developing your products.</li>
	                <li>easyui is very easy but powerful.</li>
	            </ul> 
	        </div>
	        <div title="Help" data-options="iconCls:'icon-help',closable:true" style="padding:10px">
	            This is the help content.  
	        </div>
	    </div>
    </div>
</div>


</html> 