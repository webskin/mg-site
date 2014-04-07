'use strict'

mgApp = angular.module 'mgApp'

mgApp.directive 'refCategorieTermesTechniquesPourImpressionComponent', [
  'mg.CVService'
  (cvService) ->
    restrict: 'E'
    scope:
      refCategorieTermesTechniques: '='
    link: (scope, element, attrs) ->
    template:"""
     <span class="titre-categorie">{{refCategorieTermesTechniques.libelle | trustedTrad}}: </span><span ng-repeat="t in refCategorieTermesTechniques.termes">{{t.libelle | trustedTrad}}{{$last ? '.' : ', '}}</span>&nbsp;&nbsp;<strong>—</strong>&nbsp;&nbsp;
"""
]