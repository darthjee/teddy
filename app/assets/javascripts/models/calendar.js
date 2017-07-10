(function(_, angular, Models) {
  module = angular.module('calendar/calendar', []);
  
  Models.Calendar = function(calendar) {
    _.extend(this, calendar);
  }
  
  Models.Calendar.Factory = function() {
    return new Models.Calendar();
  }
  
  module.factory('Calendar', [Models.Calendar.Factory]);
})(window._, window.angular, window.Models);
