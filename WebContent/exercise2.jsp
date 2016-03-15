<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*, java.text.*" %>
<%@ page import = "retrieve.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Exercise1</title>
<link rel="stylesheet" href="print.css" type="text/css" >
<script type="text/javascript" src="http://www.amcharts.com/lib/3/amcharts.js"></script>
<script type="text/javascript" src="http://www.amcharts.com/lib/3/serial.js"></script>
<script type="text/javascript" src="http://www.amcharts.com/lib/3/themes/none.js"></script>
<script type="text/javascript" src="http://www.amcharts.com/lib/3/amstock.js"></script>
</head>
<body>

<%
ReadCSV obj = new ReadCSV();
obj.run();
StringBuffer sb = obj.readStringBuffer();
obj.readBuffer();
%>

<div id="chartdiv" style="width: 100%; height: 355px;"></div>
<FORM NAME="form1" METHOD="POST">
            <INPUT TYPE="HIDDEN" NAME="buttonCHO">
            <INPUT TYPE="BUTTON" VALUE="buttonCHO" ONCLICK="generateChartData()">
            
        </FORM>
        
<script>
var number = <%=sb.toString()%>;
var minutes = 1000 * 60;
var hours = minutes * 60;
var days = hours * 24;
var years = days * 365;
var chartData = generateChartData();

function generateChartData() {
	var chartData = [];
	var d = new Date();
	  var firstDate = new Date( d.getFullYear(), d.getMonth(), d.getDate());
	  firstDate.setDate( firstDate.getDate());
	firstDate.setHours( 0, 0, 0, 0 );

  for ( var i = 0; i < 1000; i++ ) {
    var newDate = new Date( firstDate );
    newDate.setHours( 0, i, 0, 0 );

    var a = number[i];
    //var b = Math.round( Math.random() * 100000000 );

    chartData.push( {
      date: newDate,
      value: a,
      //volume: b
    } );
  }
  return chartData;
}

function addDataPoint(){
	var dataProvider = chart.dataSets[0].dataProvider;
	var newDate = new Date(dataProvider)
}

var chart = AmCharts.makeChart( "chartdiv", {

  type: "stock",
  "theme": "light",
                   
  categoryAxesSettings: {
    minPeriod: "mm"
  },

  dataSets: [ {
    color: "#b0de09",
    fieldMappings: [ {
      fromField: "value",
      toField: "value"
    } ],

    dataProvider: chartData,
    categoryField: "date"
  } ],


  panels: [ {
      showCategoryAxis: false,
      title: "Value",
      percentHeight: 70,

      stockGraphs: [ {
        id: "g1",
        valueField: "value",
        type: "smoothedLine",
        lineThickness: 2,
        bullet: "round"
      } ],


      stockLegend: {
        valueTextRegular: " ",
        markerType: "none"
      }
    },
    ]
});


</script>

</body>
</html>