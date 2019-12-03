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


  config.lograge.logger = ActiveSupport::Logger.new "#{Rails.root}/log/lograge_#{Rails.env}.log"
end

# {"method":"POST","path":"/books","format":"html","controller":"BooksController",
#   "action":"create","status":302,"duration":62.47,"view":0.0,"db":9.86,
#   "location":"http://localhost:3000/books/5","time":"2019-12-03T00:04:58.739+01:00",
#   "host":"localhost","username":"Susanna Verdi",
#   "@timestamp":"2019-12-02T23:04:58.739Z","@version":"1",
#   "message":"[302] POST /books (BooksController#create)"}
