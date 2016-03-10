{% include "./header.html" %}
    <div class="container">
        <div class="row">
            <div class="col-md-9" id="main">
				<div class="posts">
	            	{% for page in getCollection("html").findAllLive() %}
	            	{{page}}
					    
					{% endfor %}
				</div>
            </div>
            {% include "./sidebar.html" %}
        </div>
    </div>
{% include "./footer.html" %}