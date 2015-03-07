class AutoPopulateHashesForUsers < ActiveRecord::Migration
  def change
    User.find_each do |user|
      user.update(hex: SecureRandom.hex)
      user.save
    end
  end
end
