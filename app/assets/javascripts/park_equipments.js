$(document).ready(function(){
    $('#no_branches').on('click', function(){
        if(confirm("Точно нет филиалов?")) {
            return true;
        }
        else{
            return false;
        }
    });


    var departments;
    departments = $('#department_branch_id').html();
    $('#department_branch_id').hide();
    //$('#find_office').hide();
    $('#label_dep').hide();

    $('#branch').on('click', function(){
        console.log('click');
        var branch, options, dep;
        branch = $('#branch :selected').text();

        options = $(departments).filter("optgroup[label='" + branch + "']").html();
        dep = $('#department_branch_id :selected').text();
        //console.log(options)
        //console.log(branch);
        //console.log(departments);
        console.log(dep);
        if (options) {$('#department_branch_id').show();
            $('#label_dep').show();
            //$('#find_office').show();
            return $('#department_branch_id').html(options);
        } else { $('#department_branch_id').hide();
            //$('#find_office').hide();
            return $('#department_branch_id').empty();
        }

    });



    jQuery(".best_in_place").best_in_place();








});