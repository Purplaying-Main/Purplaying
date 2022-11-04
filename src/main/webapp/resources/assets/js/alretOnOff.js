function alretBtn() {
	   let _buttonI = event.target;

	   if (_buttonI.classList.contains("far")) {
		   _buttonI.classList.add("fas");
		   _buttonI.classList.add("active");
		   _buttonI.classList.remove("far");
		   _buttonI.innerText="알림 ON";
		   _buttonI.classList.remove("text-muted");
		   _buttonI.classList.add("text-info");
		   
	   } else {
		   _buttonI.classList.remove("fas");
		   _buttonI.classList.remove("active");
		   _buttonI.classList.add("far");
		   _buttonI.innerText="알림 OFF";
		   _buttonI.classList.remove("text-info");
		   _buttonI.classList.add("text-muted");
	   }
	}