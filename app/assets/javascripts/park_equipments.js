//$(function () {
//    $('#branch').on('change', function(){
//            if(confirm("change")) {
//
//                alert( this.options[this.selectedIndex].value);
//                $.ajax({
//                    url: 'office',
//                    type: 'get',
//                    data: $.param({branch_id: this.options[this.selectedIndex].value}, {act: 'search_dep'})
//                });
//
//
//                return true;
//            }
//            else{
//                return false;
//            }
//
//        });
//
//
//    //$('#branches_yes').on('click', function() {
//    //    if ($("#branches_yes").attr("checked") == 'checked') {
//    //        alert("hide");
    //        $('#new_branch').show();
    //    }
    //    else {
    //        $('#new_branch').hide();
    //    }
    //});

    //$(".edit").click(function(){
    //    if ($(this).hasClass("update")){
    //        $.ajax({
    //            type: "PUT",
    //            url: "/sections/<%= section.id %>"
    //        });
    //    } else {
    //        //do something else
    //    };
    //})

//});


$(document).ready(function() {

    // #first_select is the id of our first select box, if the ajax request has been successful,
    // an ajax:success event is triggered.

    $('#branch').live('ajax:success', function(evt, data, status, xhr) {
        // get second selectbox by its id
        var selectbox2 = $('#department_id');

        // empty it
        selectbox2.empty();

        // we got a JSON array in data, iterate through it

        $.each(data, function(index, value) {
            // append an option
            var opt = $('<option/>');

            // value is an array: [:id, :name]
            opt.attr('value', value[0]);
            // set text
            opt.text(value[1]);
            // append to select
            opt.appendTo(selectbox2);
        });
    });

});