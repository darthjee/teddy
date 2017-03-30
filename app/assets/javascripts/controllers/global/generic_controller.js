(function(_, angular) {
  function GenericController($routeParams) {
  }

  var fn = GenericController.prototype,
      app = angular.module('global/generic_controller', [
      ]);

  app.controller('GenericController', [
    '$routeParams', 
    GenericController
  ]);
})(window._, window.angular);

