//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require bootstrap-datepicker
//= require_tree .

$(document).ready(function() {
  $('#search-alert').hide();
  $('#search-btn').click(function(e) {
    if ($('#cat_address').val() === '' || $('#cat_date').val() === '') {
      $('#search-alert').show(500);
      e.preventDefault();
    } else {
      $('#search-alert').hide(500);
      $(this).unbind('click');
    }
  });
});
