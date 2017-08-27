(function(_, angular, undefined) {
  function GenericRequesterServiceFactory($location, $http) {
    var path = $location.$$path + '.json';
    return new GenericRequesterService(path, $http);
  }

  function GenericRequesterService(path, $http) {
    this.path = path;
    this.http = $http;
    _.bind(this.request, this);
  }

  var fn = GenericRequesterService.prototype,
      module = angular.module('global/generic_requester', []);

  fn.request = function(callback) {
    return this.http.get(this.path);
  };

  Global.GenericRequesterService = GenericRequesterService;

  module.service('generic_requester', [
    '$location','$http',
    GenericRequesterServiceFactory
  ]);
})(window._, window.angular);

