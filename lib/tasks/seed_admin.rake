namespace :admins do
  admins = [['rskrocks1@gmail.com', 'ravicool21'], ['ducs.sankalan2016@gmail.com', 'ravicool21'], ['nikhil.mca.du.2014@gmail.com', 'ravicool21']]
  desc "Seeding Admins"
  task seed: :environment do
    admins.each do |admin|
      puts "Seeding admin #{admin.first}"
      Admin.create(email: admin.first, password: admin.last)
    end
  end
end
