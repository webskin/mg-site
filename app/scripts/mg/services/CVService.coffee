'use strict'
mgApp = angular.module 'mgApp'

mgApp.factory 'mg.CVService', [
  '_'
  '$http'
  '$q'
  'mg.CVMappings'
  (_, $http, $q, mappings) ->

    #
    class CVService
      constructor: ->
        @cachedCVResponse = null

      get: () ->

        if @cachedCVResponse

          deferred = $q.defer()
          deferred.resolve @cachedCVResponse
          deferred.promise

        else

          $http.get('/resources/cv.json').then(
            (success) =>
              success.data = mappings.cvDeserializer success.data
              @cachedCVResponse = success
          )


    # on retourne le singleton
    new CVService()
]