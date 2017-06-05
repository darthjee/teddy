module = angular.module('global/generic_requester', [])

class Global.GenericRequesterService
  constructor: (path, $http) ->
    this.path = path
    this.http = $http

  request: (callback) =>
    this.http.get(this.path)

  this.factory = ($location, $http) ->
    path = $location.$$path + '.json'
    new Global.GenericRequesterService(path, $http)

module.service('generic_requester', [
  '$location','$http',
  Global.GenericRequesterService.factory
])
