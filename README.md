#Squire rails


##Information


squire-rails gem is made on the basis of the squire.

squire-rails is possible following things.


+ It calls the javascript of squire
+ Generator of sample source code using the twitter-bootstrap and font-awesome


squire-rais is using such only javascript and css, it will also work in the any version of rails.

##Getting start
Add to this in Gemfile

```ruby
gem 'squire-rails'
```

Run bundle install command

```bash
bundle exec rake db:migrate
```

If you want to use only the javascirpt of squire, open the `app/assets/javascripts/applications.js`, writes the following.

```javascript
//= require squire/squire-raw
```

How to use the squire, please look at the github of squire.

https://github.com/neilj/Squire


##Basic usage of squire editor

Create scaffold

```bash
rails g scaffold Post title:string description:text
```
And run.

```bash
bundle exec rake db:migrate
```

Open the `app/views/posts/_form.html.erb` 
Turn off the display of description.

```ruby
<%= f.text_area :description, :style =>'display:none' %>
```
Add the following in the form_for instead.

```html
<div id="squire_action">
	<p>
		<span id="bold">Bold</span>
		<span id="removeBold">Unbold</span>
		<span id="italic">Italic</span>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span id="removeItalic">Unitalic</span>
		<span id="underline">Underline</span>
		<span id="removeUnderline">Deunderline</span>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span id="setFontSize" class="prompt">Font size</span>
		<span id="setFontFace" class="prompt">Font face</span>
	</p>
	<p>
		<span id="setTextColour" class="prompt">Text colour</span>
		<span id="setHighlightColour" class="prompt">Text highlight</span>
		<span id="makeLink" class="prompt">Link</span>
	</p>
	<p>
		<span id="increaseQuoteLevel">Quote</span>
		<span id="decreaseQuoteLevel">Dequote</span>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span id="makeUnorderedList">List</span>
		<span id="removeList">Unlist</span>
		<span id="increaseListLevel">Increase list level</span>
		<span id="decreaseListLevel">Decrease list level</span>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span id="insertImage" class="prompt">Insert image</span>
		<span id="setHTML" class="prompt">Set HTML</span>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span id="undo">Undo</span>
		<span id="redo">Redo</span>
	</p>
	<iframe id="seditor" width="500" height="300"></iframe>
</div>
```
Open the `app/views/posts/edit.html.erb`, add the following.

```ruby
<%= javascript_tag do %>
var $post_description = '<%= raw @post.description.gsub("'", "\\\\'") %>';
<% end %>

```
Open the `app/assets/javascripts/posts.js.coffee`, add the following.

```coffeescript
$(document).on 'ready page:load', ->
  $editor_id = "seditor"

  if document.getElementById($editor_id)

    iframe = $('#'+$editor_id)
    iframe[0].contentWindow.editor = new Squire(iframe[0].contentWindow.document)
    editor = iframe[0].contentWindow.editor

    document.addEventListener 'click', ((e) ->
      id = e.target.id
      value = undefined
      if id and editor and editor[id]
        if e.target.className == 'prompt'
          value = prompt('Value:')
        editor[id] value
    ), false

    if typeof $post_description != 'undefined'
      editor.setHTML $squire_description

    $('form').submit ->
      $('#post_description').val(editor.getHTML()).change()
      return

```

Open the `app/assets/stylesheets/posts.css.scss` to add the following.

```scss
#squire_action  span {
	cursor: pointer;
	text-decoration: underline;
}

#squire_action p {
  margin: 5px 0;
}
```
