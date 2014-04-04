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
  <div class="row">
    <div class="col-lg-7">
      <h2 class="subtitle" ng-bind-html="projet.nom | trustedTrad"></h2>
      <p class="client" ng-show="projet.client" ng-bind-html="projet.client | trustedTrad"></p>
      <p class="description" ng-bind-html="projet.description | trustedTrad"></p>
      <p class="ref-categories">
        <ref-categorie-termes-techniques-component
            ng-repeat="refCat in projet.getAllRefCategoriesTermesTechniques()"
            ref-categorie-termes-techniques="refCat">
        </ref-categorie-termes-techniques-component>
      </p>
    </div>

  </div>
  <h3 class="subsubtitle">Réalisations:</h3>
  <div ng-repeat="r in projet.realisations">
    <realisation-component realisation="r"></realisation-component>
  </div>
</div>
"""
]