class Router
  directRoutes: []
  customRoutes: {
    '/year/:year/month/:month': {
      controller: 'CalendarIndexController',
      controllerAs: 'controller'
    }
  }

  constructor: ($routeProvider) ->
    this.provider = $routeProvider

  bindRoutes: () ->
    router = this

    _.each(router.directRoutes, (route) ->
      router.provider.when(route, {
        templateUrl: router.buildTemplateFor(route),
        controller: 'GenericController',
        controllerAs: 'controller'
      })
    )

    _.each(router.customRoutes, (params, route) ->
      _.extend(params, {
        templateUrl: router.buildTemplateFor(route)
      })

      router.provider.when(route, params)
    )

  buildTemplateFor: (route)->
    (params) ->
      if params != undefined
        window.d = params
        for key, value of params
          regexp = new RegExp(':' + key + '\\b')
          route = route.replace(regexp, value)
      route + '?ajax=true'

RouterBuilder = ($routeProvider) ->
    new Router($routeProvider).bindRoutes()

app = angular.module('teddy')

app.config(['$routeProvider', RouterBuilder])
