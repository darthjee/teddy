(function(_, angular, CalendarModule, Global) {
  function IndexController (requester, notifier, builder) {
    this.contruct(requester, notifier);
    this.builder = builder;

    this._buildWeekHeader();
  }

  var Super = Global.GenericController,
      sfn = Super.prototype,
      fn = IndexController.prototype,
      app = angular.module('calendar/index', [
        'global/generic_requester', 'global/notifier',
        'calendar/calendar'
      ]);

  _.extend(fn, sfn);

  fn._setData = function(response) {
    this.calendar = this.builder.build(response.data);
  }

  fn._buildWeekHeader = function() {
    var base = new Date().beginningOfWeek();
    this.weekHeader = _.times(7, function(days) {
      return base.addDays(days).toLocaleFormat('%a')
    });
  };

  CalendarModule.IndexController = IndexController;
  app.controller('Calendar.IndexController', [
    'generic_requester','notifier','Calendar',
    IndexController
  ]);
}(window._, window.angular, window.Calendar, window.Global));
