class User < ActiveRecord::Base
  acts_as_paranoid

  before_validation :set_hex

  # Devise Modules
  # - Also available: :lockable, and :timeoutable
  devise :async, :confirmable, :database_authenticatable, :invitable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: {
    medium: "",
    thumb: ""
  },
  convert_options: {
    medium: "-gravity north -thumbnail 520x720^ -extent 520x720",
    thumb:  "-gravity north -thumbnail 200x200^ -extent 200x200"
  },
  default_url: "/images/:style/missing.png"

  # Validations
  validates_attachment :avatar, presence: true, content_type: { content_type: /\Aimage\/.*\Z/ }
  validates :email, uniqueness: true, email: true
  validates :name, presence: true
  validates :hex, presence: true, uniqueness: true
  validate :not_domain_email
  validate :not_placeholder_name
  validate :not_placeholder_passwords

  # Relationships
  has_many :tickets
  has_many :events, through: :tickets
  has_many :applications, class_name: "Doorkeeper::Application", as: :owner

  # Scopes
  scope :approved,        -> { where(is_approved: true) }
  scope :chronological,   -> { order(:created_at) }
  scope :ordered_by_name, -> { order("LOWER(name)") }
  scope :published,       -> { approved.chronological }
  scope :subscribed,      -> { where(is_subscribed: true) }

  def attending?(event)
    return false unless event

    ticket = self.tickets.where(event: event).first

    ticket ? true : false
  end

  def authorizations
    Doorkeeper::AccessGrant.where({ resource_owner_id: self.id, revoked_at: nil }).select("DISTINCT application_id")
  end

  # Returns whether or not the user can perform
  # an action on a subject based on roles/permissions.
  # @param action [Symbol]
  # @param subject [Object]
  def can?(action, subject, *args)
    ability = Ability.new(self)
    ability.can?(action, subject, *args)
  end

  # Returns the name to be displayed for the user. The user's name will be
  # returned if it exists and will fall back to the user's email address.
  # @return [String]
  def display_name
    self.name.blank? ? self.email : self.name
  end

  def self.find_by_hex(hex)
    user = self.find_by(hex: params[:user_hex])
    user.reset_hex!

    user
  end

  # The String representation of the user.
  # @return [String]
  def to_s
    "#{self.class} ##{self.id} | #{self.name.blank? ? self.email : "#{self.name} <#{self.email}>"}"
  end

  def password_match?
    self.errors[:password] << "can't be blank" if password.blank?
    self.errors[:password_confirmation] << "can't be blank" if password_confirmation.blank?
    self.errors[:password_confirmation] << "does not match password" if password != password_confirmation
    password == password_confirmation && !password.blank?
  end

  def reset_hex!
    self.hex = SecureRandom.hex
    self.save
  end

  # Returns the image to use for the sponsoring of an event, since we need to call it on a polymorphic relationship
  def sponsor_image
    self.avatar
  end

  def set_hex
    self.hex ||= SecureRandom.hex
  end

private

  def not_domain_email
    email_domain = self.email.split("@").last

    errors.add(:email_domain, "is prairie.io") if email_domain == "prairie.io"
  end

  def not_placeholder_name
    self.errors[:name] << "can't be 'Barry Bison'" if name == "Barry Bison"
  end

  def not_placeholder_passwords
    self.errors[:password] << "can't be 'password_123'" if password == "password_123"
    self.errors[:password] << "can't be 'not_password_123'" if password == "not_password_123"
    self.errors[:password] << "can't be 'still_not_password_123'" if password == "still_not_password_123"
  end

end
