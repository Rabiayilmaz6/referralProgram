class ReferralCode < ApplicationRecord
  belongs_to :user
  has_many :referrals, dependent: :destroy

  validates :code, presence: true, uniqueness: true

  def self.generate_unique_code
    loop do
      code = SecureRandom.alphanumeric(8).upcase
      break code unless ReferralCode.exists?(code: code)
    end
  end
end
