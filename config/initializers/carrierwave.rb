CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp') # adding these...
  config.cache_dir = "#{Rails.root}/tmp/uploads" # ...two lines

  config.fog_credentials = {
    :provider => 'AWS',       # required
    :aws_access_key_id => ENV['AWS_KEY'],       # required
    :aws_secret_access_key => ENV['AWS_SECRET'],
    # :region => ENV['S3_REGION']       # required
  }
  config.fog_directory  = ENV['S3_BUCKET_NAME']
end
