'use strict'

mgApp = angular.module 'mgApp'

mgApp.directive 'projetComponent', [
  'mg.CVService'
  (cvService) ->
    restrict: 'E'
    scope:
      projet: '='
    link: (scope, element, attrs) ->
      scope.showRealisations = false
    template:"""
<div>
  <div class="row">
    <div class="col-lg-7 col-md-7">
      <h2 class="subtitle" ng-bind-html="projet.nom | trustedTrad"></h2>
      <p class="client" ng-show="projet.client" ng-bind-html="projet.client | trustedTrad"></p>
      <p class="description">
        <span ng-bind-html="projet.description | trustedTrad"></span>
          <!-- TODO trad title -->
          <button ng-hide="showRealisations" type="button" class="btn btn-default afficher-details" ng-click="showRealisations = true"><span class="fa fa-chevron-down" title="Afficher en détail les réalisations"></span></button>

      </p>
      <p ng-hide="showRealisations" class="ref-categories animate-slide">
        <ref-categorie-termes-techniques-component
            ng-repeat="refCat in projet.getAllRefCategoriesTermesTechniques()"
            ref-categorie-termes-techniques="refCat">
        </ref-categorie-termes-techniques-component>
      </p>
    </div>
  </div>
  <div ng-hide="!showRealisations" class="animate-slide">
    <h3 class="subsubtitle realisations"><button ng-show="showRealisations" type="button" class="btn btn-default masquer-details" ng-click="showRealisations = false"><span class="fa fa-chevron-up" title="Masquer le détail des réalisations"></span></button>Réalisations:</h3>
    <div ng-repeat="r in projet.realisations">
      <realisation-component realisation="r"></realisation-component>
    </div>
  </div>

</div>
"""
]