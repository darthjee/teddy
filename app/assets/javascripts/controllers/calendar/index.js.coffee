app = angular.module('calendar/index', [
  'global/notifier'
])

class Calendar.IndexController extends Global.GenericController
  constructor: ($location, $http, notifier) ->
    this.notifier = notifier
    this.path = $location.$$path + '.json'
    this.http = $http
    this.request()

  _setData: (response) =>
    super

app.controller('Calendar.IndexController', [
  '$location','$http','notifier',
  Calendar.IndexController
])

