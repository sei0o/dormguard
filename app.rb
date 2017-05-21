require 'sinatra'

configure do
  set :status, "0"
end

get '/' do
  erb :player 
end

get '/status' do
  settings.status
end

post '/status' do
  settings.status = params["status"]
  
  "succeeded"
end

__END__

@@ player
<!DOCTYPE html>
<html>
  <head>
  </head>
  <body>
    Now detecting... status: <span id="stat">0</span>
    If you are using iOS, please tap the screen first.
    <script>
      let audio = new Audio("music/goodtek.mp3");
      audio.autoplay = false;
      audio.loop = true;

      let timer = setInterval(function() {
        let xhr = new XMLHttpRequest();
        xhr.open("GET", "/status", true);
        xhr.onreadystatechange = function () {
          if (xhr.readyState == 4) {
            document.getElementById("stat").innerHTML = xhr.responseText;

            if (xhr.responseText === "1") {
              audio.play();
            } else {
              audio.pause();
            }
          }
        };
        xhr.send();
      }, 500);

      document.addEventListener("touchstart", function() {
        audio.play();
        audio.pause();
      }, false);
    </script>
  </body>
</html>
