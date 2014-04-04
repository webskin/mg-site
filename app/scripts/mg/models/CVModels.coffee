'use strict'

mgApp = angular.module 'mgApp'

mgApp.factory 'mg.CVModels', [
  '_'
  (_) ->

    getRefCategoriesTermesTechniques = (getTermesFct) ->
      refTerme = (t) ->
        id: t.id
        libelle: _.clone t.libelle

      allTermes = getTermesFct()
      refCategoriesSet = {}
      _.forEach allTermes, (t) ->
        _.forEach t.categories, (c) ->
          if not refCategoriesSet[c.id]
            refCategoriesSet[c.id] =
              id: c.id
              libelle: _.clone c.libelle
              termes: [refTerme t]
          else
            refCategoriesSet[c.id].termes.push refTerme(t)
      _.values refCategoriesSet

    class CV
      constructor: (
        @informationsGenerales
        @formations
        @experiencesProfessionnelles
        @stagesEtProjetsFinEtude
      ) ->
        
    class ExperienceProfessionnelle
      constructor: ({
        @debut
        @fin
        @entreprise
        @statut
      }) ->
        @projets = []

    class Projet
      constructor: ({
        @nom
        @client
        @description
      }) ->
        @termesTechniques = []
        @realisations = []
        @cachedRootPlusAllDescendentTermesTechniques = null
        @cachedGetAllRefCategoriesTermesTechniques = null

      getRootPlusAllDescendentTermesTechniques: =>
        return @cachedRootPlusAllDescendentTermesTechniques if @cachedRootPlusAllDescendentTermesTechniques
        @cachedRootPlusAllDescendentTermesTechniques = []
        allSet = {}
        _.forEach @termesTechniques, (t) =>
          allSet[t.id] = t
        _.forEach @realisations, (r) =>
          _.forEach r.termesTechniques, (t) =>
            allSet[t.id] = t
        @cachedRootPlusAllDescendentTermesTechniques = _.values allSet

      getAllRefCategoriesTermesTechniques: ->
        return @cachedGetAllRefCategoriesTermesTechniques if @cachedGetAllRefCategoriesTermesTechniques
        @cachedGetAllRefCategoriesTermesTechniques = getRefCategoriesTermesTechniques @getRootPlusAllDescendentTermesTechniques



    class Realisation
      constructor: ({
        @description
      }) ->
        @projet = null
        @termesTechniques = []
        @getAllRefCategoriesTermesTechniques = null

      getRefCategoriesTermesTechniques: ->
        return @getAllRefCategoriesTermesTechniques if @getAllRefCategoriesTermesTechniques
        @getAllRefCategoriesTermesTechniques = getRefCategoriesTermesTechniques () =>
          _.union @termesTechniques, @projet.termesTechniques
        

    class CategorieTermeTechnique
      constructor: ({@id, @libelle}) ->
        @termes = []

    class TermeTechnique
      constructor: ({@id, @libelle}) ->
        @categories = []



    {
      CV
      ExperienceProfessionnelle
      Projet
      Realisation
      TermeTechnique
      CategorieTermeTechnique
    }

]