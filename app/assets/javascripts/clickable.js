$(document).ready(initialize);
$(document).on('page:load', initialize);

function initialize() {
    $('.clickable').click(function() {
        window.location.href = $(this).attr('data-href');
    });
}