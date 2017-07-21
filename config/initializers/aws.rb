Aws.config.update({
  region: 'us-east-2',
  credentials: Aws::Credentials.new(ENV['AWS_ACCESS'], ENV['AWS_SECRET']),
})

S3_BUCKET = Aws::S3::Resource.new.bucket(ENV['AWS_AVATAR_BUCKET'])
