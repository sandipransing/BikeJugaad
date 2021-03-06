namespace :populate do
  
  desc "populate cities across world"
  task :cities => :environment do
    rows = File.open("#{Rails.root}/uploads/worldcitiespop.txt", 'r').readlines
    # select cities of india

    rows = rows.map {|r| r.split(',') rescue nil }.compact.select { |r| %w(in).include?(r[0])}.map {|r| r[0..1]}
    puts rows.count

    rows.each_with_index do |line, index|
      begin
      next if index == 0
      code, city_name = line
      code = code.upcase
      country = Country.where(code: code).first || Country.create(code: code)
      country.cities.where(name: city_name).first || country.cities.create(name: city_name)
      rescue Exception => e
        puts e.message
      end
    end
  end
end
