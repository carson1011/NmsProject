/*********************************************************Clock**********************************************************/
var clockTarget = document.getElementById("clock");
function clock() {
    var date = new Date();
    var month = date.getMonth();
    var clockDate = date.getDate();
    var day = date.getDay();
    var week = ['일', '월', '화', '수', '목', '금', '토'];   
    
    var hours = date.getHours();
    var minutes = date.getMinutes();
    var seconds = date.getSeconds();
    
    hours = (hours<10)?'0'+hours:hours;
    minutes = (minutes<10)?'0'+minutes:minutes;
    seconds = (seconds<10)?'0'+seconds:seconds;
    
    clockTarget.innerText = (month+1)+'월 '+clockDate+'일 ('+week[day]+') '+hours+':'+minutes+':'+seconds;

    if(seconds == "00"){
    	// 매분마다 출입시간 체크
    	/*console.log(entTimeArr);
    	EntryTime(entTimeArr,arrLowMap);*/
    }
}

function clockinit() {
	clock();
	setInterval(clock, 1000);
}
clockinit();