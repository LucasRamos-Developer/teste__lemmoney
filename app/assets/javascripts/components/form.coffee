LMY.Form = 
  target: ''
  initialize: (form_id)-> 
    LMY.Form.target = $(form_id)
    LMY.Form.listener_ajax()

  submit: ->
    $form = LMY.Form.target
    $form.submit() if LMY.Form.required_error() == 0

  cancel: ->
    $.fancybox.close()

  listener_ajax: ->
    $form = LMY.Form.target
    $modal = $form.closest('.inner-modal')
    
    $form.on 'ajax:beforeSend', (xhr, data) ->
      $modal.addClass('ajax-loading');

    $form.on 'ajax:success', (xhr, data) ->
      toastr.success('Oferta adicionada com sucesso!!!')
      setTimeout(->
        Turbolinks.visit(window.location.pathname)
      , 1000)

    $form.on 'ajax:error', (xhr, error, errorThrown) ->

    $form.on 'ajax:complete', (xhr, data) ->
      $modal.removeClass('ajax-loading');
      
  
  required_error: ->
    console.log('required');
    $form = LMY.Form.target
    count = 0
    $form.find('.required').each (i, val) ->
      value = $(this).val()
      
      if value.length == 0
        $(this).addClass('error')
        count++
      else
        $(this).removeClass('error')

      return

    return count