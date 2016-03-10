# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration
docpadConfig = {
	compress: true,
	uglify: true,
	frontendDebug: true,
	templateData:
		site:
			title: 'atnartur.ru'
	collections:
        posts: (database)->
        	database.findAllLive({relativeOutDirPath: 'posts'}) # , [date:-1]
            # @getCollection("html").findAllLive({isPage:true,relativeOutDirPath: 'posts'}).on "add", (model) ->
            #     model.setMetaDefaults({layout:"page"})
}

# Export the DocPad Configuration
module.exports = docpadConfig