# Amazon S3 Preferences
Paperclip::Attachment.default_options[:storage] = :s3
Paperclip::Attachment.default_options[:s3_credentials] = {
  access_key_id:     ENV["AMAZON_S3_KEY"],
  secret_access_key: ENV["AMAZON_S3_SECRET"],
  bucket:            ENV["AMAZON_S3_IMAGES_BUCKET"]
}

if ENV["AMAZON_S3_IMAGES_CDN"]
  Paperclip::Attachment.default_options[:path] = ":class/:attachment/:id_partition/:style/:filename"
  Paperclip::Attachment.default_options[:s3_host_alias] = ENV["AMAZON_S3_IMAGES_CDN"]
  Paperclip::Attachment.default_options[:url] = ":s3_alias_url"
end
