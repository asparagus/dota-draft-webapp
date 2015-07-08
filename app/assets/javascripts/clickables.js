$(document).ready(initializeClickables);
$(document).on('page:load', initializeClickables);

function initializeClickables() {
    $('.clickable').click(function() {
        window.location.href = $(this).attr('data-href');
    });
}