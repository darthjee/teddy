app = angular.module('global/controller', [
  'global/notifier'
])

class Global.Controller
  constructor: (notifier) ->
    this.notifier = notifier

app.controller('Global.Controller', [
  'notifier', Global.Controller
])
