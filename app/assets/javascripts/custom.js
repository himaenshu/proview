
$(document).on("click", "a.review-link", function(e) {
	e.preventDefault();
	var href = this.href;
	$.ajax({
	  mode: 'sync',
	  url: href,
	  cache: false,
	  //dataType: "script",
	  success: function(data) {
	      $("#review_form_dialog .container").html(data);
	      $("#review_form_dialog").dialog("open");
	  },
	  error: function(data){
	      $("#review_form_dialog .container").html("Something went wrong, please try again!");
	      $("#review_form_dialog").dialog("open");
	  }
	});
});



