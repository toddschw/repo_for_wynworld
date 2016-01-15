task :importcompanies => :environment do
    require 'json'

    file = File.read('companydata.json')
    data_hash = JSON.parse(file)

    data_hash.each do | key, value |
      record_count = value.count
      for i in 0..(record_count - 1)
        puts i
        Company.create! value[i]
      end
    end
end
