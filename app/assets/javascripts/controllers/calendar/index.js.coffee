app = angular.module('calendar/index', [
  'global/notifier'
])

class CalendarIndexController
  constructor: (notifier) ->
    this.notifier = notifier

app.controller('CalendarIndexController', [
  'notifier', CalendarIndexController
])

