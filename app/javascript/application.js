// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

import jquery from 'jquery'
window.jQuery = jquery
window.$ = jquery



$(document).ready(function() {
  $('.delete-link').on('click', function(e) {
    e.preventDefault(); // Prevent the default link behavior

    // Show a confirmation dialog
    var confirmation = confirm("Are you sure you want to Reject this Application?");

    // If the user confirms, proceed with the deletion
    if (confirmation) {
      window.location = $(this).attr('href');
    } else {
      // User canceled the action
      // You can add code here to handle the cancellation if needed
    }
  });
});

$(document).ready(function() {
  $('.accept-link').on('click', function(e) {
    e.preventDefault(); // Prevent the default link behavior

    // Show a confirmation dialog
    var confirmation = confirm("Are you sure you want to confirm this Application?");

    // If the user confirms, proceed with the deletion
    if (confirmation) {
      window.location = $(this).attr('href');
    } else {
      // User canceled the action
      // You can add code here to handle the cancellation if needed
    }
  });
});
