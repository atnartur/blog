$(document).ready(function(){
	
	var xml;
	$('#search').typeahead({
		source: function(query, callback){
			function search(query, callback){
				var datas = $("entry", xml).map(function() {
	                return {
	                    title: $( "title", this ).text(),
	                    content: $("content",this).text(),
	                    url: $( "url" , this).text()
	                };
	            }).get();

				var res = datas.filter(function(row){
					return (
						row.title.toLowerCase().indexOf(query) != -1 ||
						row.content.toLowerCase().indexOf(query) != -1 ||
						row.url.toLowerCase().indexOf(query) != -1
					)
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