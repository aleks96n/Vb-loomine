I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')]


I18n.config.available_locales = [:en, :ee, :ru]
# Set default locale to something other than :en
I18n.default_locale = :ee
