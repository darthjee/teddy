(function(_, angular, Global) {
  function GenericController(requester, notifier) {
    this.construct(requester, notifier);
  }

  var fn = GenericController.prototype,
      app = angular.module('global/generic_controller', [
        'global/generic_requester', 'global/notifier'
      ]);

  fn.contruct = function(requester, notifier) {
    this.requester = requester;
    this.notifier = notifier;

    _.bindAll(this, '_setData');
    this.request();
  };

  fn.request = function() {
    promise = this.requester.request();
    promise.then(this._setData);
  };

  fn._setData = function(response) {
    this.data = response.data;
  }

  app.controller('Global.GenericController', [
    'generic_requester', 'notifier',
    GenericController
  ]);

  Global.GenericController = GenericController;
}(window._, window.angular, window.Global));
