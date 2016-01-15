task :importemployments => :environment do
    require 'json'

    file = File.read('employmentdata.json')
    data_hash = JSON.parse(file)

    data_hash.each do | key, value |
      record_count = value.count
      for i in 0..(record_count - 1)
        puts i
        Employment.create! value[i]
      end
    end
end
