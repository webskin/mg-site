'use strict'

mgApp = angular.module 'mgApp'

mgApp.filter 'mformat', [
  '_'
  'mg.CVService'
  (_, cvService) ->
    (momentDate, pattern) ->
      return if not momentDate
      if pattern
        momentDate.format pattern
      else
        momentDate.format 'LL'
]