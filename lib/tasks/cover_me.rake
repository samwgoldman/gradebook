namespace :cover_me do
  
  task :report do
    require 'cover_me'
    CoverMe.complete!
  end
  
  task :spec do
    Rake::Task['spec'].invoke
    Rake::Task['cover_me:report'].invoke
  end

  task :cucumber do
    Rake::Task['cucumber'].invoke
    Rake::Task['cover_me:report'].invoke
  end

end

task :cover_me do
  Rake::Task['spec'].invoke
  Rake::Task['cucumber'].invoke
  Rake::Task['cover_me:report'].invoke
end
