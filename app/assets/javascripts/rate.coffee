#= require jquery.raty

# Displaying the ratings
window.rate = (r, ro = true) ->

    string = "#"            # To make this usable
    string += r.id if ro    # when both viewing end editing

    # Setting up rating divs

    $((string + 'mark1')).raty(
        score: r.mark1,
        path: "/assets",
        readOnly: ro
    )
    $((string + 'mark2')).raty(
        score: r.mark2,
        path: "/assets",
        readOnly: ro
    )
    $((string + 'mark3')).raty(
        score: r.mark3,
        path: "/assets",
        readOnly: ro
    )
    $((string + 'avgrate')).raty(
        score: r.mark1 * 0.4 + r.mark2 * 0.3 + r.mark3 * 0.3,
        path: "/assets",
        readOnly: true
    )

    # Saving selected values to inputs if creating/editing a review
    if not ro
        $('#mark1 > img').click(->
            $('input[name="review[mark1]"]').val($(this).attr("alt"))
        )
        $('#mark2 > img').click(->
            $('input[name="review[mark2]"]').val($(this).attr("alt"))
        )
        $('#mark3 > img').click(->
            $('input[name="review[mark3]"]').val($(this).attr("alt"))
        )