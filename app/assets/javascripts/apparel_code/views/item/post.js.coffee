@Apparel.module 'Views', (Views, App, Backbone, Marionette, $, _) ->
  class Views.Post extends Marionette.ItemView
    template: HandlebarsTemplates['post'],

    render: ->
      @$el.html(@template(@model.attributes))
