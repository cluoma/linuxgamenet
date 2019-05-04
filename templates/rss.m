<?xml version="1.0" encoding="UTF-8" ?>
<rss version="2.0">
<channel>

  <title>{{title}}</title>
  {{#rewrite}}<link>https://linuxgame.net/{{page_name}}</link>{{/rewrite}}{{^rewrite}}<link>https://linuxgame.net{{script_name}}?page={{page_name}}</link>{{/rewrite}}
  <description>Linux gaming news, reviews, and more!</description>
  <language>en-ca</language>
  <category>Linux gaming</category>
  <copyright>Copyright {{current_year}} {{owner}}</copyright>

  {{#posts}}
  <item>
    <title>{{title}}</title>
    {{#rewrite}}<link>https://linuxgame.net/post/{{p_id}}</link>{{/rewrite}}{{^rewrite}}<link>https://linuxgame.net{{script_name}}?page={{page_name}}&id={{p_id}}</link>{{/rewrite}}
    {{#rewrite}}<guid>https://linuxgame.net/post/{{p_id}}</guid>{{/rewrite}}{{^rewrite}}<guid>https://linuxgame.net{{script_name}}?page={{page_name}}&id={{p_id}}</guid>{{/rewrite}}
    <description><![CDATA[<img src="https://linuxgame.net/images/{{thumbnail}}" alt="Article thumbnail" height=200>
    <p>{{byline}}</p>]]></description>
    {{#tags}}<category>{{.}}</category>{{/tags}}
    <pubDate>{{time_rss}}</pubDate>
  </item>
  {{/posts}}

</channel>
</rss> 
