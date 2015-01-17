pageLoad = ->
  className = $('body').attr('data-class-name')
  window.applicationView = try
    eval("new KMap.#{className}()")
  catch error
    new KMap.Views.ApplicationView()
  window.applicationView.render()

$(document).on 'ready', pageLoad
$(document).on 'page:load', pageLoad
$(document).on 'page:before-change', ->
  window.applicationView.cleanup()
  true
$(document).on 'page:restore', ->
  window.applicationView.cleanup()
  pageLoad()
  true