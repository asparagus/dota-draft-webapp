$(document).ready(initializeHome);
$(document).on('page:load', initializeHome);

function initializeHome() {
    initializeQuery();
    initializeDnD();
}

function initializeDnD() {
    $('.sprite').draggable({
        revert: "invalid",
        zIndex: 100,
        helper: "clone",
        snap: '.droppable',
        snapMode: 'inner',
        start: function(e) { dragging = true; },
        stop: function(e) { dragging = false; }
    });

    $('.draft').droppable({
        hoverClass: "ui-state-highlight",
        drop: function(event, ui) {
            var name = ui.draggable.attr('data-original-title');
            console.log(name);
        }
    });
}

function updateSprites() {
    var query = $('#query').val();
    var lowerQuery = query.toLowerCase();

    var hintSet = false;
    $('.sprite').each(function() {
        var name = $(this).attr('data-original-title');
        var lowerName = name.toLowerCase();

        if(lowerName.includes(lowerQuery)) {
            $(this).removeClass('disabled');
            $(this).draggable('enable');

            if(!hintSet && query.length > 0 && lowerName.startsWith(lowerQuery)) {
                $('#query-hint').val(query + name.substring(query.length));
                $('#query-hint').attr('original-value', name);
                hintSet = true;
            }
        }
        else {
            $(this).addClass('disabled');
            $(this).draggable('disable');
        }
    });

    if (!hintSet) {
        $('#query-hint').val(query);
        $('#query-hint').attr('original-value', query);
    }
}

function initializeQuery() {
    $('#query').on('input', updateSprites);

    $('#query').on('keydown', function(e) {
        if (e.which == 9) {
            $('#query').val($('#query-hint').attr('original-value'));
            $('#query-hint').val($('#query-hint').attr('original-value'));
            updateSprites();
            e.preventDefault();
        }
    });
    /*$('#query').typeahead(null, {
      name: 'names',
      limit: 10,
      source: substringMatcher(gon.names)
    });*/
}