'use strict'

mgApp = angular.module 'mgApp'

mgApp.directive 'refCategorieTermesTechniquesComponent', [
  'mg.CVService'
  (cvService) ->
    restrict: 'E'
    scope:
      refCategorieTermesTechniques: '='
    link: (scope, element, attrs) ->

    template:"""
<p class="ref-categorie">

     <span><strong>{{refCategorieTermesTechniques.libelle | trustedTrad}}:</strong> </span><span ng-repeat="t in refCategorieTermesTechniques.termes">{{t.libelle | trustedTrad}}{{$last ? '.' : ', '}} </span>



</p>
"""
]