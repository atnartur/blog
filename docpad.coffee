# DocPad Configuration File
# http://docpad.org/docs/config

richtypo = require 'richtypo'

# Define the DocPad Configuration
docpadConfig = {
	compress: true,
	uglify: true,
	templateData:
		site:
			title: 'atnartur.ru'

		cutTag: '<!-- cut -->'

		# Post part before “cut”
		cuttedContent: (content) ->            
			if @hasReadMore content
				cutIdx = content.search @cutTag
				content[0..cutIdx-1]
			else
				content

		# Has “cut”?
		hasReadMore: (content) ->
			content and ((content.search @cutTag) isnt -1)

		# Richtypo.js
		rt: (s) ->
			s and (richtypo.rich s)

	collections:
        posts: (database)->
        	# database.findAllLive({relativeOutDirPath: /posts[\/\\]\w+/ }) # , [date:-1]
        	database.findAllLive({relativeOutDirPath: /posts[\/\\]\w+/ }).on "add", (model) ->
                model.setMetaDefaults({layout:"post"})
}

# Export the DocPad Configuration
module.exports = docpadConfig