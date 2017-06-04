app = angular.module('calendar/index', [
  'global/notifier'
])

class CalendarIndexController
  constructor: ($location, $http, notifier) ->
    this.notifier = notifier
    this.path = $location.$$path + '.json'
    this.http = $http
    this.request()

  request: () ->
    promise = this.http.get(this.path)
    promise.then(this._setData)

  _setData: (response) =>
    this.data = response.data

app.controller('CalendarIndexController', [
  '$location','$http','notifier',
  CalendarIndexController
])

