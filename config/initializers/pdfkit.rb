PDFKit.configure do |config|
  config.wkhtmltopdf = '/Users/tesstryan/.rvm/gems/ruby-2.0.0-p247/bin/wkhtmltopdf'
  config.default_options = {
    :page_size => 'Letter',
    :print_media_type => true
  }
  # Use only if your external hostname is unavailable on the server.
  config.root_url = "http://localhost:3000" 

end
