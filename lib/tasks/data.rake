namespace :populate do

  desc "populate initial website data"
  task :data => :environment do
    Rake::Task['populate:countries'].invoke
    Rake::Task['populate:cities'].invoke
  end

end
