jQuery(document).ready(function($) {

		$("#doctorPrescription").validate({
			rules: {
				details:"required",
				consultationFees:"required",
				otherCharges:"required",
				discount:"required",
				price:"required"
			},
			messages: {
				details:"Please enter Prescription details",
				consultationFees:"Please enter Consultation fees",
				otherCharges: "Please enter Other Charges",
				discount: "Please enter discount",
				price: "Please enter price"
                
			}
		});
	});