// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

$(function(){
  $('#welcome_message').bind('closed.bs.alert', function() {
    var form = $('#welcome_message').next('form');
    $.post(form.attr('action'), form.serialize());
  })

  $('#digest_signup_form')
    .bind("ajax:success", function(data, status, xhr) {
        alert('Success.');
    })
    .bind("ajax:error", function(xhr, status, error) {
        alert('Failed.');
    });
})

$(function(){
  console.log($('.vote-link'))

  $('.vote-link').click(function(event){
    event.preventDefault();
    var link = $(this);
    var num = link.find('.num').text();
    
    var newNum = parseInt(num) + 1;
    link.find('.num').text(newNum);
  });
});