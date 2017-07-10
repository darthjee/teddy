window.Models = {}

module = angular.module('teddy', [
  'ngRoute', 'global', 'calendar'
])

module.config(['$httpProvider', ($httpProvider) ->
  $httpProvider.defaults.headers.patch = {
    'Content-Type': 'application/json;charset=utf-8'
  }
])
