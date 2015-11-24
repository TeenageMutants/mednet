$(document).ready(function(){



    var departments;
    departments = $('#office_department').html();
    $('#office_department').hide();
    $('#find_office').hide();
    $('#label_dep').hide();

    $('#office_branch').on('click', function(){
        var branch, options;
        branch = $('#office_branch :selected').text();
        options = $(departments).filter("optgroup[label='" + branch + "']").html();
        console.log(options)
        //console.log(branch);
        //console.log(departments);
        if (options) {$('#office_department').show();
            $('#label_dep').show();
            $('#find_office').show();
            return $('#office_department').html(options);
        } else { $('#office_department').hide();
            $('#find_office').hide();
            return $('#office_department').empty();
        }
    });




    //var offices;
    //offices = $('#office_table').html();
    //$('#office_table').hide();
    //
    //
    //
    //$('#find_office').on('click', function(){
    //    var branch, department, opt_table;
    //    branch = $('#office_branch :selected').val();
    //    department = $('#office_department :selected').val();
    //    opt_table = $(offices).filter(branch, department).html();
    //    console.log(branch);
    //    console.log(department);
    //    if (branch, department){
    //        $("#office_table").css("display","block");
    //        $('#department').html();
    //
    //        //$.post("/park_equipments/office?branch_id=" + branch + "&department_id=" + department + "&commit");
    //        return $('office_table').html(opt_table);
    //    } else {$('#office_table').hide();
    //        return $('office_table').empty();
    //    }
    //
    //});


    var pg = require("pg");

    var conString = "pg://admin:guest@localhost:5432/Employees";

    var client = new pg.Client(conString);
    client.connect();

// client.query("CREATE TABLE IF NOT EXISTS emps(firstname varchar(64), lastname varchar(64))");
// client.query("INSERT INTO emps(firstname, lastname) values($1, $2)", ['Ronald', 'McDonald']);
// client.query("INSERT INTO emps(firstname, lastname) values($1, $2)", ['Mayor', 'McCheese']);

    var query = client.query("SELECT firstname, lastname FROM emps ORDER BY lastname, firstname");
    query.on("row", function (row, result) {
        result.addRow(row);
    });
    query.on("end", function (result) {
        console.log(JSON.stringify(result.rows, null, "    "));
        client.end();
    });







});
