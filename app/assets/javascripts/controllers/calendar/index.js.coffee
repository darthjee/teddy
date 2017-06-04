app = angular.module('calendar/index', [
  'global/notifier'
])

class Calendar.IndexController extends Global.GenericController
  constructor: ($location, $http, notifier) ->
    this.notifier = notifier
    super($location, $http)

  _setData: (response) =>
    super

app.controller('Calendar.IndexController', [
  '$location','$http','notifier',
  Calendar.IndexController
])

