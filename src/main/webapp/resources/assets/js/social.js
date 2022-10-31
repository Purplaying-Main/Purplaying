
// 카카오 로그인
    function loginWithKakao() {
      Kakao.Auth.authorize({
        redirectUri: 'https://developers.kakao.com/tool/demo/oauth',
      });
    }

    function getCookie(name) {
      var parts = document.cookie.split(name + '=');
      if (parts.length === 2) { return parts[1].split(';')[0]; }
    }


// 구글 로그인
    function onSuccess(googleUser) {
      console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
    }
    function onFailure(error) {
      console.log(error);
    }
    function renderButton() {
      gapi.signin2.render('my-signin2', {
        'scope': 'profile email',
        'width': 240,
        'height': 50,
        'longtitle': true,
        'theme': 'outline',
        'onsuccess': onSuccess,
        'onfailure': onFailure
      });
    }