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
<div class="row">
  <div class="col-lg-7 col-md-7">

    <div class="realisation">
      <h4 class="realisation-titre" ng-show="realisation.titre" ng-bind-html="::realisation.titre | trustedTrad">
      </h4>
      <p class="realisation-description" ng-bind-html="::realisation.description | trustedTrad">
      </p>
    </div>
  </div>
  <div class="col-lg-5 col-md-5">
    <p class="ref-categories-realisation" >
      <ref-categorie-termes-techniques-component
          ng-repeat="refCat in ::realisation.getRefCategoriesTermesTechniques()"
          ref-categorie-termes-techniques="refCat">
      </ref-categorie-termes-techniques-component>
    </p>
  </div>
</div>
"""
]
