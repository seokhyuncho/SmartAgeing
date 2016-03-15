<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*, java.text.*" %>
<%@ page import = "retrieve.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Stock Chart</title>
<link rel="stylesheet" href="print.css" type="text/css" >
<script type="text/javascript" src="http://www.amcharts.com/lib/3/amcharts.js"></script>
<script type="text/javascript" src="http://www.amcharts.com/lib/3/serial.js"></script>
<script type="text/javascript" src="https://www.amcharts.com/lib/3/themes/light.js"></script>
<script type="text/javascript" src="https://www.amcharts.com/lib/3/amstock.js"></script>
</head>
<body>
<%
ReadCSV obj1 = new ReadCSV();
obj1.run();
StringBuffer sb1 = obj1.readStringBuffer1();
StringBuffer sb2 = obj1.readStringBuffer2();
StringBuffer sb3 = obj1.readStringBuffer3();
StringBuffer sb4 = obj1.readStringBuffer4();
obj1.readBuffer1();
obj1.readBuffer2();
obj1.readBuffer3();
obj1.readBuffer4();
%>

<div id="chartdiv" style="width: 100%; height: 355px;"></div>


<script>
var chartData1 = [];
var chartData2 = [];
var chartData3 = [];
var chartData4 = [];
var number1  = <%=sb1.toString()%>;
var number2  = <%=sb2.toString()%>;
var number3  = <%=sb3.toString()%>;
var number4  = <%=sb4.toString()%>;


var minutes = 1000 * 60;
var hours = minutes * 60;
var days = hours * 24;
var years = days * 365;
var i=2;

var chartData = generateChartData();

function generateChartData() {
	var d = new Date();
	  var firstDate = new Date( d.getFullYear(), d.getMonth(), d.getDate());
	  firstDate.setDate( firstDate.getDate());
	firstDate.setHours(0, 0, 0, 0);
  /* var firstDate = new Date( d.getFullYear(), d.getMonth(), d.getDate());
  firstDate.setDate( firstDate.getDate());
	firstDate.setHours(0, 0, 0, 0); */
	//alert(firstDate);
  for ( var i = 0; i < 200; i++ ) {
    var newDate = new Date( firstDate );
    //newDate.setDate( newDate.getDate() + i );
    newDate.setHours(0, i, 0, 0);
    //alert(newDate);
    

    var a1 = number1[i+2];
    //alert(a1);
    //var a1 = Math.round( Math.random() * ( 40 + i ) ) + 100 + i;
    var b1 = Math.round( Math.random() * ( 1000 + i ) ) + 500 + i * 2;

    var a2 = number2[i+2];
    //var a2 = Math.round( Math.random() * ( 100 + i ) ) + 200 + i;
    var b2 = Math.round( Math.random() * ( 1000 + i ) ) + 600 + i * 2;

    var a3 = number3[i+2]; 
    //var a3 = Math.round( Math.random() * ( 100 + i ) ) + 200;
    var b3 = Math.round( Math.random() * ( 1000 + i ) ) + 600 + i * 2;

    var a4 = number4[i+2];
    //var a4 = Math.round( Math.random() * ( 100 + i ) ) + 200 + i;
    var b4 = Math.round( Math.random() * ( 100 + i ) ) + 600 + i;

    chartData1.push( {
      date: newDate,
      value: a1,
      volume: b1
    } );
    chartData2.push( {
      date: newDate,
      value: a2,
      volume: b2
    } );
    chartData3.push( {
      date: newDate,
      value: a3,
      volume: b3
    } );
    chartData4.push( {
      date: newDate,
      value: a4,
      volume: b4
    } );
  }
}

function addDataPoint(i) {
    var dataProvider1 = chart.dataSets[0].dataProvider;
    var dataProvider2 = chart.dataSets[1].dataProvider;
    var dataProvider3 = chart.dataSets[2].dataProvider;
    var dataProvider4 = chart.dataSets[3].dataProvider;
	var newDate1 = new Date(dataProvider1[dataProvider1.length-1].date.getTime());
	var newDate2 = new Date(dataProvider2[dataProvider2.length-1].date.getTime());
	var newDate3 = new Date(dataProvider3[dataProvider3.length-1].date.getTime());
	var newDate4 = new Date(dataProvider4[dataProvider4.length-1].date.getTime());
	newDate1.setHours(newDate1.getHours(), newDate1.getMinutes() + 1, newDate1.getSeconds());
	newDate2.setHours(newDate2.getHours(), newDate2.getMinutes() + 1, newDate2.getSeconds());
	newDate3.setHours(newDate3.getHours(), newDate3.getMinutes() + 1, newDate3.getSeconds());
	newDate4.setHours(newDate4.getHours(), newDate4.getMinutes() + 1, newDate4.getSeconds());

	//var i=4;
	
	var a1 = number1[i];//Math.round(Math.random() * (0.05)) + (Math.random() * 1) - (Math.random() * 1);
	var a2 = number2[i];//Math.round(Math.random() * (0.05)) + (Math.random() * 1) - (Math.random() * 1);
	var a3 = number3[i];//Math.round(Math.random() * (0.05)) + (Math.random() * 1) - (Math.random() * 1);
	var a4 = number4[i];//Math.round(Math.random() * (0.05)) + (Math.random() * 1) - (Math.random() * 1);	
	var b = Math.round(Math.random() * (0.05)) + (Math.random() * 3) - (Math.random() * 3);
    dataProvider1.push({
        date: newDate1,
        value: a1,
        volume: b
    });
    dataProvider2.push({
        date: newDate2,
        value: a2,
        volume: b
    });
    dataProvider3.push({
        date: newDate3,
        value: a3,
        volume: b
    });
    dataProvider4.push({
        date: newDate4,
        value: a4,
        volume: b
    });
    dataProvider1.shift();
    dataProvider2.shift();
    dataProvider3.shift();
    dataProvider4.shift();
    
}



