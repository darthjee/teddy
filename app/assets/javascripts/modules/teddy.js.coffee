module = angular.module('teddy', [
  'ngRoute', 'global'
])

module.config(['$httpProvider', ($httpProvider) ->
  $httpProvider.defaults.headers.patch = {
    'Content-Type': 'application/json;charset=utf-8'
  }
])
