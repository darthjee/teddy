module = angular.module('global/notifier', [])

NotifierServiceFactory = () ->
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

module.service('notifier', [NotifierServiceFactory])
