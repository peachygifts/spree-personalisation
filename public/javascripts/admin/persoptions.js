function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".persoption").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).parent().before(content.replace(regexp, new_id));
}

$(document).ready(function(){
	setPersVisibility();
	$("#product_personalisable").change(function() {$("#persoptions").slideToggle();});
});

function setPersVisibility() {
	var personalisable = $("#product_personalisable").val();
	if (personalisable == "true") {
		$("#persoptions").show();
	} else {
		$("#persoptions").hide();
	}
}