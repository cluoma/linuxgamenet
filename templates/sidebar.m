<div class="search-container">
{{#rewrite}}
<form action="/search" method="get" role="search">
{{/rewrite}}
{{^rewrite}}
<form action="{{script_name}}" method="get" role="search">
{{/rewrite}}
    <input type="text" name="search" placeholder="Search">
    <button type="submit">Go</button>
</form>
</div>

{{> about_box.m}}

<div class="panel archives">
    <div class="panel-heading">Resources</div>
    <div class="panel-body">
    <ol>
    <li><a href="https://www.linuxgame.net/post/233">Steam Linux usage statistics</a></li>
    <li><a href="https://www.linuxgame.net/post/181">Helpful tools for Linux gamers</a></li>
    <li><a href="https://www.linuxgame.net/post/62">Autostart Steam Link on RPi</a></li>
    </ol>
    </div>
</div>

<!--
<div class="panel">
    <div class="panel-heading">Game Servers</div>
    <div class="panel-body">
    <a href="https://www.linuxgame.net/post/219#mcserver">Minecraft (20w16a survival)</a>
    </div>
</div>
-->

<!-- Archives sidebar module-->
<div class="panel archives">
    <div class="panel-heading">Archives</div>
    <div class="panel-body">
    <ol>
    {{#archives}}
    {{#rewrite}}
    <li><a href="/archive/{{year}}/{{month}}">{{month_s}} {{year}} ({{post_count}})</a></li>
    {{/rewrite}}
    {{^rewrite}}
    <li><a href="{{script_name}}?month={{month}}&year={{year}}">{{month_s}} {{year}} ({{post_count}})</a></li>
    {{/rewrite}}
    {{/archives}}
    </ol>
    </div>
</div>

