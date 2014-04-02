'use strict'
mgApp = angular.module 'mgApp'

mgApp.factory 'mg.TermeTechniqueService', [
  '_'
  '$http'
  '$q'
  (_, $http, $q) ->

    #
    class TermeTechniqueService
      constructor: ->
        @qTermesTechniques = $q.defer()
        @qCategoriesTermeTechnique = $q.defer()

      getTermesTechniques: () ->
        @qTermesTechniques.promise

      getCategoriesTermeTechnique: () ->
        @qCategoriesTermeTechnique.promise

      setTermesTechniques: (termesTechniques) ->
        @qTermesTechniques.resolve termesTechniques

      setCategoriesTermeTechnique: (categoriesTermeTechnique) ->
        @qCategoriesTermeTechnique.resolve categoriesTermeTechnique

      findTermesTechniquesById: (termes, id) ->
          _.find termes, (t) -> t.id is id

      findCategoriesTermeTechniqueById: (categories, id) ->
          _.find categories, (c) -> c.id is id

    # on retourne le singleton
    new TermeTechniqueService()
]