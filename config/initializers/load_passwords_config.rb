raw_config = File.read("#{Rails.root}/config/passwords_config.yml")
PASSWORDS_CONFIG = YAML.load(raw_config)[Rails.env].symbolize_keys
