# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
 
  rewards_rules = [
    "1-5",
    "3-2",
    "6-4",
    "10-5"
  ]

  rewards_rules.each do |rule|
    rule = rule.split("-")
    Reward.create!(referrer: rule[0], referred: rule[1])
  end
  RewardRule.destroy_all

  RewardRule.create!(min_amount: 0, max_amount: 10, referrer_amount: 1, referred_amount: 0)
  RewardRule.create!(min_amount: 10, max_amount: 50, referrer_amount: 3, referred_amount: 2)
  RewardRule.create!(min_amount: 50, max_amount: 100, referrer_amount: 6, referred_amount: 4)
  RewardRule.create!(min_amount: 100, max_amount: nil, referrer_amount: 10, referred_amount: 5)
  
  puts "Reward rules seeded successfully!"
  