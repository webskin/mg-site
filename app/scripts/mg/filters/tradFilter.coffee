'use strict'

mgApp = angular.module 'mgApp'

mgApp.filter 'trad', [
  '_'
  'mg.CVService'
  (_, cvService) ->
    (input) ->
      return '' if not input
      if _.isObject input
        input['fr'] # todo
      else if _.isString input
        input
      else
        input
]