'use strict'

mgApp = angular.module 'mgApp'

mgApp.factory 'mg.CVModels', [
  '_'
  'mg.options'
  (_, options) ->

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
              imprimer: c.imprimer
              libelle: _.clone c.libelle
              termes: [refTerme t]
          else
            refCategoriesSet[c.id].termes.push refTerme(t)
      categories = _.values refCategoriesSet
      if options.pourImpression
        _.filter categories, (c) -> c.imprimer
      else
        categories



    class CV
      constructor: (
        @informationsGenerales
        @formations
        @resume
        @domainesExpertises
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
        @id
        @nom
        @client
        @descriptionCourte
        @description
      }) ->
        @termesTechniques = []
        @realisations = []
        @cachedRootPlusAllDescendentTermesTechniques = null
        @cachedGetTroncCommunRefCategoriesTermesTechniques = null
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

      getTroncCommunRefCategoriesTermesTechniques: ->
        return @cachedGetTroncCommunRefCategoriesTermesTechniques if @cachedGetTroncCommunRefCategoriesTermesTechniques
        @cachedGetTroncCommunRefCategoriesTermesTechniques = getRefCategoriesTermesTechniques () => @termesTechniques


    class Realisation
      constructor: ({
        @titre
        @description
      }) ->
        @projet = null
        @termesTechniques = []
        @getAllRefCategoriesTermesTechniques = null

      getRefCategoriesTermesTechniques: ->
        return @getAllRefCategoriesTermesTechniques if @getAllRefCategoriesTermesTechniques
        @getAllRefCategoriesTermesTechniques = getRefCategoriesTermesTechniques () => @termesTechniques
        

    class CategorieTermeTechnique
      constructor: ({@id, @libelle, @imprimer}) ->
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