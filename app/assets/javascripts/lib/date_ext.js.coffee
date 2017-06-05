((clazz) ->
  clazz.fromString = (string) ->
    [year, month, day] = _.map(string.split('-'), (s) ->
      Number.parseInt(s)
    )
    new Date(year, month-1, day)

  clazz.DAYMILISECONDS = 24 * 3600 * 1000

  fn = clazz.prototype

  fn.addDays = (days) ->
    year = this.getFullYear()
    month = this.getMonth()
    day = this.getDate() + days

    new Date(year, month, day)

  fn.beginningOfWeek = () ->
    delta = - this.getDay()
    this.addDays(delta)

  fn.endOfWeek = () ->
    delta = 6 - this.getDay()
    this.addDays(delta)

  fn.daysUntil =(date) ->
    if (this.isAfter(date))
      - date.daysUntil(this)
    else
      (date - this) / clazz.DAYMILISECONDS

  fn.isAfter = (date) ->
    this > date

  fn.weeksUntil =(date) ->
    days = this.daysUntil(date)

    Math.ceil((days)/ 7)
)(Date)

