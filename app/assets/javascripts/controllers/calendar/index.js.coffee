app = angular.module('calendar/index', [
  'global/generic_requester', 'global/notifier'
])

class Calendar.IndexController extends Global.GenericController
  constructor: (requester, notifier) ->
    super

  _setData: (response) =>
    this.firstDate = new Date(response.data.firstDate)
    this.lastDate = new Date(response.data.lastDate)
    this._buildCalendar()

  _buildCalendar: ->
    1

app.controller('Calendar.IndexController', [
  'generic_requester','notifier',
  Calendar.IndexController
])

