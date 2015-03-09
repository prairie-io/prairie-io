class Partner < ActiveRecord::Base
  has_attached_file :logo, styles: {
    medium: "",
    thumb: ""
  },
  convert_options: {
    medium: "-gravity north -thumbnail 600x600^ -extent 600x600",
    thumb:  "-gravity north -thumbnail 200x200^ -extent 200x200"
  }, default_url: "/images/:style/missing.png"
  validates_attachment :logo, presence: true, content_type: { content_type: /\Aimage\/.*\Z/ }
end
