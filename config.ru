require "rack"
require "sprockets"
require "brochure"

root = File.dirname(__FILE__)

assets = Sprockets::Environment.new(root) do |env|
  env.logger = Logger.new(STDOUT)
end

assets.append_path(File.join(root, 'assets'))
assets.append_path(File.join(root, 'assets', 'images'))
assets.append_path(File.join(root, 'assets', 'javascripts'))
assets.append_path(File.join(root, 'assets', 'stylesheets'))

map "/assets" do
  run assets
end

run Brochure.app(root)
