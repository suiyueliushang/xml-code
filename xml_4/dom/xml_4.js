function bianli(x){
	if (x.nodeType==3){
		document.write(x.nodeName+": "+x.nodeValues+"<br/>");
		return;
	}
	else{
		document.write(x.nodeName+": "+"<br/>");
		var y=x.childNodes;
		for(i=0;i<y.length;i++){
			document.write(y[i].nodeName+": "+y[i].nodeValues+"<br/>");
			bianli(y[i]);
		}
	}
}


xmlDoc=loadXMLDoc("team_detail.xml");
//string=scanXml(xmlDoc.documentElement,"",0);
//document.write(string);

function scan(node,level){
	currentXml=""
	switch(node.nodeType){
		case 1:
			currentXml+="-".repeat(level)+node.nodeName+"<br/>";
			if(node.hasChildNodes()){
				var nodelist=node.childNodes;
				for(i=0;i<nodelist.length;i++){
					scan(nodelist[i],++level);
				}
			}
			else{
				currentXml+="空的元素<br/>";
			}
			break;
		case 3:
			currentXml+=' '.repeat(level)+node.nodeValue+":<br/>"
			break;
		default:
			break;
	}
	return xml+currentXml;
}
function scanXml(xmlNode, xml, level){
	var currXml = '';
	var currLevel = level + 1;  
	//alert( xmlNode.nodeType + ":" + xmlNode.nodeName );
	//nodeType 此属性只读且传回一个数值。有效的数值符合以下的型别： 
	switch( xmlNode.nodeType ){
	case 1: //-ELEMENT
		currXml += "| ".repeat(level) + xmlNode.nodeName+"<br/>";
		if(xmlNode.hasChildNodes()){
			var nodeList =xmlNode.childNodes;
			for(var i=0;i<nodeList.length;i++){
					currXml = scanXml(nodeList[i], currXml, currLevel);
			}
		}
		else{
			currXml+="空的元素<br/>"
		}
		break;
	case 2: break;//-ATTRIBUTE 
	case 3: //-TEXT      
	if(!new RegExp(/^[\s]+$/).test(xmlNode.nodeValue))
			currXml = "| ".repeat(level) + xmlNode.nodeValue+ "<br/>";
		break;
	case 4: break;//-CDATA 
	case 5: break;//-ENTITY REFERENCE 
	case 6: break;//-ENTITY 
	case 7: break;//-PI (processing instruction) 
	case 8: break;//-COMMENT 
	case 9: break;//-DOCUMENT 
	case 10: break;//-DOCUMENT TYPE 
	case 11: break;//-DOCUMENT FRAGMENT 
	case 12: break;//-NOTATION 
	default:
	}
	return xml + currXml;
}
var chart_config = {
	chart: {
		container: "#OrganiseChart-big-commpany",
		levelSeparation: 45,

		rootOrientation: "WEST",

		nodeAlign: "BOTTOM",

		connectors: {
			type: "step",
			style: {
				"stroke-width": 2
			}
		},
		node: {
			HTMLclass: "big-commpany"
		}
	},

}

function loadXMLDoc(dname)
{
	if (window.XMLHttpRequest)
	{
		xhttp=new XMLHttpRequest();
	}
	else
	{
		xhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xhttp.open("GET",dname,false);
	xhttp.send();
	return xhttp.responseXML;
}

function loadXMLString(txt) 
{
	if (window.DOMParser)
	{
		parser=new DOMParser();
		xmlDoc=parser.parseFromString(txt,"text/xml");
	}
	else 
	{
		// Internet Explorer
		xmlDoc=new ActiveXObject("Microsoft.XMLDOM");
		xmlDoc.async=false;
		xmlDoc.loadXML(txt); 
	}
	return xmlDoc;
}

function button1_click(){
	
	var t1=document.getElementById("selector").value;
	var t2=document.getElementById("value").value;
	if(t1!=""&&t2!=""){
		xmlDoc.getElementsByTagName(t1)[0].childNodes[0].nodeValue=t2;
		var t3=document.getElementById("main_div");
		t3.innerHTML=scanXml(xmlDoc.documentElement,"",0);
	}
}
function button2_click(){
	
	var t1=document.getElementById("selector").value;
	var t2=document.getElementById("value2").value;
	if(t1!=""&&t2!=""){
		xmlDoc.getElementsByTagName(t1)[0].setAttribute()=t2;
		var t3=document.getElementById("main_div");
		t3.innerHTML=scanXml(xmlDoc.documentElement,"",0);
	}
}
function button3_click(){
	
	var t1=document.getElementById("selector3").value;
	var t2=document.getElementById("value3").value;
	if(t1!=""&&t2!=""){
		
		newel=xmlDoc.createElement(t1);
		newtext=xmlDoc.createTextNode(t2);
		newel.appendChild(newtext);
		old=xmlDoc.getElementsByTagName(t1)[0];
		xmlDoc.documentElement.insertBefore(newel,old);
		//xmlDoc.getElementsByTagName(t1)[0].parentNode.lastChild.childNodes[0].nodeValue=t2;
		var t3=document.getElementById("main_div");
		t3.innerHTML=scanXml(xmlDoc.documentElement,"",0);
	}
}
function button4_click(){
	var t1=document.getElementById("r1").checked;
	var t2=document.getElementById("r2").checked;
	var t3=document.getElementById("r3").checked;
	var t;
	if(t1==true){
		t='animeName'
	}
	else if (t2==true){
		t="totalEpisodes";
	}
	else if(t3==true){
		t="vv";
	}
	list=sort(t);
	var t4=document.getElementById("main_div");
	str=new String("");
	animation_name=xmlDoc.getElementsByTagName("animeName");
	res=xmlDoc.getElementsByTagName(t)
	list=[12,13,11,17,10,0,1,3,4,6,7,8,9,15,16,14,2,5,19,18];
	for(i=0;i<list.length;i++)
	{
		str+="animeName: "+animation_name[list[i]].childNodes[0].nodeValue+"<br/>";
		str+=t+": "+res[list[i]].childNodes[0].nodeValue+"<br/>";
	}
	t4.innerHTML=str;
} 
function sort(x){
	var nodelist=xmlDoc.getElementsByTagName(x);
	newXml=xmlDoc;
	var list=new Array();
	l=nodelist.length
	for(i=0;i<l;i++){
		var tem=0;
		min=nodelist[0].childNodes[0].nodeValue
		for(j=i+1;j<nodelist.length;j++){
			if(nodelist[j].childNodes[0].nodeValue<min){
				tem=j;
				min=nodelist[j].childNodes[0].nodeValue;
				
			}
		}
		list.push(tem);
		//newXml.documentElement.replaceChild(xmlDoc.documentElement.childNodes[tem],newXml.documentElement.childNodes[i]);
		nodelist[tem].parent.removeChild(nodelist[tem]);
		// if(tem!=i){
		// 	var node1=nodelist[tem];
		// 	var node2=nodelist[i];
		// 	nodelist[i]=node1
		// 	nodelist[tem]=node2
			
		// }

	}
	return list

}