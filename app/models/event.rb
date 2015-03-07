class Event < ActiveRecord::Base
  geocoded_by :full_street_address
  after_validation :geocode, :set_time_zone

  has_attached_file :logo, styles: {
    medium: "",
    thumb: ""
  },
  convert_options: {
    medium: "-gravity north -thumbnail 600x600^ -extent 600x600",
    thumb:  "-gravity north -thumbnail 200x200^ -extent 200x200"
  }, default_url: "/images/:style/missing.png"
  validates_attachment :logo, presence: true, content_type: { content_type: /\Aimage\/.*\Z/ }

  # Scopes
  scope :approved,        -> { where(is_approved: true) }
  scope :chronological,   -> { order(:starts_at) }
  scope :published,       -> { approved.chronological }

  # Relationships
  has_many :tickets
  has_many :users, through: :tickets

  validates :ends_at, presence: true
  validates :starts_at, presence: true

  # Returns street address.
  #
  #Example:
  #   "123 45th St S, Apt 123"
  #
  # @return [String]
  def first_line
    address = ""
    address += self.address1        unless self.address1.blank?
    address += ", #{self.address2}" unless self.address2.blank?
    address
  end

  # Returns the full address as one line.
  # It checks each address field to make sure not to
  # include extra commas with blank text.
  #
  # Examples:
  #   "123 45th St S, Apt 123, Fargo, ND 58104"
  #   "Fargo, ND 58104"
  #
  # @return [String]
  def full_street_address
    address = ""
    address += self.address1        unless self.address1.blank?
    address += ", #{self.address2}" unless self.address2.blank?
    address += ", " unless address.blank?
    address += "#{self.city}, #{self.state}"
    address += " #{self.zipcode}" unless self.zipcode.blank?
    address
  end

  def localized_ends_at
    self.ends_at.in_time_zone(self.time_zone)
  end

  def localized_starts_at
    self.starts_at.in_time_zone(self.time_zone)
  end

  # Returns City, State, and Zip code.
  #
  #Example:
  #   "Fargo, ND 58104"
  #
  # @return [String]
  def second_line
    address = ""
    address += "#{self.city}, #{self.state}"
    address += " #{self.zipcode}" unless self.zipcode.blank?
    address
  end

  def send_invitation_emails
    User.subscribed.each do |user|
      EventMailer.invitation(self.id, user.id).deliver
    end
  end

private

  def set_time_zone
    return unless self.latitude && self.longitude

    result = GoogleTimezone.fetch(self.latitude, self.longitude)

    if result.success?
      self.time_zone = result.time_zone_id
    end
  end

end
