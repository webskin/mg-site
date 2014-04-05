'use strict'

mgApp = angular.module 'mgApp'

mgApp.directive 'experienceProfessionnelleComponent', [
  'mg.CVService'
  (cvService) ->
    restrict: 'E'
    scope:
      experienceProfessionnelle: '='
    link: (scope, element, attrs) ->

    template:"""
<div>
  <div class="row">
    <div class="col-lg-7 col-md-7">
        <p class="periode"><span class='fa fa-calendar'/> {{experienceProfessionnelle.debut | mformat:'MMMM YYYY'}} - {{experienceProfessionnelle.fin | mformat:'MMMM YYYY'}}</p>
        <p class="entreprise" ng-show="experienceProfessionnelle.entreprise" ng-bind-html="experienceProfessionnelle.entreprise | trustedTrad"></p>
        <p class="statut" ng-show="experienceProfessionnelle.statut" ng-bind-html="experienceProfessionnelle.statut | trustedTrad"></p>
    </div>
  </div>
  <div ng-repeat="p in experienceProfessionnelle.projets">
    <projet-component projet="p"></projet-component>

  </div>
</div>
"""
]