'use strict'

mgApp = angular.module 'mgApp'

mgApp.directive 'projetComponent', [
  'mg.CVService'
  (cvService) ->
    restrict: 'E'
    scope:
      projet: '='
    link: (scope, element, attrs) ->

    template:"""
<div>

  <h2 class="subtitle" ng-bind-html="projet.nom | trustedTrad"></h2>
  <span ng-bind-html="projet.client | trustedTrad"></span><br/><br/>
  <p class="description" ng-bind-html="projet.description | trustedTrad"></p>
  <h3 class="subsubtitle">Réalisations:</h3>
  <div ng-repeat="r in projet.realisations">
    <realisation-component realisation="r"></realisation-component>
  </div>
</div>
"""
]