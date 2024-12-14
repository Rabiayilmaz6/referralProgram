# Mevcut ReferralCreditCategory'leri temizle
ReferralCreditCategory.delete_all

# Yeni ReferralCreditCategory'leri oluştur
ReferralCreditCategory.create!([
  {
    min_amount: 0,
    max_amount: 10,
    referrer_amount: 1,
    referred_amount: 0
  },
  {
    min_amount: 10,
    max_amount: 50,
    referrer_amount: 3,
    referred_amount: 2
  },
  {
    min_amount: 50,
    max_amount: 100,
    referrer_amount: 6,
    referred_amount: 4
  },
  {
    min_amount: 100,
    max_amount: nil,
    referrer_amount: 10,
    referred_amount: 5
  }
])

puts "ReferralCreditCategories seeded successfully!"
