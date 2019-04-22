<!DOCTYPE html><html>
<head>
{{> head.m}}
</head>

{{> navbar.m}}

<div class="container">
<div class="row">
    <div class="col-sm-8 blog-main">
    
    {{#posts}}
    <div class="panel panel-default" style="border-color: #428bca">
    <div class="panel-heading" style="background-color: #428bca; color: #fff">{{title}}</div>
    <div class="panel-body" style="font-size: 15px;">
    <p>{{&text}}</p>
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

    <div class="col-sm-3 col-sm-offset-1 blog-sidebar">
        
        {{> about_box.m}}
        
        <!-- Archives sidebar module-->
        <div class="sidebar-module"><h4>Archives</h4><ol class="list-unstyled">
            {{#archives}}
            {{#rewrite}}
            <li><a href="/archive/{{year}}/{{month}}">{{month_s}} {{year}} ({{post_count}})</a></li>
            {{/rewrite}}
            {{^rewrite}}
            <li><a href="{{script_name}}?month={{month}}&year={{year}}">{{month_s}} {{year}} ({{post_count}})</a></li>
            {{/rewrite}}
            {{/archives}}
        </ol></div>
    </div>

</div>
</div>

{{> footer.m}}

</html>
