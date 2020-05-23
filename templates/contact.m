<!DOCTYPE html><html lang="en">
<head>
{{> head.m}}
</head>

{{> navbar.m}}

<div class="container">
<div class="row">
    
    {{> twitch_banner.m}}

    <div class="col-sm-9">
    
    {{#posts}}
    <div class="panel">
    <div class="panel-heading">{{title}}</div>
    <div class="panel-body">
    <div class="blog-post-text" style="margin-top:0;">{{&text}}</div>
    </div>
    </div>
    {{/posts}}
    {{^posts}}
    <h2 class="blog-post-title" style="text-align: center;">No Posts Found</h2>
    {{/posts}}


    {{#nav_buttons}}
    <nav><ul class="pager">
    {{#rewrite}}
    {{#older}}
    <li><a href="{{#tag}}/tag/{{.}}?{{/tag}}{{^tag}}{{#search}}/search?search={{.}}{{/search}}{{^search}}?{{/search}}{{#search}}&{{/search}}{{/tag}}start={{.}}">Older</a></li>
    {{/older}}
    {{/rewrite}}
    {{^rewrite}}
    {{#older}}
    <li><a href="{{script_name}}?{{query_string_wo_start}}&start={{.}}">Older</a></li>
    {{/older}}
    {{/rewrite}}
    
    {{#rewrite}}
    {{#newer}}
    <li><a href="{{#tag}}/tag/{{.}}?{{/tag}}{{^tag}}{{#search}}/search?search={{.}}{{/search}}{{^search}}?{{/search}}{{#search}}&{{/search}}{{/tag}}start={{.}}">Newer</a></li>
    {{/newer}}
    {{/rewrite}}
    {{^rewrite}}
    {{#newer}}
    <li><a href="{{script_name}}?{{query_string_wo_start}}&start={{.}}">Newer</a></li>
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

{{> footer.m}}

</html>
