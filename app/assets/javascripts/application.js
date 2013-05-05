// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .



$(document).ready(function() {
  // put all your jQuery goodness in here.
  $('#dropdownstates').chosen();
  $('#emphasis').chosen();
  $('#recipient').chosen();
  $('#ideology').chosen();
  $('#religion').chosen();
  $('#geography').chosen();
  $('.letter-button.randomize').hide()

  $(".letter-button.step1").click(function() {

      var url = "letter"; // the script where you handle the form input.
      console.log($('#letter_options_new form').serialize());

      $.ajax({
             type: "GET",
             url: url,
             data: $('#letter_options_new form').serialize(), // serializes the form's elements.
             success: function(data)
             {
             		var html = $(data);
             		var letter_form = $('#letter_options');
                 console.log(data); // show response from the php script.
                 window.emailData = data;
                 console.log('something');
                 $('#recipient').remove();
                 $('#recipient_chzn').remove();
                 var s = $("<select class='fieldset' id='recipient' name='recipient' data-placeholder='Choose a recipient'/>");
                 var i = 0;
                 for(var val in data) {
                 		console.log(val);
                 		if(i < 3) {
                     	$('<option />', {value: data[val], text: data[val]}).appendTo(s);
                     	i++;
                     }
                 }
                 s.appendTo('#recipient_field');
                 $("#recipient").prepend("<option value='' selected='selected'></option>");
                 $('#recipient').chosen();
                 console.log(s);
                 event.preventDefault();
                 //calculate destination place
                 var dest=0;
                 if($('.new-form-box.form-2').offset().top > $(document).height()-$(window).height()){
                      dest=$(document).height()-$(window).height();
                 }else{
                      dest=$('.new-form-box.form-2').offset().top;
                 }
                 //go to destination
                 $('html,body').animate({scrollTop:dest}, 1500,'swing');
                 $('input#name').focus();

             },
             error: function(data){
             	var a = data.responseText.toString();
             	console.log(a);
             	window.a = a;
             	// console.log(a['name']);
             	console.log('error');
             }
           });

      return false; // avoid to execute the actual submit of the form.
  });


$(".letter-button.step2").click(function() {

    var url = "edit"; // the script where you handle the form input.
    console.log($('#letter_options_new form').serialize());

    $.ajax({
           type: "GET",
           url: url,
           data: $('#letter_options_new form').serialize(), // serializes the form's elements.
           success: function(data)
           {
           		var html = $(data);
           		console.log(html);
           		var letter = html.find('#finalletter');
           		$('#lettercontainer').empty().append(letter);
           		$('.letter-button.randomize').show()
           		event.preventDefault();
           		//calculate destination place
           		var dest=0;
           		if($('.new-form-box.form-3').offset().top > $(document).height()-$(window).height()){
           		     dest=$(document).height()-$(window).height();
           		}else{
           		     dest=$('.new-form-box.form-3').offset().top;
           		}
           		//go to destination
           		$('html,body').animate({scrollTop:dest}, 1500,'swing');

           },
           error: function(data){
           	var a = data.responseText.toString();
           	console.log(a);
           	window.a = a;
           	// console.log(a['name']);
           	console.log('error');
           }
         });

    return false; // avoid to execute the actual submit of the form.
});


$(".letter-button.randomize").click(function() {

    var url = "edit"; // the script where you handle the form input.
    console.log($('#letter_options_new form').serialize());

    $.ajax({
           type: "GET",
           url: url,
           data: $('#letter_options_new form').serialize(), // serializes the form's elements.
           success: function(data)
           {
           		var html = $(data);
           		var letter = html.find('#finalletter');
           		$('#lettercontainer').empty().append(letter);

           },
           error: function(data){
           	var a = data.responseText.toString();
           	console.log(a);
           	window.a = a;
           	// console.log(a['name']);
           	console.log('error');
           }
         });

    return false; // avoid to execute the actual submit of the form.
});


	$('.letter-button-start').click(function(){
		// $.scrollTo('.new-form-box.form-1');
		event.preventDefault();
		//calculate destination place
		var dest=0;
		if($('.new-form-box.form-1').offset().top > $(document).height()-$(window).height()){
		     dest=$(document).height()-$(window).height();
		}else{
		     dest=$('.new-form-box.form-1').offset().top;
		}
		//go to destination
		$('html,body').animate({scrollTop:dest}, 1500,'swing');

	});

	$('.letter-button.print').click(function(){
		window.print();
		return false;
	});

	$('.letter-button.email').click(function(){
		  //window.location.href = "mailto:" + "urrutia.kevin@gmail.com";
		  var text = $('#finalletter').text().trim();
		  window.open("mailto:?Subject=Writegreen - Empowering Environmental Engagement&body=" + text ,'_newtab');
	});



});
