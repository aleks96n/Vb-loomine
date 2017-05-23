$(document).ready(function() {
            $("#pass").keyup(function(){
                var pass = $("#pass").val();
                if(pass != 0){
                    if(isValidPass(pass)){
                        $("#pass").css({"background-color": "#8FE38F"});
                    }
                    else {
                        $("#pass").css({"background-color": "#FFAD99"});
                    }
                }
                else {
                    $("#pass").css({"background-image": "none"});
                }
            });
        });
        function isValidPass(pass) {
            var pattern = new RegExp("..........");
            return pattern.test(pass);
        }

        $(document).ready(function() {
                    $("#repass").keyup(function(){
                        var repass = $("#repass").val();
                        var pass = $("#pass").val();
                        if(repass != 0){
                            if(pass == repass){
                                $("#repass").css({"background-color": "#8FE38F"});
                            }
                            else {
                                $("#repass").css({
                                    "background-color": "#FFAD99"
                                });
                            }
                        }
                        else {
                            $("#repass").css({
                                "background-image": "none"
                            });
                        }
                    });
                });
