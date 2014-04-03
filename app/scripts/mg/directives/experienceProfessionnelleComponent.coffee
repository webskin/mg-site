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

  <p class="periode">{{experienceProfessionnelle.debut | mformat:'MMMM YYYY'}} - {{experienceProfessionnelle.fin | mformat:'MMMM YYYY'}}</p>
  <span ng-bind-html="experienceProfessionnelle.entreprise | trustedTrad"></span><br/>
  <span ng-bind-html="experienceProfessionnelle.statut | trustedTrad"></span><br/>
  <div ng-repeat="p in experienceProfessionnelle.projets">
    <projet-component projet="p"></projet-component>
    <br />
  </div>
</div>
"""
]