@Apparel.module 'Views', (Views, App, Backbone, Marionette, $, _) ->
  class Views.UserLoggedInNav extends Marionette.LayoutView
    template: HandlebarsTemplates['user-logged-in']

    # initialize: (options) ->
    #   @user = options

    render: ->
      # if(@user)
      @$el.html(@template(App.CurrentUser))
      # else
        # @$el.html(@template())
