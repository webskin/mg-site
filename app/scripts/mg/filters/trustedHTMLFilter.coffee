'use strict'

mgApp = angular.module 'mgApp'

mgApp.filter 'th', [
  '_'
  '$sce'
  'mg.CVService'
  (_, $sce, cvService) ->
    (input) ->
      return '' if not input
      $sce.trustAsHtml input;
]