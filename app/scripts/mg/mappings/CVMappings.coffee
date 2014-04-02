'use strict'

mgApp = angular.module 'mgApp'

mgApp.factory 'mg.CVMappings', [
  '_'
  'moment'
  '$q'
  'mg.CVModels'
  'mg.TermeTechniqueService'
  (_, moment, $q, m, termeTechniqueService) ->

    parseDate = (stringDate) ->
      moment stringDate, "YYYY-MM-DD"

    handleTermesTechniques = (json) ->
      termesTechniques = []
      if json.termesTechniques
        termesTechniques = _(json.termesTechniques).map((termeJson) ->
          terme = new m.TermeTechnique(termeJson)
          terme.__categories = []
          if termeJson.categories
            # variable temporaire car relation n <-> n
            terme.__categories = termeJson.categories
          terme
        ).valueOf()

      categoriesTermeTechnique =[]
      if json.categoriesTermeTechnique
        categoriesTermeTechnique = _(json.categoriesTermeTechnique).map((catJson) ->
          cat = new m.CategorieTermeTechnique(catJson)
          cat.termes = _(termesTechniques).filter((t) ->
            if _(t.__categories).contains(cat.id)
              t.categories.push cat
              true
            else
              false
          ).valueOf()
          cat
        ).valueOf()

      # nettoyage de la variable temporaire
      _(termesTechniques).forEach (t) -> delete t.__categories

      termeTechniqueService.setTermesTechniques termesTechniques
      termeTechniqueService.setCategoriesTermeTechnique categoriesTermeTechnique


    buildRealisations = (termes, json) ->
      _.map json, (r) ->
        real = new m.Realisation(r)
        real.termesTechniques = _.map r.termesTechniques, (tId) ->
          termeTechniqueService.findTermesTechniquesById(termes, tId)
        real

    buildProjets = (termes, json) ->
      _.map json, (p) ->
        proj = new m.Projet(p)

        proj.termesTechniques = _.map p.termesTechniques, (tId) ->
          termeTechniqueService.findTermesTechniquesById(termes, tId)

        proj.realisations = buildRealisations termes, p.realisations
        proj

    buildExperiencesProfessionnelles = (termes, json) ->
      _.map json, (e) ->
        e.debut = parseDate e.debut
        e.fin = parseDate e.fin

        exp = new m.ExperienceProfessionnelle(e)
        exp.projets = buildProjets termes, e.projets
        exp

    cvDeserializer = (pJson) ->

      json = _.cloneDeep pJson
      handleTermesTechniques json

      termeTechniqueService.getTermesTechniques().then (termes) ->
        json.informationsGenerales.naissance = parseDate json.informationsGenerales.naissance

        formations = _.map json.formations, (f) ->
          f.debut = parseDate f.debut
          f.fin = parseDate f.fin
          f

        experiencesProfessionnelles = buildExperiencesProfessionnelles termes, json.experiencesProfessionnelles

        stagesEtProjetsFinEtude = buildExperiencesProfessionnelles termes, json.stagesEtProjetsFinEtude

        new m.CV(
          json.informationsGenerales
          formations
          experiencesProfessionnelles
          stagesEtProjetsFinEtude
        )


    {
      cvDeserializer
    }

]