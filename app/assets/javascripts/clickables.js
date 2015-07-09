$(document).ready(initializeClickables);
$(document).on('page:load', initializeClickables);

function initializeClickables() {
    $('.clickable').click(function(e) {
        if(e.target == this) {
            window.location.href = $(this).attr('data-href');
        }
    });
}