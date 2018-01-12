jQuery(document).ready(function($) {

		$("#signUpForm").validate({
			rules: {
				firstName:"required",
				lastName:"required",
				address:"required",
				
				emailId: {
					required: true,
					email: true
				},
				mobileNumber:{
					required: true,
					minlength: 10,
                    maxlength: 10
				},
				password:{
					required: true,
					minlength: 4,
                    maxlength: 10
				}
			},
			messages: {
				firstName:"Please enter your First Name",
				lastName:"Please enter your Last Name",
				emailId: "Please enter a valid Email ID",
				mobileNumber: "Please enter a valid Phone Number",
                address: "Please enter an Address",
                password:"Please enter a valid password"
			}
		});
	});