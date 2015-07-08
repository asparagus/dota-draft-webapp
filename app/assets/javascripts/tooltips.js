$(document).ready(initializeTooltips);
$(document).on('page:load', initializeTooltips);

function initialize() {
    $('[data-toggle="tooltip"]').tooltip();
}