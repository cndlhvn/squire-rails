# encoding: utf-8
module SquireRails
  module Generators
    class ExampleGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      desc "This generator installs Squire to Asset Pipeline"
      
      def create_html_file
        template "Squire-UI.html", File.join('public/',"Squire-UI.html")
        template "Squire-UI.js", File.join('app/assets/javascripts/squire/',"Squire-UI.js")
        template "drop.min.js", File.join('app/assets/javascripts/squire/',"drop.min.js")
        template "Squire-UI.css", File.join('app/assets/stylesheets/squire/',"Squire-UI.css")
      end
    end
  end
end
