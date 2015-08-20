// jQuery Validate
$(function() {

	$("#new_user").validate({
		rules: {
			"user[first_name]": {
				required: true,
				minlength: 2
			},
			"user[last_name]": {
				required: true,
				minlength: 2
			},
			"user[email]": {
				required: true,
				email: true,
			},
			"user[password]": {
				required: true,
				minlength: 6
			}
		},
		messages: {
			"user[first_name]": {
				required: "Please enter a first name",
				minlength: "First name must be longer than 2 characters"
			},
			"user[last_name]": {
				required: "Please enter a last name",
				minlength: "Last name must be longer than 2 characters"
			},
			"user[email]": {
				required: "Please enter an email",
				email: "Please enter a valid email"
			},
			"user[password]": {
				required: "Please enter a password",
				minlength: "Your password must be at least 6 characters"
			}
		}
	});

	$("#edit_user").validate({
		rules: {
			"user[first_name]": {
				required: true,
				minlength: 2
			},
			"user[last_name]": {
				required: true,
				minlength: 2
			},
			"user[email]": {
				required: true,
				email: true,
			},
			"user[password]": {
				required: true,
				minlength: 6
			}
		},
		messages: {
			"user[first_name]": {
				required: "Please enter a first name",
				minlength: "First name must be longer than 2 characters"
			},
			"user[last_name]": {
				required: "Please enter a last name",
				minlength: "Last name must be longer than 2 characters"
			},
			"user[email]": {
				required: "Please enter an email",
				email: "Please enter a valid email"
			},
			"user[password]": {
				required: "Please enter a password",
				minlength: "Your password must be at least 6 characters"
			}
		}
	});

	$("#login_form").validate({
		rules: {
			"user[email]": {
				required: true,
				email: true
			},
			"user[password]": {
				required: true,
				minlength: 6
			}
		},
		messages: {
			"user[email]": {
				required: "Please enter an email",
				email: "Please enter a valid email"
			},
			"user[password]": {
				required: "Please enter a password",
				minlength: "Your password must be at least 6 characters"
			},
		}
	});

	$("#new_event").validate({
		rules: {
			"event[name]": {
				required: true,
				minlength: 2
			},
			"event[address]": {
				required: true,
				minlength: 2
			},
			"event[city]": {
				required: true,
				minlength: 2
			},
			"event[state]": {
				required: true,
				minlength: 2
			},
			"event[start_date]": {
				required: true
			},
			"event[end_date]": {
				required: true
			},
			"event[start_time]": {
				required: true
			},
			"event[end_time]": {
				required: true
			},
			"event[capacity]": {
				required: true
			},
			"event[cost]": {
				required: true,
				number: true
			}
		},
		messages: {
			"event[name]": {
				required: "Please enter an event name",
				minlength: "The event name must be at least 2 characters"
			},
			"event[address]": {
				required: "Please enter the event's address",
				minlength: "The event address must be at least 2 characters"
			},
			"event[city]": {
				required: "Please enter the event's city",
				minlength: "The event city must be at least 2 characters"
			},
			"event[state]": {
				required: "Please enter the event's state",
				minlength: "The event state must be at least 2 characters"
			},
			"event[start_date]": {
				required: "Please enter the event's start date"
			},
			"event[end_date]": {
				required: "Please enter the event's end date"
			},
			"event[start_time]": {
				required: "Please enter the event's start time"
			},
			"event[end_time]": {
				required: "Please enter the event's end time"
			},
			"event[capacity]": {
				required: "Please enter the event's capacity"
			},
			"event[cost]": {
				required: "Please enter the event's cost",
				number: "Cost must be in dollars"
			}
		}
	});

	$("#edit_event").validate({
		rules: {
			"event[name]": {
				required: true,
				minlength: 2
			},
			"event[address]": {
				required: true,
				minlength: 2
			},
			"event[city]": {
				required: true,
				minlength: 2
			},
			"event[state]": {
				required: true,
				minlength: 2
			},
			"event[start_date]": {
				required: true
			},
			"event[end_date]": {
				required: true
			},
			"event[start_time]": {
				required: true
			},
			"event[end_time]": {
				required: true
			},
			"event[capacity]": {
				required: true
			},
			"event[cost]": {
				required: true,
				number: true
			}
		},
		messages: {
			"event[name]": {
				required: "Please enter an event name",
				minlength: "The event name must be at least 2 characters"
			},
			"event[address]": {
				required: "Please enter the event's address",
				minlength: "The event address must be at least 2 characters"
			},
			"event[city]": {
				required: "Please enter the event's city",
				minlength: "The event city must be at least 2 characters"
			},
			"event[state]": {
				required: "Please enter the event's state",
				minlength: "The event state must be at least 2 characters"
			},
			"event[start_date]": {
				required: "Please enter the event's start date"
			},
			"event[end_date]": {
				required: "Please enter the event's end date"
			},
			"event[start_time]": {
				required: "Please enter the event's start time"
			},
			"event[end_time]": {
				required: "Please enter the event's end time"
			},
			"event[capacity]": {
				required: "Please enter the event's capacity"
			},
			"event[cost]": {
				required: "Please enter the event's cost",
				number: "Cost must be in dollars"
			}
		}
	});

	$("#new_post").validate({
		rules: {
			"post[body]": {
				required: true,
				minlength: 2,
				maxlength: 200
			}
		},
		messages: {
			"post[body]": {
				required: "Please enter a post",
				minlength: "Your post must be at least 2 characters",
				maxlength: "Your post must be shorter than 200 characters"
			}
		}
	});

	$("#edit_post").validate({
		rules: {
			"post[body]": {
				required: true,
				minlength: 2,
				maxlength: 200
			}
		},
		messages: {
			"post[body]": {
				required: "Please enter a post",
				minlength: "Your post must be at least 2 characters",
				maxlength: "Your post must be shorter than 200 characters"
			}
		}
	});

});