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
