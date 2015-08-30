$(document).ready(function () { //When DOM loads this executes
  $('form', '#create-question').on('submit', function(event){ //Grabs a form with an id create-question
    event.preventDefault(); // Prevents acction
    $.ajax({ //Lines 4-7 is ajax request to server
      url: $(this).attr('action'),
      method: $(this).attr('method'),
      data: $(this).serialize()
      }).done(function(partial){
        $('#question-list').append('<h3>'+ partial +'</h3>')  ;
    });
  });

});
