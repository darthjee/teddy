app = angular.module('global/controller', [
  'global/notifier'
])

class GlobalController
  constructor: (notifier) ->
    this.notifier = notifier

app.controller('GlobalController', [
  'notifier', GlobalController
])
