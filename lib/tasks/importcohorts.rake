task :importcohorts => :environment do
    require 'json'

    file = File.read('cohortdata.json')
    data_hash = JSON.parse(file)

    data_hash.each do | key, value |
      record_count = value.count
      for i in 0..(record_count - 1)
         cohort = Cohort.new value[i]
         cohort.save
      end
    end
end
