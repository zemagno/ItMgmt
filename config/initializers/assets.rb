# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.enabled = true

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )


Rails.application.config.assets.precompile += %w( jquery-ui.css chavecis.css CMDBstyle.css scaffold.css jquery-ui-timepicker-addon.css jquery.datetimepicker.css bootstrap.min.css itam.css tela_login.css)
Rails.application.config.assets.precompile += %w( jquery.js jquery-ui.js jquery-ujs.js application.js jquery.datetimepicker.js jquery.min.js jquery-ui.min.js utils.js bootstrap.min.js)
Rails.application.config.assets.precompile += %w( DataTables-1.10.5/media/css/jquery.dataTables.min.css DataTables-1.10.5/media/js/jquery.dataTables.min.js )

#                           