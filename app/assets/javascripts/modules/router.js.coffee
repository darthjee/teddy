class Router
  defaultConfig: {
    controller: 'GenericController',
    controllerAs: 'controller'
  }
  directRoutes: [
  ]
  customRoutes: {
    '/year/:year/month/:month': {
      controller: 'CalendarIndexController'
    }
  }

  constructor: ($routeProvider) ->
    this.provider = $routeProvider

  _bindRoutes: () ->
    _.each(this.directRoutes, this._setRouteConfig)
    _.each(this.customRoutes, this._setRouteConfig)

  _setRouteConfig: (config, route) =>
    if (typeof route != 'string')
      route = config
      config = {}

    config = _.extend({}, this.defaultConfig, {
      templateUrl: this._buildTemplateFor(route)
    }, config)

    this.provider.when(route, config)

  _buildTemplateFor: (route)->
    (params) ->
      if params != undefined
        window.d = params
        for key, value of params
          regexp = new RegExp(':' + key + '\\b')
          route = route.replace(regexp, value)
      route + '?ajax=true'

RouterBuilder = ($routeProvider) ->
    new Router($routeProvider)._bindRoutes()

app = angular.module('teddy')

app.config(['$routeProvider', RouterBuilder])
