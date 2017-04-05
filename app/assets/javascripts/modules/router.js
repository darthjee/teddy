(function(_, angular, undefined) {

  function Router($routeProvider) {
    this.provider = $routeProvider;
  }

  function RouterBuilder($routeProvider) {
    new Router($routeProvider).bindRoutes();
  }

  var fn = Router.prototype;

  fn.directRoutes = [];
  fn.customRoutes = {
    '/year/:year/month/:month': { controller: 'CalendarIndexController', controllerAs: 'controller' }
  };

  fn.bindRoutes = function() {
    var router = this;

    _.each(router.directRoutes, function(route) {
      router.provider.when(route, {
        templateUrl: router.buildTemplateFor(route),
        controller: 'GenericController',
        controllerAs: 'controller'
      });
    });

    _.each(router.customRoutes, function(params, route) {
      _.extend(params, {
        templateUrl: router.buildTemplateFor(route)
      });

      router.provider.when(route, params);
    });
  };

  fn.buildTemplateFor = function(route) {
     return function(params) {
       if (params !== undefined) {
         for(var key in params) {
           var regexp = new RegExp(':' + key + '\\b');
           route = route.replace(regexp, params[key]);
         }
       }
       return route + '?ajax=true';
     };
  };

  var app = angular.module('teddy');

  app.config(['$routeProvider', RouterBuilder]);
})(window._, window.angular);
