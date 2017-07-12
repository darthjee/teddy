app = angular.module('calendar/index', [
  'global/generic_requester', 'global/notifier',
  'calendar/calendar'
])

class Calendar.IndexController extends Global.GenericController
  constructor: (requester, notifier, builder) ->
    super(requester, notifier)
    this.builder = builder
    this._buildWeekHeader()

  _setData: (response) =>
    this.calendar = this.builder.build(response.data)

  _buildWeekHeader: ->
    base = new Date().beginningOfWeek()
    this.weekHeader = _.times(7, (days) ->
      base.addDays(days).toLocaleFormat('%a')
    )

app.controller('Calendar.IndexController', [
  'generic_requester','notifier','Calendar'
  Calendar.IndexController
])

