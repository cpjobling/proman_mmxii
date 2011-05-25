raw_config = File.read("#{Rails.root}/config/settings.yml")
SETTINGS = YAML.load(raw_config).symbolize_keys
