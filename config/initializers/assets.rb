#e sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w(mainpageindex.css)
Rails.application.config.assets.precompile += %w(mainpageindex.js)
Rails.application.config.assets.precompile += %w(reviewsnew.css)
Rails.application.config.assets.precompile += %w(reviewsnew.js)
Rails.application.config.assets.precompile += %w(reviewsedit.css)
Rails.application.config.assets.precompile += %w(reviewsedit.js)
Rails.application.config.assets.precompile += %w(reviewsshow.css)
Rails.application.config.assets.precompile += %w(reviewsshow.js)
Rails.application.config.assets.precompile += %w(reviewscreate.css)
Rails.application.config.assets.precompile += %w(reviewscreate.js)
Rails.application.config.assets.precompile += %w(reviewsupdate.css)
Rails.application.config.assets.precompile += %w(reviewsupdate.js)
Rails.application.config.assets.precompile += %w(an_words.js)
Rails.application.config.assets.precompile += %w(custom.js)

