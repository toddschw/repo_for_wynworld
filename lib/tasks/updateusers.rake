task :updateusers => :environment do
    require 'json'

    file = File.read('updateusersdata.json')
    data_hash = JSON.parse(file)

    data_hash.each do | key, value |
      record_count = value.count
      for i in 0..(record_count - 1)
        @user = User.find value[i]["id"]

        # puts value[i]

        puts "before:"
        puts @user.inspect

        @user.update! value[i]
        puts "after:"
        puts @user.inspect

      end
    end
end
