app = angular.module('calendar/index', [
  'global/generic_requester', 'global/notifier'
])

class Calendar.IndexController extends Global.GenericController
  constructor: (requester, notifier) ->
    super
    this._buildWeekHeader()

  _setData: (response) =>
    this.firstDate = new Date(response.data.firstDate)
    this.lastDate = new Date(response.data.lastDate)
    this.beginningOfWeek = this.firstDate.beginningOfWeek()
    this.payments = response.data.payments
    this.weeks = this._calculateWeeks()

    this._buildCalendar()

  _buildWeekHeader: ->
    base = new Date().beginningOfWeek()
    this.weekHeader = _.times(7, (days) ->
      base.addDays(days).toLocaleFormat('%a')
    )

  _calculateWeeks: () ->
    start = this.beginningOfWeek
    end = this.lastDate.endOfWeek().addDays(1)
    start.weeksUntil(end)

  _buildCalendar: () ->
    this.calendar = _.times(this.weeks, this._buildWeek)

  _buildWeek: (week) =>
    firstDay = this.beginningOfWeek

    _.times(7, (weekDay) ->
      date = firstDay.addDays(week * 7 + weekDay)
      {
        day: date.getDate()
      }
    )

app.controller('Calendar.IndexController', [
  'generic_requester','notifier',
  Calendar.IndexController
])

