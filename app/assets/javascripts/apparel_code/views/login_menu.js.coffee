@Apparel.module 'Views', (Views, App, Backbone, Marionette, $, _) ->
  class Views.LoginMenu extends Marionette.LayoutView
    template: HandlebarsTemplates['login-menu'],

    className: 'overlay-background'

    events:
      'click a': 'close'
      'submit':  'submit'

    onShow: ->
      $.get('/sign_in', {}, (page) ->
        $('.form').html(page);
      )

    close: (evt) -> 
      @trigger("loginClose")
      App.appRouter.navigate '/', trigger: 1

    submit: (e) ->
      e.preventDefault()
      data = $("form").serializeArray()
      $.param(data)
      $.post('/login', data, (page) ->
        console.log page 
        App.vent.trigger "loginClose"
        App.appRouter.navigate '/', trigger: 1
      ).fail( (error) ->
        console.log error 
      )
