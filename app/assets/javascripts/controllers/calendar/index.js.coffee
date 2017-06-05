app = angular.module('calendar/index', [
  'global/notifier'
])

class Calendar.IndexController extends Global.GenericController
  constructor: ($location, $http, notifier) ->
    this.notifier = notifier
    super($location, $http)

  _setData: (response) =>
    this.firstDate = new Date(response.data.firstDate)
    this.lastDate = new Date(response.data.lastDate)
    this._buildCalendar()

  _buildCalendar: ->
    1

app.controller('Calendar.IndexController', [
  '$location','$http','notifier',
  Calendar.IndexController
])

