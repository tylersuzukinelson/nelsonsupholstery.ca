CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV['AWS_ACCESS_TOKEN'],                        # required
    aws_secret_access_key: ENV['AWS_SECRET_TOKEN'],                        # required
    region: 'us-west-2'
  }
  config.fog_directory  = 'nelsonsupholstery'                          # required
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end
