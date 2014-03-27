'use strict'

mgApp = angular.module 'mgApp'

mgApp.factory 'mg.CVModels', [
  '_'
  (_) ->

    class CV
      constructor: () ->
        @categoriesTermeTechnique = []

    class CategorieTermeTechnique
      constructor: ({@id, @libelles}) ->
        @termes = []

    class TermeTechnique
      constructor: ({@id, @libelle}) ->
        @categories = []



    {
      CV
      TermeTechnique
      CategorieTermeTechnique
    }

]