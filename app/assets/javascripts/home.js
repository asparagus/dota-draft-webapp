$(document).ready(initializeHome);
$(document).on('page:load', initializeHome);

function initializeHome() {
    initializeQuery();
    initializeDnD();
    initializeTeams();
}

function initializeTeams() {
    window.picks = {'ally': [], 'enemy': []};
    window.bans = {'ally': [], 'enemy': []};
}

function initializeDnD() {
    $('.sprite').draggable({
        revert: function(drop) {
            if(!$(drop).hasClass('droppable') || $(drop).attr('data-id') != $(this).attr('data-id')) {
                $(this).removeClass('disabled');
            }
        },
        zIndex: 100,
        helper: "clone",
        snap: '.droppable',
        snapMode: 'inner',
        opacity: 0.7,
        start: function(event) {
            $(this).addClass('disabled');
        },
        cancel: '.disabled',
        stop: function(event) {
            $(event.toElement).one('click', function(e) { e.stopImmediatePropagation(); });
            // $(this).removeClass('disabled');
            // $(this).draggable('enable');
        }
    });

    $('.draft').droppable({
        acept: '.sprite',
        hoverClass: 'ui-state-highlight',
        drop: function(event, ui) {
            var name = ui.draggable.attr('data-original-title');
            ui.draggable.addClass('disabled');

            $(this).addClass(ui.draggable.attr('class'));
            $(this).attr('data-id', ui.draggable.attr('data-id'));
            $(this).attr('data-sprite', ui.draggable.attr('data-sprite'));
            $(this).removeClass('disabled')
            $(this).droppable('disable');

            console.log(name);
            if ($(this).hasClass('pick')) {
                window.picks[$(this).attr('team')].push(ui.draggable.attr('data-id'));
            } else {
                window.bans[$(this).attr('team')].push(ui.draggable.attr('data-id'));
            }
        }
    });
    $('.draft').click(function() {
        // Remove on click
        if ($(this).hasClass('sprite')) {
            var id = $(this).attr('data-id');
            $('[data-id=' + id + ']').removeClass('disabled');
            $(this).removeClass('sprite');
            $(this).removeAttr('data-id');
            $(this).removeAttr('data-sprite');
            $(this).droppable('enable');

            if ($(this).hasClass('pick')) {
                var arr = window.picks[$(this).attr('team')];
                arr.splice(arr.indexOf(id), 1);
            } else {
                var arr = window.bans[$(this).attr('team')];
                arr.splice(arr.indexOf(id), 1);
            }
        }
    });
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
}

function updateSprites() {
    var query = $('#query').val();
    var lowerQuery = query.toLowerCase();

    var hintSet = false;
    $('.sprite').each(function() {
        var name = $(this).attr('data-original-title');
        var lowerName = name.toLowerCase();

        if(lowerName.includes(lowerQuery)) {
            $(this).removeClass('gray');

            if(!hintSet && query.length > 0 && lowerName.startsWith(lowerQuery)) {
                $('#query-hint').val(query + name.substring(query.length));
                $('#query-hint').attr('original-value', name);
                hintSet = true;
            }
        }
        else {
            $(this).addClass('gray');
        }
    });

    if (!hintSet) {
        $('#query-hint').val(query);
        $('#query-hint').attr('original-value', query);
    }
}
