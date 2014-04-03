'use strict'

mgApp = angular.module 'mgApp'

mgApp.directive 'realisationComponent', [
  'mg.CVService'
  (cvService) ->
    restrict: 'E'
    scope:
      realisation: '='
    link: (scope, element, attrs) ->

    template:"""
<div>
  <p class="realisation" ng-bind-html="realisation.description | trustedTrad"></p>
</div>
"""
]