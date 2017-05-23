$(document).ready(function() {
        $('#email').blur(function() {
        if($(this).val() != '') {
            var pattern = /^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i;
            if(pattern.test($(this).val())){
                $(this).css({'border' : '1px solid #569b44'});
                $('#valid').text('Верно');
            }
            else {
                $(this).css({'border' : '1px solid #ff0000'});
                $('#valid').text('Не верно');
            }
        }
        else {
            $(this).css({'border' : '1px solid #ff0000'});
            $('#valid').text('Поле email не должно быть пустым');
            }
        });
    });



$(document).ready(function() {
            $("#validate").keyup(function(){
                var email = $("#validate").val();
                if(email != 0){
                    if(isValidEmailAddress(email)){
                        $("#validate").css({"background-color": "#8FE38F"});
                    }
                    else {
                        $("#validate").css({"background-color": "#FFAD99"});
                    }
                }
                else {
                    $("#validate").css({"background-image": "none"});
                }
            });
        });
        function isValidEmailAddress(emailAddress) {
            var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
            return pattern.test(emailAddress);
        }
