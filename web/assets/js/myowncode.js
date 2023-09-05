


/* global form */

$(document).ready(function(){
//register a user
    $('#signup').submit(function(e){
        e.preventDefault();
        var email = $('#email').val().trim();
        var username = capitalizeFirstLetter($('#username').val().trim());
        var password = $('#password').val().trim();



        if(username.length < 5){
            Swal.fire({
                icon: 'error',
                title: 'Invalid Username',
                text: 'Username must be at least 5 characters long'
            });
            return;
        }

        if(password.length < 8 || !isStrongPassword(password)){
            Swal.fire({
                icon: 'error',
                title: 'Invalid Password',
                text: 'Password must be strong and at least 8 characters long. \n\
                       Consider using uppercase, lowercase, numbers and special characters.'
            });
            return;
        }

        /*
         * Use AJAX to submit the information
         */
        $.ajax({
            url: 'NewUserServlet',
            method: 'POST',
            dataType: 'JSON',
            data: {email: email, username: username, password: password},
            beforeSend: function(xhr){
                console.log('Submitting form...');
                $('#submitBtn').attr("disabled", true);
                $('#submitBtn').html('<i class="fa fa-refresh fa-spin"> </i> Registering...');
            },
            success: function(data, textStatus, jqXHR){
                $('#submitBtn').removeAttr("disabled");
                $('#submitBtn').html('<i class="fa fa-save"> </i> Register Now');
                if(data.message !== 'success')
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: data.message
                    });
                else{
                    Swal.fire({
                        icon: 'success',
                        title: 'Account Created Successfully!',
                        text: 'Your account has been created successfully!\nYou can now login to continue.'
                    });
                    setTimeout(function(){
                        window.location.href = 'login';
                    }, 10000);
                }

            },
            complete: function(jqXHR, textStatus){

            },
            error: function(jqXHR, textStatus, errorThrown){
                $('#submitBtn').removeAttr("disabled");
                $('#submitBtn').html('<i class="fa fa-save"> </i> Register Now');
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: "There was an error, please reload this page. " + errorThrown
                });
            }
        });
    });
    function isStrongPassword(password){
        // Implement your password strength validation logic here
        // Return true if the password is strong, false otherwise
        // Example: check if the password contains at least one uppercase letter, one lowercase letter, one digit, and one special character

        // Example implementation:
        var uppercaseRegex = new RegExp('[A-Z]');
        var lowercaseRegex = new RegExp('[a-z]');
        var digitRegex = new RegExp('[0-9]');
        var specialCharRegex = new RegExp('[!@#$%^&*(),.?":{}|<>]');

        return uppercaseRegex.test(password) &&
                lowercaseRegex.test(password) &&
                digitRegex.test(password) &&
                specialCharRegex.test(password);
    }

    // Function to capitalize the first letter
    function capitalizeFirstLetter(string){
        return string.charAt(0).toUpperCase() + string.slice(1);
    }
});

//$(document).ready(function(){
////login a user
//    $('#loginform').submit(function(e){
//        e.preventDefault();
//        var email = $('#email').val().trim();
//        var password = $('#password').val().trim();
//        /*
//         * Use AJAX to submit the information
//         */
//        $.ajax({
//            url: 'LoginServlet',
//            method: 'POST',
//            dataType: 'JSON',
//            data: {email: email, password: password},
//            beforeSend: function(xhr){
//                console.log('Submitting form...');
//                $('#submitBtn').attr("disabled", true);
//                $('#submitBtn').html('<i class="fa fa-refresh fa-spin"> </i> Logging In...');
//            },
//            success: function(data, textStatus, jqXHR){
//                $('#submitBtn').removeAttr("disabled");
//                $('#submitBtn').html('<i class="fa fa-save"> </i> Log In');
//                if(data.message !== 'success')
//                    Swal.fire({
//                        icon: 'error',
//                        title: 'Error',
//                        text: data.message
//                    });
//                else{
//                    Swal.fire({
//                        icon: 'success',
//                        title: 'User Logged In',
//                        text: 'Redirecting to your dashboard.'
//                    });
//                    setTimeout(function(){
//                        window.location.href = '/d/dashboard';
//                    }, 50);
//                }
//
//            },
//            complete: function(jqXHR, textStatus){
//
//            },
//            error: function(jqXHR, textStatus, errorThrown){
//                $('#submitBtn').removeAttr("disabled");
//                $('#submitBtn').html('<i class="fa fa-save"> </i> Log In');
//                Swal.fire({
//                    icon: 'error',
//                    title: 'Error',
//                    text: "There was an error, please reload this page. " + errorThrown
//                });
//            }
//        });
//    });
//});
