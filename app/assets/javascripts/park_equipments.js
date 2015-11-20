$(function () {
    //$('#office_branch').on('onchange', function(){
    //    confirm("Выйти без сохранения?");
    //
    //});
    var departments;

    departments = $('#office_department').html();


    $('#office_branch').on('click', function(){
        //confirm("Metka");
        //this.style.backgroundColor='brown';
        var branch, options;
        branch = $('#office_branch :selected').text();
        options = $(departments).filter("optgroup[label='" + branch + "']").html();
        console.log(options)
        if (options) {
                    return $('#office_department').html(options);
                } else {
                    return $('#office_department').empty();
                }
            });





    //console.log(departments);
    //
    //$('#office_branch').on('onchange', function() {
    //    var branch, options;
    //    branch = $('#office_branch :selected').text();
    //    options = $(departments).filter("optgroup[label='" + branch + "']").html();
    //    if (options) {
    //        return $('#office_department_id').html(options);
    //    } else {
    //        return $('#office_department_id').empty();
    //    }
    //});



});
