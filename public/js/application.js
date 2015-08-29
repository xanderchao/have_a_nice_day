$(document).ready(function () {

  $('form', '#create-question').on('submit', function(event){
    event.preventDefault();

    $.ajax({

      url: $(this).attr('action'),
      method: $(this).attr('method'),
      data: $(this).serialize()

      }).done(function(partial){
        $('#question-list').append(partial);
    });
  });
});
