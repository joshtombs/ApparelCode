@Apparel.module 'Controllers', (Controllers, App, Backbone, Marionette, $, _) ->
  class Controllers.AppController extends Marionette.Controller
    root: ->
      App.HomeLayout.contentRegion.show( new App.Views.HomeContent)

    people: ->
      collection = new App.Collections.Users
      view = new App.Views.People(collection: collection)
      collection.fetch()
      App.HomeLayout.contentRegion.show( view)

    sign_up: ->
      App.HomeLayout.contentRegion.show( new App.Views.NewUser)
      $.get("/sign_up")

    sign_in: ->
      $.get("/sign_in")

    signed_out: ->
      $.get('/signed_out').complete(
        (data) ->
          App.appRouter.navigate '/', trigger: 1
          App.CurrentUser = null
          App.HomeLayout.refreshTopNav()
      )

    account_settings: ->
      App.HomeLayout.contentRegion.show( new App.Views.AccountSettings)
      $.get("/account_settings")

    forgot_password: ->
      $.get("/forgot_password")

    create_post: ->
      if !App.CurrentUser
        $.ajax({
          type: "GET",
          url: "/sign_in",
          async: false
        })
      App.HomeLayout.contentRegion.show new App.Views.NewPost
      $.get("/create_post")

    show_post: (p) ->
      $.get("/post/"+p)
