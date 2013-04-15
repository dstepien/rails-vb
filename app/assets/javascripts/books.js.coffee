#= require bootstrap-fileupload
#= require jquery.fancybox.patched
#= require jquery.ui.datepicker

$ ->
  $('a.fancybox').fancybox({
    'overlayColor': '#666'
  });

  $('#authors .author').each( ->
    icon = $('i', this)
    checkbox = $('.author-checkbox', $(this).parent('li'))
    buttonHeight = $(this).height()
    iconHeight = icon.height()

    icon.css('margin-top', Math.round(buttonHeight / 2) - Math.round(iconHeight / 2))

    if checkbox.is(':checked')
      $(this).addClass('active')
      icon.removeClass('icon-remove').addClass('icon-ok')
  )

  $('#authors').on('click', '.author', ->
    icon = $('i', this)
    checkbox = $('.author-checkbox', $(this).parent('li'))
    if icon.hasClass('icon-remove')
      icon.removeClass('icon-remove').addClass('icon-ok')
      checkbox.prop('checked', true)
    else
      icon.removeClass('icon-ok').addClass('icon-remove')
      checkbox.prop('checked', false)
  )

  $('#new-author-wrapper').tooltip({
    'title' : "Select authors of the book from the list below. If a particular author " +
              "doesn't exists just type new one and hit enter." ,
    'trigger' : 'manual'
  })

  $('#new-author-help').hover(
    ( -> $('#new-author-wrapper').tooltip('show')),
    ( -> $('#new-author-wrapper').tooltip('hide'))
  )

  $('#book_publishing_date').datepicker({
    dateFormat: 'dd.mm.yy',
    maxDate: '0',
    changeYear: true,
    yearRange: '1800:-',
    changeMonth: true
  });

  $('#publishing-date-icon').click( ->
    $('#book_publishing_date').datepicker('show');
  );

