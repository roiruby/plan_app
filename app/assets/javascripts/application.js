// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require jquery-ui.min
//= require tag-it
// require jquery.tagsinput.min
//= require turbolinks
//= require cocoon
//= require_tree .

document.addEventListener('turbolinks:load', function(event){
  if(typeof(gtag) == 'function'){
    gtag('config', 'UA-157537683-1', {
      'page_title' : event.target.title,
      'page_path': event.data.url.replace(window.location.protocol + "//" + window.location.hostname, "")
    });
  }
})