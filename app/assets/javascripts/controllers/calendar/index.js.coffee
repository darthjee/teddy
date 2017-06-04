app = angular.module('calendar/index', [
  'global/notifier'
])

class CalendarIndexController extends GenericController
  constructor: ($location, $http, notifier) ->
    this.notifier = notifier
    this.path = $location.$$path + '.json'
    this.http = $http
    this.request()

  _setData: (response) =>
    super

app.controller('CalendarIndexController', [
  '$location','$http','notifier',
  CalendarIndexController
])

