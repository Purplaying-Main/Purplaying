function selectAll(selectAll)  {
  const checkboxes 
      = document.getElementsByName("agree");
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  })
}
function checked_agree1() {
  $('input[id="agree1"]').prop('checked', true);
}
function checked_agree2() {
  $('input[id="agree2"]').prop('checked', true);
}
function checked_agree3() {
  $('input[id="agree3"]').prop('checked', true);
}
function checked_agree4() {
  $('input[id="agree4"]').prop('checked', true);
}
function checked_agree5() {
  $('input[id="agree5"]').prop('checked', true);
}