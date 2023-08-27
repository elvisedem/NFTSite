/*
 * Copyright (c) 2018, Xyneex Technologies. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * You are not meant to edit or modify this source code unless you are
 * authorized to do so.
 *
 * Please contact Xyneex Technologies, #1 Orok Orok Street, Calabar, Nigeria.
 * or visit www.xyneex.com if you need additional information or have any
 * questions.
 */


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

$(document).ready(function(){
//login a user
    $('#loginform').submit(function(e){
        e.preventDefault();
        var email = $('#email').val().trim();
        var password = $('#password').val().trim();
        /*
         * Use AJAX to submit the information
         */
        $.ajax({
            url: 'LoginServlet',
            method: 'POST',
            dataType: 'JSON',
            data: {email: email, password: password},
            beforeSend: function(xhr){
                console.log('Submitting form...');
                $('#submitBtn').attr("disabled", true);
                $('#submitBtn').html('<i class="fa fa-refresh fa-spin"> </i> Logging In...');
            },
            success: function(data, textStatus, jqXHR){
                $('#submitBtn').removeAttr("disabled");
                $('#submitBtn').html('<i class="fa fa-save"> </i> Log In');
                if(data.message !== 'success')
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: data.message
                    });
                else{
                    Swal.fire({
                        icon: 'success',
                        title: 'User Logged In',
                        text: 'Redirecting to your dashboard.'
                    });
                    setTimeout(function(){
                        window.location.href = '/d/dashboard';
                    }, 50);
                }

            },
            complete: function(jqXHR, textStatus){

            },
            error: function(jqXHR, textStatus, errorThrown){
                $('#submitBtn').removeAttr("disabled");
                $('#submitBtn').html('<i class="fa fa-save"> </i> Log In');
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: "There was an error, please reload this page. " + errorThrown
                });
            }
        });
    });
});

$(document).ready(function(){
//update a user
    $('#updateform').submit(function(e){
        e.preventDefault();
        var fullname = $('#fullname').val().trim();
        var address = $('#address').val().trim();
        var phonenumber = $('#phonenumber').val().trim();

        // Validate address: allow numbers and letters, capitalize each new word
        if(!/^[a-zA-Z0-9 ]+$/.test(address)){
            Swal.fire({
                icon: 'error',
                title: 'Invalid address',
                text: 'Update your correct address (allowing only numbers and letters)'
            });
            return;
        }
        address = address.toLowerCase().replace(/(^|\s)\S/g, function(letter){
            return letter.toUpperCase();
        });

        // Validate phone: allow numbers only
        if(!/^[0-9]+$/.test(phonenumber)){
            Swal.fire({
                icon: 'error',
                title: 'Invalid phone number',
                text: 'Please enter a valid phone number (numbers only)'
            });
            return;
        }

        // Capitalize fullname
        fullname = fullname.toLowerCase().replace(/(^|\s)\S/g, function(letter){
            return letter.toUpperCase();
        });

        /*
         * Use AJAX to submit the information
         */
        $.ajax({
            url: 'UpdateUserServlet',
            method: 'POST',
            dataType: 'JSON',
            data: {fullname: fullname, address: address, phonenumber: phonenumber},
            beforeSend: function(xhr){
                console.log('Submitting form...');
            },
            success: function(data, textStatus, jqXHR){
                if(data.message !== 'success')
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: data.message
                    });
                else{
                    Swal.fire({
                        icon: 'success',
                        title: 'User updated',
                        text: 'Reloading.'
                    });
                    setTimeout(function(){
                        window.location.href = 'profile';
                    }, 5000);
                }

            },
            complete: function(jqXHR, textStatus){

            },
            error: function(jqXHR, textStatus, errorThrown){
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: "There was an error, please reload this page. " + errorThrown
                });
            }
        });
    });
});

$(document).ready(function(){

    var dataTable = $("#DashboardTransactionResults").DataTable();
    if(dataTable){
        dataTable.destroy();
    }
    //Invoice Transaction Side Table

    // List
    /*
     * Use AJAX to submit the information
     */
    $.ajax({
        url: 'ListTransaction',
        method: 'GET',
        dataType: 'JSON',
        success: function(data){
            // Handle data with datatables cdn
            $("#transactionResults").DataTable({
                data: data,
                columns: [// Corrected "colums" to "columns"
                    {data: 'balance'},
                    {data: 'status'}
                ]
            });

        }
    });
});