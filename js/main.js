/**
 * @author Artur Atnagulov (atnartur), ClienDDev team (clienddev.ru)
*/

$(document).ready(function(){
	
	var xml;
	$('#search').typeahead({
		source: function(query, callback){
			function search(query, callback){
				console.log(xml);
				var datas = $("entry", xml).map(function() {
	                return {
	                    title: $( "title", this ).text(),
	                    content: $("content",this).text(),
	                    url: $( "url" , this).text()
	                };
	            }).get();

				var res = [];

				datas.forEach(function(row){
					if(
						row.title.indexOf(query) != -1 ||
						row.content.indexOf(query) != -1 ||
						row.url.indexOf(query) != -1
					)
						res.push(row);
				});

				callback(res)
			}
			if(typeof xml != 'undefined')
				search(query, callback);
			else{
				$.get('/search.xml', function(res){
					xml = res;
					search(query, callback)
				});
			}
		},
		displayText: function(row){
			return row.title;
		},
		afterSelect: function(row){
			location.href = row.url;
		}
	});

	$('.highlight').each(function(i, block) {
    	hljs.highlightBlock(block);
  	});
});