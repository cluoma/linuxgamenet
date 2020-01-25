<!DOCTYPE html><html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="{{#posts}}{{byline}}{{/posts}}">
<meta name="author" content="Garpike">
<meta name="keywords" content="gaming, linux, video games, news, reviews{{#posts}}{{#tags}}, {{.}}{{/tags}}{{/posts}}">
<title>{{#posts}}{{title}} - {{owner}}{{/posts}}{{^posts}}{{title}}{{/posts}}</title>
<link rel="stylesheet" href="/css/bittyblog.min.css" />
<style>body {padding-top: 70px;}</style>
<link rel="shortcut icon" type="image/png" href="/images/favicon.png" />
<link rel="apple-touch-icon" href="/images/favicon.png" />
<link rel="canonical" href="https://www.linuxgame.net/post/{{#posts}}{{p_id}}{{/posts}}" />

<meta name="twitter:card" content="summary" />
<meta name="twitter:site" content="@LinuxGameDotNet" />
<meta name="twitter:title" content="{{#posts}}{{title}}{{/posts}}" />
<meta name="twitter:description" content="{{#posts}}{{byline}}{{/posts}}" />
<meta name="twitter:image" content="https://www.linuxgame.net/images/{{#posts}}{{thumbnail}}{{/posts}}" />
</head>

{{> navbar.m}}

<div class="container">
<div class="row">
    
    <!--{{> twitch_banner.m}}-->
    
    <div class="col-sm-9">

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

        <h2 class="blog-post-title">{{title}}</h2>
        
        {{#rewrite}}<p class="blog-post-meta">By <a href="/author/{{user_name_id}}">{{user_name}}</a>, {{time}}</p>{{/rewrite}}
        {{^rewrite}}<p class="blog-post-meta">By <a href="{{script_name}}?author={{user_name_id}}">{{user_name}}</a>, {{time}}</p>{{/rewrite}}

        <!-- Sharingbutton Facebook -->
        <a class="resp-sharing-button__link" href="https://facebook.com/sharer/sharer.php?u=https%3A%2F%2Fwww.linuxgame.net%2Fpost%2F{{p_id}}" target="_blank" rel="noopener" aria-label="Share on Facebook">
        <div class="resp-sharing-button resp-sharing-button--facebook resp-sharing-button--large"><div aria-hidden="true" class="resp-sharing-button__icon resp-sharing-button__icon--solid">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M18.77 7.46H14.5v-1.9c0-.9.6-1.1 1-1.1h3V.5h-4.33C10.24.5 9.5 3.44 9.5 5.32v2.15h-3v4h3v12h5v-12h3.85l.42-4z"/></svg>
        </div>Share on Facebook</div>
        </a>
  
        <!-- Sharingbutton Twitter -->
        <a class="resp-sharing-button__link" href="https://twitter.com/intent/tweet/?text=Check%20this%20out!&amp;url=https%3A%2F%2Fwww.linuxgame.net%2Fpost%2F{{p_id}}" target="_blank" rel="noopener" aria-label="Share on Twitter">
        <div class="resp-sharing-button resp-sharing-button--twitter resp-sharing-button--large"><div aria-hidden="true" class="resp-sharing-button__icon resp-sharing-button__icon--solid">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M23.44 4.83c-.8.37-1.5.38-2.22.02.93-.56.98-.96 1.32-2.02-.88.52-1.86.9-2.9 1.1-.82-.88-2-1.43-3.3-1.43-2.5 0-4.55 2.04-4.55 4.54 0 .36.03.7.1 1.04-3.77-.2-7.12-2-9.36-4.75-.4.67-.6 1.45-.6 2.3 0 1.56.8 2.95 2 3.77-.74-.03-1.44-.23-2.05-.57v.06c0 2.2 1.56 4.03 3.64 4.44-.67.2-1.37.2-2.06.08.58 1.8 2.26 3.12 4.25 3.16C5.78 18.1 3.37 18.74 1 18.46c2 1.3 4.4 2.04 6.97 2.04 8.35 0 12.92-6.92 12.92-12.93 0-.2 0-.4-.02-.6.9-.63 1.96-1.22 2.56-2.14z"/></svg>
        </div>Share on Twitter</div>
        </a>
        
        <div class="blog-post-text">
        {{&text}}
        </div>
        
        <hr style="border-color:#aaaaaa;margin-top:20px;margin-bottom:0px;">
        {{#rewrite}}
        <p style="clear: both; margin-top: 1em;margin-bottom:1em;"><b>Tags:</b> {{#tags}}<a class="blog-post-tag" href="/tag/{{.}}">{{.}}</a> {{/tags}}</p>
        {{/rewrite}}
        {{^rewrite}}
        <p style="clear: both; margin-top: 1em;margin-bottom:1em;"><b>Tags:</b> {{#tags}}<a class="blog-post-tag" href="{{script_name}}?tag={{.}}">{{.}}</a> {{/tags}}</p>
        {{/rewrite}}
	    <hr style="border-color:#aaaaaa;margin-top: 0px;margin-bottom:0px;">
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
    <div class="col-sm-3">
        {{> sidebar.m}}
    </div>
</div>

</div>

{{> footer.m}}

</html>
