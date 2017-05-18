//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require bootstrap-datepicker
//= require_tree .

$(function() {
    $('input.datepicker').data({behaviour: "datepicker"}).datepicker();
});

$('.datepicker').datepicker({
    format: 'yyyy/mm/dd'
});
