$( document ).ready(function() {
  $("#load_phrase").click(function() {
    fetchPhrase()  ;
  });

  function fetchPhrase() {
    var val = $('#more-phrase').data('ids');
    var exclude = val.toString();
    $.ajax({
      type : "POST",
      url:"/fetch_phrase",
      data: {exclude: exclude.split(',')},
      success: function(data) {
        title = "<div class=\"col-sm-3\">" + data.title + "</div>"
        description = "<div class=\"col-sm-9\">" +  data.description + "</div>"
        $('#more-phrase').append(title + description);
        $('#more-phrase').data('ids', $('#more-phrase').data('ids') + ',' + data.id );
        if (data.remaining_record_count == 0)
          {
          $('#load_phrase').html("No more record");
          $('#load_phrase').attr('disabled','disabled');
          }  
        else
          $('#load_phrase').html("Load " + data.remaining_record_count + " more");

      },
      error: function (xhr, ajaxOptions, thrownError) {
        $('.error').html('No more record found');
      }
    });
  }
});
