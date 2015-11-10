$(function () {

    $('#save_post').on('click', function(){
        if ((document.getElementById("post_title").value)=='' ||
            (document.getElementById("post_body").value)==''){
            window.alert('Заполните пустующие поля!');
            return false;}
        else {return true;}
    });




    $('#save_comment').on('click', function(){
        if ((document.getElementById("comment_body").value)==''){
            window.alert('Заполните пустующие поля!');
            return false;}
        else {return true;}
    });


});


