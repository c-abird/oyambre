# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{inshalla}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Claas Abert"]
  s.date = %q{2011-05-05}
  s.email = %q{claas@cabird.de}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "app/controllers/admin/inshalla_controller.rb",
    "app/controllers/admin/pages_controller.rb",
    "app/controllers/admins_controller.rb",
    "app/controllers/sessions_controller.rb",
    "app/helpers/admins_helper.rb",
    "app/helpers/application_helper.rb",
    "app/helpers/sessions_helper.rb",
    "app/models/admin.rb",
    "app/models/page.rb",
    "app/models/page_attachment.rb",
    "app/views/admin/inshalla/overview.html.erb",
    "app/views/admins/_admin_bar.html.erb",
    "app/views/admins/new.html.erb",
    "app/views/layouts/admin.html.erb",
    "app/views/sessions/new.html.erb",
    "config/locales/de.inshalla.yml",
    "config/locales/de.yml",
    "config/locales/en.inshalla.yml",
    "config/routes.rb",
    "lib/active_record_extension.rb",
    "lib/acts_as_publishable/base.rb",
    "lib/admin_controller.rb",
    "lib/application_controller.rb",
    "lib/application_helper.rb",
    "lib/authenticated_system.rb",
    "lib/authentication.rb",
    "lib/authentication/by_cookie_token.rb",
    "lib/authentication/by_password.rb",
    "lib/engine.rb",
    "lib/extensions/as_form_column_helpers.rb",
    "lib/extensions/paperclip_form_ui.rb",
    "lib/extensions/routing_mapper.rb",
    "lib/inshalla.rb",
    "lib/migration_helper.rb",
    "lib/rails/generators/inshalla/inshalla_generator.rb",
    "lib/rails/generators/inshalla/templates/initializer.rb",
    "lib/rails/generators/inshalla/templates/migration.rb",
    "lib/rails/generators/inshalla/templates/schema.rb",
    "lib/rails/generators/inshalla_controller/USAGE",
    "lib/rails/generators/inshalla_controller/inshalla_controller_generator.rb",
    "lib/rails/generators/inshalla_controller/templates/controller.rb",
    "lib/rails/generators/inshalla_controller/templates/helper.rb",
    "lib/rails/generators/inshalla_resource/USAGE",
    "lib/rails/generators/inshalla_resource/inshalla_resource_generator.rb",
    "lib/rails/railties/tasks.rake",
    "public/fonts/generator_config.txt",
    "public/fonts/specimen_files/easytabs.js",
    "public/fonts/specimen_files/grid_12-825-55-15.css",
    "public/fonts/specimen_files/specimen_stylesheet.css",
    "public/fonts/specimen_files/superpoint-cleartype.png",
    "public/fonts/stylesheet.css",
    "public/fonts/superpoint-webfont.eot",
    "public/fonts/superpoint-webfont.svg",
    "public/fonts/superpoint-webfont.ttf",
    "public/fonts/superpoint-webfont.woff",
    "public/fonts/superpointrounded-demo.html",
    "public/images/inshalla/header.png",
    "public/images/inshalla/header_01.jpg",
    "public/images/inshalla/header_02.jpg",
    "public/images/inshalla/header_03.jpg",
    "public/images/inshalla/header_04.jpg",
    "public/images/inshalla/header_05.jpg",
    "public/images/inshalla/header_06.jpg",
    "public/images/inshalla/header_07.jpg",
    "public/images/inshalla/header_08.jpg",
    "public/images/inshalla/header_09.jpg",
    "public/images/inshalla/icon_destroy.png",
    "public/images/inshalla/icon_edit.png",
    "public/images/inshalla/icon_new.png",
    "public/images/inshalla/icons.png",
    "public/images/inshalla/thumb_file.png",
    "public/images/inshalla/thumb_none.png",
    "public/javascripts/inshalla_admin.js",
    "public/javascripts/jquery-ui-timepicker-addon.js",
    "public/javascripts/jquery-ui.js",
    "public/javascripts/jquery.filestyle.js",
    "public/javascripts/jquery.js",
    "public/javascripts/rails_jquery.js",
    "public/stylesheets/admin.css",
    "public/stylesheets/jquery-ui.css"
  ]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Description of your gem}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<globalize3>, [">= 0"])
      s.add_runtime_dependency(%q<active_scaffold_vho>, [">= 0"])
      s.add_runtime_dependency(%q<active_scaffold_sortable_vho>, [">= 0"])
      s.add_runtime_dependency(%q<tiny_mce>, [">= 0"])
      s.add_runtime_dependency(%q<acts_as_list>, [">= 0"])
      s.add_runtime_dependency(%q<paperclip>, [">= 0"])
      s.add_runtime_dependency(%q<rmagick>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<globalize3>, [">= 0"])
      s.add_dependency(%q<active_scaffold_vho>, [">= 0"])
      s.add_dependency(%q<active_scaffold_sortable_vho>, [">= 0"])
      s.add_dependency(%q<tiny_mce>, [">= 0"])
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
    s.add_dependency(%q<active_scaffold_vho>, [">= 0"])
    s.add_dependency(%q<active_scaffold_sortable_vho>, [">= 0"])
    s.add_dependency(%q<tiny_mce>, [">= 0"])
    s.add_dependency(%q<acts_as_list>, [">= 0"])
    s.add_dependency(%q<paperclip>, [">= 0"])
    s.add_dependency(%q<rmagick>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end
