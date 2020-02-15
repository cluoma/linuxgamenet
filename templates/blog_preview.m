<!DOCTYPE html><html lang="en">
<head>
{{> head.m}}
</head>

<body>

{{> navbar.m}}

<div class="container">
    <div class="row">
    {{> twitch_banner.m}}

    <div class="col-sm-9">
        
        {{#special_info_box}}
        {{#search}}
        <!-- Search notification box -->
        <div class="panel panel-default">
        <div class="panel-heading">Search</div>
        <div class="panel-body">
        <div class="blog-post-text" style="margin-top:0;">Showing blog posts containing the search phrase: <b>{{.}}</b></div>
        </div>
        </div>
        {{/search}}
        {{#tag}}
        <!-- Search notification box -->
        <div class="panel panel-default">
        <div class="panel-heading">Tag</div>
        <div class="panel-body">
        <div class="blog-post-text" style="margin-top:0;">Showing blog posts sorted under the tag: <b>{{.}}</b></div>
        </div>
        </div>
        {{/tag}}
        {{#author}}
        <!-- Author notification box -->
        <div class="panel panel-default">
        <div class="panel-heading">Author</div>
        <div class="panel-body">
        <div class="blog-post-text" style="margin-top:0;">{{user_about}}<br><br>Showing blog posts written by: <b>{{user_name}}</b></div>
        </div>
        </div>
        {{/author}}
        {{/special_info_box}}

        {{#posts}}
        <div class="blog-post-preview-card">
            {{#rewrite}}
            <a href="/post/{{p_id}}"><img class="blog-post-preview-img" src="/images/{{thumbnail}}" alt="Thumbnail for post: {{title}}"></a>
            <h2 class="blog-post-preview-title"><a href="/post/{{p_id}}">{{title}}</a></h2>
            <p class="blog-post-preview-meta">By <a href="/author/{{user_name_id}}">{{user_name}}</a>, {{time}}</p>
            <p>{{byline}}</p>
            <p style="clear: both; margin: 0px;">{{#tags}}<a class="blog-post-tag" href="/tag/{{.}}">{{.}}</a> {{/tags}}</p>
            {{/rewrite}}
            {{^rewrite}}
            <a href="{{script_name}}?page={{page_name}}&id={{p_id}}"><img class="blog-post-preview-img" src="/images/{{thumbnail}}" alt="Thumbnail for post: {{title}}"></a>
            <a href="{{script_name}}?page={{page_name}}&id={{p_id}}"><h2 class="blog-post-preview-title">{{title}}</h2></a>
            <p class="blog-post-preview-meta">By <a href="{{script_name}}?author={{user_name_id}}">{{user_name}}</a>, {{time}}</p>
            <p>{{byline}}</p>
            <p style="clear: both; margin: 0px;">{{#tags}}<a class="blog-post-tag" href="{{script_name}}?tag={{.}}">{{.}}</a> {{/tags}}</p>
            {{/rewrite}}
        </div>
        {{/posts}}
        {{^posts}}
        <h2 class="blog-post-title" style="text-align: center;">No Posts Found</h2>
        {{/posts}}
        
        
        {{#nav_buttons}}
        <nav><ul class="pager">
        {{#rewrite}}
        {{#older}}
        <li style="float: left"><a href="{{#tag}}/tag/{{.}}?{{/tag}}{{^tag}}{{#search}}/search?search={{.}}{{/search}}{{^search}}?{{/search}}{{#search}}&{{/search}}{{/tag}}start={{.}}">Older</a></li>
        {{/older}}
        {{/rewrite}}
        {{^rewrite}}
        {{#older}}
        <li style="float: left"><a href="{{script_name}}?{{query_string_wo_start}}&start={{.}}">Older</a></li>
        {{/older}}
        {{/rewrite}}
    
        {{#rewrite}}
        {{#newer}}
        <li style="float: right"><a href="{{#tag}}/tag/{{.}}?{{/tag}}{{^tag}}{{#search}}/search?search={{.}}{{/search}}{{^search}}?{{/search}}{{#search}}&{{/search}}{{/tag}}start={{.}}">Newer</a></li>
        {{/newer}}
        {{/rewrite}}
        {{^rewrite}}
        {{#newer}}
        <li style="float: right"><a href="{{script_name}}?{{query_string_wo_start}}&start={{.}}">Newer</a></li>
        {{/newer}}
        {{/rewrite}}
        </ul></nav>
        {{/nav_buttons}}

    </div>
    <div class="col-sm-3">
        {{> sidebar.m}}
    </div>
</div>

</div>

</body>

{{> footer.m}}

</html>
