(function(angular) {
  var module = angular.module('teddy', [
    'ngRoute', 'global', 'calendar'
  ]);

  module.config(['$httpProvider', function($httpProvider) {
    $httpProvider.defaults.headers.patch = {
      'Content-Type': 'application/json;charset=utf-8'
    };
  }]);
}(window.angular));
