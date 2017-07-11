app = angular.module('calendar/index', [
  'global/generic_requester', 'global/notifier'
])

class Calendar.IndexController extends Global.GenericController
  constructor: (requester, notifier) ->
    super
    this._buildWeekHeader()

  _setData: (response) =>
    this.calendar = new Calendar.Calendar(response.data)

  _buildWeekHeader: ->
    base = new Date().beginningOfWeek()
    this.weekHeader = _.times(7, (days) ->
      base.addDays(days).toLocaleFormat('%a')
    )

app.controller('Calendar.IndexController', [
  'generic_requester','notifier',
  Calendar.IndexController
])

