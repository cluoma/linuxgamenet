<!DOCTYPE html><html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Linux Game Network is the source for all things related Linux, gaming, and Linux gaming. News, reviews, and more.">
<meta name="author" content="Garpike">
<meta name="keywords" content="gaming, linux, games, oss, news, reviews">
<title>{{#posts}}{{title}} - {{owner}}{{/posts}}{{^posts}}{{title}}{{/posts}}</title>
<link rel="stylesheet" href="/css/bittyblog.css" />
<style>body {padding-top: 70px;}</style>
<link rel="shortcut icon" type="image/png" href="/images/favicon.png" />
<link rel="apple-touch-icon" href="/images/favicon.png" />
<link rel="canonical" href="https://www.linuxgame.net/post/{{#posts}}{{p_id}}{{/posts}}" />
</head>

{{> navbar.m}}

<div class="container">
<div class="row">
    <div class="col-sm-8 blog-main">

        {{#search}}
        <!-- Search notification box -->
        <div class="panel panel-default" style="border-color: #428bca">
        <div class="panel-heading" style="background-color: #428bca; color: #fff">Search</div>
        <div class="panel-body">
        <p>Showing blog posts containing the search phrase: <b>{{.}}</b></p>
        </div>
        </div>
        {{/search}}
        {{#tag}}
        <!-- Search notification box -->
        <div class="panel panel-default" style="border-color: #428bca">
        <div class="panel-heading" style="background-color: #428bca; color: #fff">Tag</div>
        <div class="panel-body">
        <p>Showing blog posts sorted under the tag: <b>{{.}}</b></p>
        </div>
        </div>
        {{/tag}}

        {{#posts}}
        <div class="blog-post">
        {{#rewrite}}
        <h2 class="blog-post-title"><a href="/post/{{p_id}}">{{title}}</a></h2>
        {{/rewrite}}
        {{^rewrite}}
        <h2 class="blog-post-title"><a href="{{script_name}}?page={{page_name}}&id={{p_id}}">{{title}}</a></h2>
        {{/rewrite}}
        <p class="blog-post-meta">{{time}}</p>
            <p>{{&text}}</p>
        <hr style="border-color: #aaaaaa; margin-top: 20px;">
        {{#rewrite}}
        <p style="clear: both; margin: 0px;"><b>Tags:</b> {{#tags}}<a class="blog-post-tag" href="/tag/{{.}}">{{.}}</a> {{/tags}}</p>
        {{/rewrite}}
        {{^rewrite}}
        <p style="clear: both; margin: 0px;"><b>Tags:</b> {{#tags}}<a class="blog-post-tag" href="{{script_name}}?tag={{.}}">{{.}}</a> {{/tags}}</p>
        {{/rewrite}}
	<hr style="border-color: #aaaaaa; margin-top: 18px; margin-bottom: 0px;">
	<br>
	<br>
	<div id="commento"></div>
	<script defer src="https://commento.linuxgame.net/js/commento.js"></script>

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
