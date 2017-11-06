

YAML.load_file('config/ffd-videos.yml').tap do |config|
  CATEGORY = config['category']
end
