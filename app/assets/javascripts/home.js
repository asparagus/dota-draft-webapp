$(document).ready(initializeQuery);
$(document).on('page:load', initializeQuery);


function initializeQuery() {
    $('#query').on('input', function() {
        var query = $('#query').val();
        var lowerQuery = query.toLowerCase();

        var hintSet = false;
        $('.sprite').each(function() {
            var name = $(this).attr('data-original-title');
            var lowerName = name.toLowerCase();

            if(lowerName.includes(lowerQuery)) {
                $(this).removeClass('disabled');

                if(!hintSet && query.length > 0 && lowerName.startsWith(lowerQuery)) {
                    $('#query-hint').val(query + name.substring(query.length));
                    $('#query-hint').attr('original-value', name);
                    hintSet = true;
                }
            }
            else {
                $(this).addClass('disabled');
            }
        });

        if (!hintSet) {
            $('#query-hint').val(query);
            $('#query-hint').attr('original-value', query);
        }
    });

    $('#query').on('keydown', function(e) {
        if (e.which == 9) {
            $('#query').val($('#query-hint').attr('original-value'));
            $('#query-hint').val($('#query-hint').attr('original-value'));
            e.preventDefault();
        }
    });
    /*$('#query').typeahead(null, {
      name: 'names',
      limit: 10,
      source: substringMatcher(gon.names)
    });*/
}