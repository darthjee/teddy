module = angular.module('global/notifier', [])

Global.NotifierServiceFactory = () ->
  new NotifierService()

class NotifierService
  constructor: ->
    this.watchs = {}

  notify: (key, value) ->
    _.each(this.listeners(key), (callback) ->
      callback(value)
    )

  register: (key, callback) ->
    this.listeners(key).push(callback)

  listeners = (key) ->
    if this.watchs[key] == undefined
      this.watchs[key] = []
    this.watchs[key]

module.service('notifier', [Global.NotifierServiceFactory])
