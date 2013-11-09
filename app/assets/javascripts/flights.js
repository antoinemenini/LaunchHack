$(function(ready){
  $(".tracked").on("keypress", function(){
    var data = 'airline='+ $("#airline").val();
    data += '&flightnumber='+ $("#flightnumber").val();
    data += '&departureairport='+ $("#departureairport").val();
    data += '&arrivalairport='+ $("#arrivalairport").val();
    $.ajax({
      type: "POST",
      url: "http://localhost:3000/flights/search",
      data: data,
      success: function(data, textStatus){
        $("#flightsList").empty();
        for (var i = 0; i < data.length; i++){
          addFlightToPage(data[i]);
        } 
      },
      dataType: 'json'
    });
  });

  function addFlightToPage(flight){
    var string = '<tr>';
    string += '<td>'+ flight.airline +'</td>';
    string += '<td>'+ flight.departuretime +'</td>';
    string += '<td>'+ flight.flightnumber +'</td>';
    string += '<td>'+ flight.departureairport +'</td>';
    string += '<td>'+ flight.arrivalairport +'</td>';
    string += '<td></td><td></td><td></td></tr>';
    $("#flightsList").append(string);
  };
});
