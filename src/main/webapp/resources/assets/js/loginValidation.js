function formCheck(frm) {
	let msg = ''

	if (frm.id.value.length == 0) {
		setMessage('id를 입력해주세요.', frm.id)
		return false;
	}

	if (frm.pwd.value.length == 0) {
		setMessage('password를 입력해주세요.', frm.pwd)
		return false;
	}

	return true;
}

function setMessage(msg, element) {
	document.getElementById("msg").innerHTML = `<i class="fa fa-exclamation-circle">${'${msg}'}</i>`;
	if (element) {
		element.select(); //값을 잘못 입력되었을때 그 요소를 선택되게하는 것임
	}
}