
$('textarea').keypress(function(event) {
  if (event.which == 13) {
      console.log('pressed');
      event.preventDefault();
      $("#new_comment").submit();
  }
});