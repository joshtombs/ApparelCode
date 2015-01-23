@Apparel.module 'Views', (Views, App, Backbone, Marionette, $, _) ->
  class Views.HomeLayout extends Marionette.LayoutView
    template: HandlebarsTemplates['home-layout'],

    regions:
      topNavRegion: '.top-nav'
      sideNavRegion: '.side-nav'
      contentRegion: '.content'

    onShow: ->
      @showTopNav()
      @sideNavRegion.show new App.Views.SideNav

    showTopNav: ->
      _this = this
      $.get('/current_user').complete(
        (data) ->
          current_user = data.responseJSON
          if(!!current_user)
            # model = App.Models.User(_this.createParameters(current_user))
            _this.topNavRegion.show new App.Views.TopNav(current_user)
          else
            $.get('/current_admin').complete(
              (data) ->
                current_admin = data.responseJSON
                if(!!current_admin)
                  _this.topNavRegion.show new App.Views.TopNav(current_admin)
                else
                  _this.topNavRegion.show new App.Views.TopNav
            )
      )
