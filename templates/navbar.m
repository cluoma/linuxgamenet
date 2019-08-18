<!-- Navigation -->
<div class="navbar">
    <div class="container">

        <!-- Brand and toggle get grouped for better mobile display -->
        <input type="checkbox" id="navbar-toggle-cbox">
        <label for="navbar-toggle-cbox" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        </label>
        <div class="navbar-header">
        {{#rewrite}}
        <a href="/">
        {{/rewrite}}
        {{^rewrite}}
        <a href="{{script_name}}">
        {{/rewrite}}
        <img src="/images/logo3.svg" width="40" height="29" style="vertical-align: top; margin-top: -3px; margin-bottom: -10px;" alt="LinuxGameNetwork Logo">
            {{navbar_title}}
        </a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul>
        {{#pages}}
        <li>
            {{#rewrite}}
            <a {{#active}}class="active"{{/active}}href="/{{id_name}}">{{name}}</a>
            {{/rewrite}}
            {{^rewrite}}
            <a {{#active}}class="active"{{/active}}href="{{script_name}}?page={{id_name}}">{{name}}</a>
            {{/rewrite}}
        </li>
        {{/pages}}
        </ul>
        </div> <!-- navbar collapse -->
    </div>
</div>