var chart = AmCharts.makeChart( "chartdiv", {
  type: "stock",
  "theme": "light",  
  glueToTheEnd: true,

  categoryAxesSettings: {
		minPeriod: "mm"
	},
  dataSets: [ {
      title: "first data set",
      fieldMappings: [ {
        fromField: "value",
        toField: "value"
      }, {
        fromField: "volume",
        toField: "volume"
      } ],
      dataProvider: chartData1,
      categoryField: "date"
    },

    {
      title: "second data set",
      fieldMappings: [ {
        fromField: "value",
        toField: "value"
      }, {
        fromField: "volume",
        toField: "volume"
      } ],
      dataProvider: chartData2,
      categoryField: "date"
    },

    {
      title: "third data set",
      fieldMappings: [ {
        fromField: "value",
        toField: "value"
      }, {
        fromField: "volume",
        toField: "volume"
      } ],
      dataProvider: chartData3,
      categoryField: "date"
    },

    {
      title: "fourth data set",
      fieldMappings: [ {
        fromField: "value",
        toField: "value"
      }, {
        fromField: "volume",
        toField: "volume"
      } ],
      dataProvider: chartData4,
      categoryField: "date"
    }
  ],

  panels: [ {

      showCategoryAxis: false,
      recalculateToPercents: "never",
      title: "Value",
      percentHeight: 70,

      stockGraphs: [ {
        id: "g1",
        valueField: "value",
        comparable: true,
        compareField: "value",
        compareFromStart: true,
        compareGraphBalloonText: "value",
        //compareGraphBullet: "round",
        //compareGraphType: "smoothedLine",
        compareGraphVisibleInLegend: true,
        balloonText: "[[title]]:<b>[[value]]</b>",
        compareGraphBalloonText: "[[title]]:<b>[[value]]</b>"
		//bullet: "round"
      } ],

      stockLegend: {
    	 // valueTextRegular: " ",
			//markerType: "none",
			//valueTextComparing: "[[value]]"
        periodValueTextComparing: "[[average.value.open]]%",
        periodValueTextRegular: "[[value.close]]"
      },
  
  
  valueAxes: [{
      guides: [{
          value: 1100,
          label: "",
          position: "right",
          dashLength: 5
      }, {
          value: 1550,
          label: "",
          position: "right",
          dashLength: 5
      }]
  }],
    },
    
    

     /* {
      title: "Volume",
      percentHeight: 30,
      stockGraphs: [ {
        valueField: "volume",
        type: "column",
        showBalloon: false,
        fillAlphas: 1
      } ], 


      stockLegend: {
        periodValueTextRegular: "[[value.close]]"
      }
    } */
  ],

  chartScrollbarSettings: {
    graph: "g1",
	usePeriod: "10mm",
	position: "bottom"
    
  },

  chartCursorSettings: {
    valueBalloonsEnabled: true,
    fullWidth: true,
    cursorAlpha: 0.1,
    valueLineBalloonEnabled: true,
    valueLineEnabled: true,
    valueLineAlpha: 0.5
  },

  periodSelector: {
    position: "left",
    dateFormat: "YYYY-MM-DD JJ:NN",
	inputFieldWidth: 150,
    periods: [{
		period: "hh",
		count: 1,
		label: "1 hour",
		selected: true

	}, {
		period: "hh",
		count: 2,
		label: "2 hours"
	}, {
		period: "hh",
		count: 5,
		label: "5 hour"
	}, {
		period: "hh",
		count: 12,
		label: "12 hours"
	},
	{
		period: "MAX",
		label: "MAX"
	}]
  },

  panelsSettings: {
		usePrefixes: true
	},
	
  dataSetSelector: {
    position: "left"
  },
  "export": {
    "enabled": true
  }
} );

setInterval(function () {
    // add data point
    
    if(i>202)
    	i=2;
    addDataPoint(i);
    i++;
    
    	
    // update indictors
    chart.panels[0].valueAxes[0].guides[0].value = 0;//Math.round(Math.random() * 5) + 1;
    chart.panels[0].valueAxes[0].guides[1].value = chart.panels[0].valueAxes[0].guides[0].value + Math.round(Math.random() * 400) + 200;
    
    chart.validateData();
}, 2000);
</script>


</body>
</html>