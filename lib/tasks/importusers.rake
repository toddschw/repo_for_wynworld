task :importusers => :environment do
    require 'json'


    file = File.read('usersdata.json')
    data_hash = JSON.parse(file)

    data_hash.each do | key, value |
      record_count = value.count
      for i in 0..(record_count - 1)
        puts i
        user = User.create! value
      end
    end
end
