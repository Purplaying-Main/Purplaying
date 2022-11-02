function clickBtn() {
   let _buttonI = event.target;
   const childElement = _buttonI.firstChild;

   if (_buttonI.classList.contains("likeBtn")) {
	   if (childElement.classList.contains("far")) {
	      childElement.classList.add("fas");
	      childElement.classList.add("active");
	      childElement.classList.remove("far");
	   } else {
	      childElement.classList.remove("fas");
	      childElement.classList.remove("active");
	      childElement.classList.add("far");
	   }
   } else {
	   if (_buttonI.classList.contains("far")) {
		   _buttonI.classList.add("fas");
		   _buttonI.classList.add("active");
		   _buttonI.classList.remove("far");
	   } else {
	      _buttonI.classList.remove("fas");
	      _buttonI.classList.remove("active");
	      _buttonI.classList.add("far");
	   }
   }
}