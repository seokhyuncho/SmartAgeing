<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.io.*" %>
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
            <INPUT TYPE="HIDDEN" NAME="buttonName">
            <INPUT TYPE="BUTTON" VALUE="Button 1" ONCLICK="generateChartData()">
            
        </FORM>
        
<script>
var chartData = generateChartData();

function generateChartData() {
  var chartData = [];
  var firstDate = new Date( 2012, 0, 1 );
  firstDate.setDate( firstDate.getDate() - 1000 );
  firstDate.setHours( 0, 0, 0, 0 );

  for ( var i = 0; i < 1000; i++ ) {
    var newDate = new Date( firstDate );
    newDate.setHours( 0, i, 0, 0 );

    var a = Math.round( Math.random() * ( 40 + i ) ) + 100 + i;
    var b = Math.round( Math.random() * 100000000 );

    chartData.push( {
      date: newDate,
      value: a,
      volume: b
    } );
  }
  return chartData;
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
    }, {
      fromField: "volume",
      toField: "volume"
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

    {
      title: "Volume",
      percentHeight: 30,
      stockGraphs: [ {
        valueField: "volume",
        type: "colume"}],
  "export": {
    "enabled": true,
    "position": "bottom-right"
  }
    }
    ]
});


</script>

</body>
</html>