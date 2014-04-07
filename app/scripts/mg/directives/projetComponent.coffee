'use strict'

mgApp = angular.module 'mgApp'

mgApp.directive 'projetComponent', [
  'mg.CVService'
  'mg.options'
  (cvService, options) ->
    restrict: 'E'
    scope:
      projet: '='
    link: (scope, element, attrs) ->
      scope.showRealisations = false
      scope.options = options
      scope.showDescriptionCourte = () ->
        options.pourImpression and scope.projet.descriptionCourte

    template:"""
<div>
  <div class="row">
    <div class="col-lg-7 col-md-7">
      <h2 class="subtitle" ng-bind-html="projet.nom | trustedTrad"></h2>&nbsp;&nbsp;&nbsp;&nbsp;
      <p class="client" ng-show="projet.client" ng-bind-html="projet.client | trustedTrad"></p>
      <p class="description">
        <span ng-show="showDescriptionCourte()" ng-bind-html="projet.descriptionCourte | trustedTrad"></span>
        <span ng-show="!showDescriptionCourte()" ng-bind-html="projet.description | trustedTrad"></span>
      </p>
      <div ng-hide="showRealisations" class="row animate-slide all-ref-cat-row">
        <div ng-show="options.pourImpression" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
          <p  class="ref-categories-pour-impression">
            <strong>—</strong>&nbsp;&nbsp;
            <ref-categorie-termes-techniques-pour-impression-component
                ng-repeat="refCat in projet.getAllRefCategoriesTermesTechniques()"
                ref-categorie-termes-techniques="refCat">
            </ref-categorie-termes-techniques-pour-impression--component>
          </p>
        </div>
        <div ng-hide="options.pourImpression" class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
          <p  class="ref-categories">
            <ref-categorie-termes-techniques-component
                ng-repeat="refCat in projet.getAllRefCategoriesTermesTechniques()"
                ref-categorie-termes-techniques="refCat">
            </ref-categorie-termes-techniques-component>
          </p>
        </div>
        <div ng-hide="options.pourImpression" class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
          <button type="button" class="btn btn-default afficher-details-btn" ng-click="showRealisations = true" title="Afficher le détail des réalisations"><span class="fa fa-chevron-down" ></span><span class="afficher-details"> Détail des réalisations</span></button>
        </div>
      </div>
    </div>
  </div>
  <div ng-hide="!showRealisations" class="animate-slide">
    <h3 class="subsubtitle"><button ng-show="showRealisations" type="button" class="btn btn-default masquer-details" ng-click="showRealisations = false"><span class="fa fa-chevron-up" title="Masquer le détail des réalisations"></span></button><span class="realisations">Réalisations:</span></h3>

    <div class="row">
      <div ng-show="projet.getTroncCommunRefCategoriesTermesTechniques().length > 0" class="col-lg-5 col-lg-offset-7 col-md-5 col-md-offset-7">
        <p class="ref-categories">
          <span class="tronc-commun"><strong>Tronc commun</strong></span>
          <ref-categorie-termes-techniques-component
              ng-repeat="refCat in projet.getTroncCommunRefCategoriesTermesTechniques()"
              ref-categorie-termes-techniques="refCat">
          </ref-categorie-termes-techniques-component>
        </p>
      </div>
    </div>

    <div ng-repeat="r in projet.realisations">
      <realisation-component realisation="r"></realisation-component>
    </div>
  </div>



</div>
"""
]