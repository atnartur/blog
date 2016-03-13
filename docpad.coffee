# DocPad Configuration File
# http://docpad.org/docs/config

richtypo = require 'richtypo'
marked = require 'marked'

# Define the DocPad Configuration
docpadConfig = {
	compress: true,
	uglify: true,
	templateData:
		site:
			title: 'atnartur.ru'

		cutTag: '<!--more-->'

		# Post part before “cut”
		cuttedContent: (content) ->            
			if @hasReadMore content
				cutIdx = content.search @cutTag
				marked(content[0..cutIdx-1])
			else
				content

		# Has “cut”?
		hasReadMore: (content) ->
			content and ((content.search @cutTag) isnt -1)

		# Richtypo.js
		rt: (s) ->
			s and (richtypo.rich s)

		categories:
			projects:
				slug: 'projects'
				name: 'Проекты'

		getDocumentsForCategory: (categoryId) ->
			return @getCollection('posts').findAll(category: categoryId)

		getCategoriesForDocument: (document) ->
			document ?= @getDocument()
			categoryId = document.get('category')
			categories = @categories[categoryId] 
			console.log(categories)
			return categories

	collections:
		posts: (database)->
			database.findAllLive({relativeOutDirPath: /posts[\/\\]\w+/ }).on "add", (model) ->
				model.setMetaDefaults({layout:"post"})
	plugins:
		moment:
			formats: [
				{raw: 'date', format: 'DD.MM.YYYY', formatted: 'humanDate'}
			]
		redirector:
			redirects: 
				# source: destination
				"/padenie-hostinga-2-vozvrashtenie-durdoma": "/posts/2015/1gb-fail2.html"

}

# Export the DocPad Configuration
module.exports = docpadConfig