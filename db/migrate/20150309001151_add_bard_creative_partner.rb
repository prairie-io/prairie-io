class AddBardCreativePartner < ActiveRecord::Migration
  def change
    Partner.create(
      name:             "Bard Creative",
      url:              "http://bardcreative.com",
      logo:             File.open(Rails.root.join("app/assets/images/bard-creative.png")),
      description_html: '<p>Bard Creative has helped us to form our visual identity that aligned with our goals and vision through their mastery of branding. We could not have been happier with their work; it is pure excellence. Read more about it <a href="http://bardcreative.com/work/prairie-io/">here</a>.</p>'
    )
  end
end
