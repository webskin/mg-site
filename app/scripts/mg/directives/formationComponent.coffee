'use strict'

mgApp = angular.module 'mgApp'

mgApp.directive 'formationComponent', [
  'mg.CVService'
  (cvService) ->
    restrict: 'E'
    scope:
      formation: '='
    link: (scope, element, attrs) ->

    template:"""
<div class="row">
  <div class="col-lg-7 col-md-7">
    <p class="periode"><span class='fa fa-calendar'/> {{formation.debut | mformat:'MMMM YYYY'}} - {{formation.fin | mformat:'MMMM YYYY'}}</p>
    <h2 class="subtitle" ng-bind-html="formation.cursus | trustedTrad"></h2>
    <p class="description" ng-bind-html="formation.description | trustedTrad"></p>
    <p class="mention" ng-bind-html="formation.diplome | trustedTrad"></p>
  </div>

</div>
"""
]