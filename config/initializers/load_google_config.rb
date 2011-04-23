raw_config = File.read("#{Rails.root}/config/google_config.yml")
GOOGLE_CONFIG = YAML.load(raw_config)[Rails.env].symbolize_keys
