CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAJQUFHAR734SNP72A',
    :aws_secret_access_key  => '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',
    :region                 => 'ap-northeast-1'
  }

 # config.fog_directory = 'dreamspace' if Rails.env.production?
  config.fog_directory = 'dreamspace' if Rails.env.development?

end