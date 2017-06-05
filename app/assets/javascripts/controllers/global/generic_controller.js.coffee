app = angular.module('global/generic_controller', [
  'global/generic_requester', 'global/notifier'
])

class Global.GenericController
  constructor: (requester) ->
    this.requester = requester
    this.request()

  request: () ->
    promise = this.requester.request()
    promise.then(this._setData)

  _setData: (response) =>
    this.data = response.data

app.controller('Global.GenericController', [
  'generic_requester', 'notifier'
  Global.GenericController
])
