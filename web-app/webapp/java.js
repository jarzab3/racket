
 var count = 0;
  var count1 = 0;
 
 
function countup(){
  var button = document.getElementById("countButton1");
  var display = document.getElementById("displayCount1");
  
 if (count < 23){
     count++;
     }
     else if  (count > 22){
  count = -1;
   count++;
   }
     
     if (count < 10){
     display.innerHTML = ("0" + count);
     }
  else if (count > 9){display.innerHTML = count;
     }   
  }
  
  
function countdown(){

  var button = document.getElementById("countButton2");
  var display = document.getElementById("displayCount1");
  
  
   if (count > 0){
     count--;
     }
     else if  (count < 1){
  count = 24;
   count--;
   }
     
     if (count < 10){
     display.innerHTML = ("0" + count);
     }
  else if (count > 9){display.innerHTML = count;
     }   
  }
  
  
  
  function countup1(){
  var button = document.getElementById("countButton3");
  var display = document.getElementById("displayCount2");
  
 if (count1 < 59){
     count1++;
     }
     else if  (count1 > 58){
  count1 = -1;
   count1++;
   }
     
     if (count1 < 10){
     display.innerHTML = ("0" + count1);
     }
  else if (count1 > 9){display.innerHTML = count1;
     }   
  }
  
  
function countdown1(){

  var button = document.getElementById("countButton4");
  var display = document.getElementById("displayCount2");
  
  
   if (count1 > 0){
     count1--;
     }
     else if  (count1 < 1){
  count1 = 60;
   count1--;
   }
     
     if (count1 < 10){
     display.innerHTML = ("0" + count1);
     }
  else if (count1 > 9){display.innerHTML = count1;
     }   
  }
  
  //clock
  
function renderTime() {
	var currentTime = new Date();
	var diem = "AM";
	var h = currentTime.getHours();
	var m = currentTime.getMinutes();
    var s = currentTime.getSeconds();
	setTimeout('renderTime()',1000);
  //  if (h == 0) {
	//	h = 12;
//	} else if (h > 12) { 
//		h = h - 12;
//		diem="PM";
//	}
	if (h < 10) {
		h = "0" + h;
	}
	if (m < 10) {
		m = "0" + m;
	}
	if (s < 10) {
		s = "0" + s;
	}
    var myClock = document.getElementById('clockDisplay');
	myClock.textContent = h + ":" + m + ":" + s + " ";
	myClock.innerText = h + ":" + m + ":" + s + " ";
	// optional add diem in end 
}
renderTime();


//setup alarm

function setup(){
	 document.getElementById("but1").disabled = true;
	  document.getElementById("but2").disabled = true;
	   document.getElementById("but3").disabled = true;
	    document.getElementById("but4").disabled = true;
    var h = currentTime.getHours();
	var m = currentTime.getMinutes();
	
    var tim = (((count - h) * 60) + (count1 - m));
	 var hourleft = ((count - h) * 60); 
	 var hl = document.getElementById("nnn");
	 
        setTimeout(function(){
    audio.play(aud1);
}, tim);
	    	
      }
      
      function jj(){
      var kd = 9;
      if (kd < 10){
      
      play();
      }
      }
	
 
function play(){
var audio = document.getElementById("aud1");
audio.play(aud1);
audio.volume = 1.0;

}







 	
  
	

  
  
  
