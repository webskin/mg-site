'use strict'

mgApp = angular.module 'mgApp'

mgApp.filter 'trustedTrad', [
  '_'
  'mg.CVService'
  'tradFilter'
  'thFilter'
  (_, cvService, trad, th) ->
    _.compose th, trad
]