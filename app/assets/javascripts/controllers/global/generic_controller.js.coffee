app = angular.module('global/generic_controller', [])

class Global.GenericController

  constructor: ($location, $http) ->
    this.path = $location.$$path + '.json'
    this.http = $http
    this.request()

  request: () ->
    promise = this.http.get(this.path)
    promise.then(this._setData)

  _setData: (response) =>
    this.data = response.data

app.controller('Global.GenericController', [
  '$location','$http',
  Global.GenericController
])
