@Apparel.module 'Views', (Views, App, Backbone, Marionette, $, _) ->
  class Views.NewPost extends Marionette.LayoutView
    template: HandlebarsTemplates['new-post'],

    events:
      "submit": "submit"

    submit: ->
      console.log "Woooooahhh"
