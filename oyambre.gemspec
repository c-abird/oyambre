# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "oyambre"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Claas Abert"]
  s.date = "2013-04-28"
  s.email = "claas@cabird.de"
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "app/assets/fonts/superpoint-webfont.eot",
    "app/assets/fonts/superpoint-webfont.svg",
    "app/assets/fonts/superpoint-webfont.ttf",
    "app/assets/fonts/superpoint-webfont.woff",
    "app/assets/images/oyambre/flags/de.png",
    "app/assets/images/oyambre/flags/en.png",
    "app/assets/images/oyambre/flags/es.png",
    "app/assets/images/oyambre/flags/fr.png",
    "app/assets/images/oyambre/header.png",
    "app/assets/images/oyambre/header_01.jpg",
    "app/assets/images/oyambre/header_02.jpg",
    "app/assets/images/oyambre/header_03.jpg",
    "app/assets/images/oyambre/header_04.jpg",
    "app/assets/images/oyambre/header_05.jpg",
    "app/assets/images/oyambre/header_06.jpg",
    "app/assets/images/oyambre/header_07.jpg",
    "app/assets/images/oyambre/header_08.jpg",
    "app/assets/images/oyambre/header_09.jpg",
    "app/assets/images/oyambre/icons.png",
    "app/assets/images/oyambre/icons/application_add.png",
    "app/assets/images/oyambre/icons/application_cascade.png",
    "app/assets/images/oyambre/icons/application_delete.png",
    "app/assets/images/oyambre/icons/application_edit.png",
    "app/assets/images/oyambre/icons/world_delete.png",
    "app/assets/images/oyambre/icons/world_go.png",
    "app/assets/images/oyambre/modelicons/audio.png",
    "app/assets/images/oyambre/modelicons/dates.png",
    "app/assets/images/oyambre/modelicons/folders.png",
    "app/assets/images/oyambre/modelicons/images.png",
    "app/assets/images/oyambre/modelicons/movies.png",
    "app/assets/images/oyambre/modelicons/pages.png",
    "app/assets/images/oyambre/modelicons/popups.png",
    "app/assets/images/oyambre/modelicons/review_excerpts.png",
    "app/assets/images/oyambre/modelicons/reviews.png",
    "app/assets/images/oyambre/modelicons/things.png",
    "app/assets/images/oyambre/thumb_file.png",
    "app/assets/images/oyambre/thumb_none.png",
    "app/assets/javascripts/oyambre/admin.js",
    "app/assets/javascripts/oyambre/jquery.filestyle.js",
    "app/assets/stylesheets/oyambre/admin.scss",
    "app/controllers/admin/oyambre_controller.rb",
    "app/controllers/admin/pages_controller.rb",
    "app/controllers/admins_controller.rb",
    "app/controllers/sessions_controller.rb",
    "app/helpers/admins_helper.rb",
    "app/helpers/application_helper.rb",
    "app/helpers/sessions_helper.rb",
    "app/models/admin.rb",
    "app/models/page.rb",
    "app/models/page_attachment.rb",
    "app/views/admin/oyambre/overview.html.erb",
    "app/views/admins/_admin_bar.html.erb",
    "app/views/admins/new.html.erb",
    "app/views/layouts/admin.html.erb",
    "app/views/sessions/new.html.erb",
    "config/locales/de.inshalla.yml",
    "config/locales/de.yml",
    "config/locales/en.inshalla.yml",
    "config/routes.rb",
    "lib/authentication/authenticated_system.rb",
    "lib/authentication/authentication.rb",
    "lib/authentication/by_cookie_token.rb",
    "lib/authentication/by_password.rb",
    "lib/extensions/acts_as_publishable.rb",
    "lib/extensions/as_form_column_helpers.rb",
    "lib/extensions/as_sortable_helpers.rb",
    "lib/extensions/migration_helper.rb",
    "lib/extensions/paperclip_extension.rb",
    "lib/extensions/paperclip_form_ui.rb",
    "lib/extensions/routing_mapper.rb",
    "lib/oyambre.rb",
    "lib/oyambre/admin_controller.rb",
    "lib/oyambre/application_controller.rb",
    "lib/oyambre/application_helper.rb",
    "lib/oyambre/engine.rb",
    "lib/rails/generators/oyambre/oyambre_generator.rb",
    "lib/rails/generators/oyambre/templates/initializer.rb",
    "lib/rails/generators/oyambre/templates/migration.rb",
    "lib/rails/generators/oyambre/templates/schema.rb",
    "lib/rails/generators/oyambre_controller/USAGE",
    "lib/rails/generators/oyambre_controller/oyambre_controller_generator.rb",
    "lib/rails/generators/oyambre_controller/templates/controller.rb",
    "lib/rails/generators/oyambre_controller/templates/helper.rb",
    "lib/rails/generators/oyambre_resource/USAGE",
    "lib/rails/generators/oyambre_resource/oyambre_resource_generator.rb",
    "lib/rails/railties/tasks.rake"
  ]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "Description of your gem"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<globalize3>, [">= 0"])
      s.add_runtime_dependency(%q<active_scaffold>, [">= 0"])
      s.add_runtime_dependency(%q<active_scaffold_sortable>, [">= 0"])
      s.add_runtime_dependency(%q<tinymce-rails>, [">= 0"])
      s.add_runtime_dependency(%q<tinymce-rails-langs>, [">= 0"])
      s.add_runtime_dependency(%q<jquery-ui-rails>, [">= 0"])
      s.add_runtime_dependency(%q<acts_as_list>, [">= 0"])
      s.add_runtime_dependency(%q<paperclip>, [">= 0"])
      s.add_runtime_dependency(%q<rmagick>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<globalize3>, [">= 0"])
      s.add_dependency(%q<active_scaffold>, [">= 0"])
      s.add_dependency(%q<active_scaffold_sortable>, [">= 0"])
      s.add_dependency(%q<tinymce-rails>, [">= 0"])
      s.add_dependency(%q<tinymce-rails-langs>, [">= 0"])
      s.add_dependency(%q<jquery-ui-rails>, [">= 0"])
      s.add_dependency(%q<acts_as_list>, [">= 0"])
      s.add_dependency(%q<paperclip>, [">= 0"])
      s.add_dependency(%q<rmagick>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<globalize3>, [">= 0"])
    s.add_dependency(%q<active_scaffold>, [">= 0"])
    s.add_dependency(%q<active_scaffold_sortable>, [">= 0"])
    s.add_dependency(%q<tinymce-rails>, [">= 0"])
    s.add_dependency(%q<tinymce-rails-langs>, [">= 0"])
    s.add_dependency(%q<jquery-ui-rails>, [">= 0"])
    s.add_dependency(%q<acts_as_list>, [">= 0"])
    s.add_dependency(%q<paperclip>, [">= 0"])
    s.add_dependency(%q<rmagick>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end

