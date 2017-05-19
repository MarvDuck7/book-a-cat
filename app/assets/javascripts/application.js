//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require bootstrap-datepicker
//= require_tree .

$(document).ready(function() {
  $('#search-btn').click(function(e) {
    if ($('#cat_address').val() === '' || $('#cat_date').val() === '') {
      $('#search-alert').toggleClass('hidden', 1000, "easeOutSine");
      e.preventDefault();
    } else {
      $('#search-alert').toggleClass('hidden', 1000, "easeOutSine");
      $(this).unbind('click');
    }
  });
});
