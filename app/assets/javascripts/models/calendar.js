(function(_, angular, Calendar) {
  console.info(Calendar);
  module = angular.module('calendar/calendar', []);
  
  Calendar.Calendar = function(calendar) {
    _.extend(this, calendar);
  }
  
  Calendar.Calendar.Factory = function() {
    return new Calendar.Calendar();
  }
  
  module.factory('Calendar', [Calendar.Calendar.Factory]);
})(window._, window.angular, window.Calendar);
