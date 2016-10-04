class Owner < ActiveRecord::Base
  validates :first_name, presence: true, length: {maximum: 255}
  validates :last_name, presence: true, length: {maximum: 255}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}

  before_save :normalize_phone_number

  # gsub selector syntax?
  def normalize_phone_number
    if phone.present?
      phone.gsub!(/^1/, "")
      phone.gsub!(/[()-.]/,"")
    end
  end

end
