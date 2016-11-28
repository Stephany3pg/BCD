   (function(){
           var httpRequest;
       var nome = document.getElementById("nome");
           var senha = document.getElementById("senha");
           var button =document.getElementById("login-button");
           button.addEventListener("click", efetuaLogin);
           nome.addEventListener('keyup', validaEnterkey);
           senha.addEventListener('keyup', validaEnterkey);
   
 
          function validaEnterkey(e){
            if(e.keyCode == 13) efetuaLogin();
          }
  
         function efetuaLogin() {
           var data = {
              'nome': nome.value,
              'senha': senha.value
            };
            makeRequest('http://200.135.37.74/js/login', data);
            clearInputs();
          };
  
        function makeRequest(url, data) {
          if (window.XMLHttpRequest) { // Mozilla, Safari, ...
             httpRequest = new XMLHttpRequest();
          }
          httpRequest.onreadystatechange = alertContents;
          httpRequest.open('POST', url);
          httpRequest.setRequestHeader('Content-Type', 'application/json');
          httpRequest.send(data);
        }
  
        function clearInputs(){
          nome.value = "";
          senha.value = "";
        }
        function alertContents() {
          if (httpRequest.readyState === 4) {
            if (httpRequest.status === 200) {
  
            }else{
             alert('There was a problem with the request.');
            }
          }
        }
        })();
  
