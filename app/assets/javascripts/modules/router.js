(function(_, angular, undefined) {

  function Router($routeProvider) {
    window.a = arguments;
    this.provider = $routeProvider;
  }

  function RouterBuilder($routeProvider) {
    new Router($routeProvider).bindRoutes();
  }

  var fn = Router.prototype;

  fn.directRoutes = ['/year/:year/month/:month'];
  fn.customRoutes = {
  };

  fn.bindRoutes = function() {
    var router = this;

    _.each(router.directRoutes, function(route) {
      router.provider.when(route, {
        templateUrl: router.buildTemplateFor(route)
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
