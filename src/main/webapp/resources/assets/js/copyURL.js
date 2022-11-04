function copyURL(){
    let content = document.getElementById("showURL").value;

    navigator.clipboard.writeText(content)
      .then(() => {
        alert("복사 성공");
      })
      .catch(e => {
        alert("복사 실패");
      })
   } 