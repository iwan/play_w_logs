Rails.application.configure do
  config.lograge.enabled = true
  # add time to lograge
  config.lograge.custom_options = lambda do |event|
    { time: Time.now }
  end

  config.lograge.custom_payload do |controller|
    {
      host: controller.request.host,
      username: ['Mario Rossi', 'Susanna Verdi', 'Camilla Ferrari', 'Luca Cremona', 'Angela Fantozzi'].sample
      # account_id: controller.current_account.try(:id),
    }
  end

  config.lograge.formatter = Lograge::Formatters::Logstash.new
end
