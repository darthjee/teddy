(function(_, angular) {
  function GenericController($location, $http) {
    this.path = $location.$$path + '.json';
    this.http = $http;

    _.bindAll(this, '_setData');

    this.request();
  }

  var fn = GenericController.prototype,
      app = angular.module('global/generic_controller', [
      ]);

  fn.request = function() {
    var promise = this.http.get(this.path);
    promise.then(this._setData);
  };

  fn._setData = function(response) {
    this.data = response.data;
  };

  app.controller('GenericController', [
    '$location','$http',
    GenericController
  ]);
})(window._, window.angular);

