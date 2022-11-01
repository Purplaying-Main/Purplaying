const fileDOM = document.querySelector('#file');
const preview = document.querySelectorAll('.image-box');

fileDOM.addEventListener('change', () => {
  const imageSrc = URL.createObjectURL(fileDOM.files[0]);
  preview[0].src = imageSrc;
});


URL.revokeObjectURL(src);  // string 타입


