$(document).on('ready page:load', function () {

  //
  // BACKGROUND IMAGE
  //

  if ($('#form-button').length == 0) {
    $('body').css('background-size', '0 0')
  } else {
    $('body').css('background-size', 'cover')
  }

  //
  // POPOVER ENABLE
  //

  $('[data-toggle="popover"]').popover({
    html: true,
    trigger: 'hover'
  })

  $('[data-toggle="popover-click"]').popover({
    html: true
  })

  //
  // PARSLEY MULTISTEP FORM VALIDATION
  //

  var $sections = $('.form-section')

  function navigateTo(index) {
    // Mark the current section with the class 'current'
    $sections
      .removeClass('current')
      .eq(index)
        .addClass('current');
    // Show only the navigation buttons that make sense for the current section:
    $('.form-navigation .previous').toggle(index > 0)
    var atTheEnd = index >= $sections.length - 1
    $('.form-navigation .next').toggle(!atTheEnd)
    $('.form-navigation [type=submit]').toggle(atTheEnd)
    if (atTheEnd && $sections.length > 0) {
      $('#confirmation-title').text($('#question_title').val())
      $('#confirmation-ministry').text($('#question_ministry').val().toUpperCase())
      $('#confirmation-question').text($('#question_text').val())
    }
  }

  function curIndex() {
    // Return the current index by looking at which section has the class 'current'
    return $sections.index($sections.filter('.current'))
  }

  // Previous button
  $('.form-navigation .previous').click(function() {
    navigateTo(curIndex() - 1)
  })

  // Next button goes forward iff current block validates
  $('.form-navigation .next').click(function() {
    if ($('.demo-form').parsley().validate('block-' + curIndex()))
      navigateTo(curIndex() + 1)
  })

  // Prepare sections by setting the `data-parsley-group` attribute to 'block-0', 'block-1', etc.
  $sections.each(function(index, section) {
    $(section).find(':input').attr('data-parsley-group', 'block-' + index)
  })
  navigateTo(0) // Start at the beginning

  //
  // MAGNIFIC POPUP
  //

	$('#form-button').magnificPopup({
		type: 'inline',
		preloader: false,
		focus: '#name',

		// When elemened is focused, some mobile browsers in some cases zoom in
		// It looks not nice, so we disable it:
		callbacks: {
			beforeOpen: function() {
				if($(window).width() < 700) {
					this.st.focus = false
				} else {
					this.st.focus = '#name'
				}
			}
		}
	})
  
})