$(function(ready){
  
  function startExec(){
    setTimeout(continueExecution, 2000);
  }
  function continueExecution(){
    $("#row1").append('<img src="/assets/flight.png" id="flight">');
    $("#flight").animate({ left: "+=200px", top: "+=20px"}, 1500, 'linear');
    $("#flight").animate({ left: "+=200px", top: "=30px"}, 1000, 'linear');
    $("#flight").animate({ left: "+=100px", top: "+=40px"}, 500, 'linear');
    $("#flight").animate({ left: "+=300px", top: "-=20px"}, 2000, 'linear');
    $("#flight").animate({ left: "+=200px", top: "+=20px"}, 1500, 'linear');
    $("#flight").animate({ left: "+=400px", top: "+=20px"}, 1500, 'linear', function(){
    setTimeout(startExec, 15000); 
    });
    $("#flight").fadeOut(400, function(){$("#flight").remove();});
  }
  startExec();
});

