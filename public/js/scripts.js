$(document).ready(function(){
  // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
  $('.modal-trigger').leanModal();
  $('.button-collapse').sideNav({
        menuWidth: 300, // Default is 240
        closeOnClick: true // Closes side-nav on <a> clicks, useful for Angular/Meteor
      });
      $('.datepicker').pickadate({
        min: new Date(2015,8,2),
        max: new Date(2020,8,29)
      });
});
