let sp1 = document.getElementById("dayNtotal").value.split("{",2)[1]
let sp2 = sp1.split("}",2)[0]
let dayNtotal = sp2.split(", ")

//jsp에서 넘어온 요일-요일매출을 각각 배열에 담음
let arrD = new Array();
let arrT = new Array();
for(i=0;i<dayNtotal.length;i++){
	arrD[i] = dayNtotal[i].split("=")[0]
	arrT[i] = dayNtotal[i].split("=")[1]
}

//오늘 ~ 7일전까지 요일 출력
let toDay = new Date();
let y = new Array(7);
y.fill(0);
for(j = 0; j <=arrD.length; j++){
	let d = arrD[j]
	if(toDay.getDay()<d){
		
	}
	else{
		switch(d){
		case '0' :
			y[0] = arrT[j]
			break;	
		case '1' :
			y[1] = arrT[j]
			break;	
		case '2' :
			y[2] = arrT[j]
			break;	
		case '3' :
			y[3] = arrT[j]
			break;	
		case '4' :
			y[4] = arrT[j]
			break;			
		case '5' :
			y[5] = arrT[j]
			break;	
		case '6' :
			y[6] = arrT[j]
			break;														
 	 }
	} 
 }

document.addEventListener('DOMContentLoaded', function() {
	'use strict'
  // Graphs
  const ctx = document.getElementById('myChart')
  // eslint-disable-next-line no-unused-vars
  const myChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: ['일','월','화','수','목','금','토'],
      datasets: [
      {
        data: y,
        lineTension: 0,
        backgroundColor: 'transparent',
        borderColor: 'rgb(100, 50, 200,0.7)',
        borderWidth: 4,
        pointBackgroundColor: 'rgb(100, 50, 200)',
      }
      ]
    },
    options: {
      legend: {
        display: false
      }
    }
  })
})
