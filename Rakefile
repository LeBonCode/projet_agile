#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

C4::Application.load_tasks

task :travis do
  ["rake db:migrate", "rspec"].each do |cmd|
    puts "Running #{cmd}..."
    system("export DISPLAY=:99.0 && bundle exec #{cmd}")
    raise "#{cmd} failed!" unless $?.exitstatus == 0
  end
end

task :deploy => :travis do
  puts "Pushing to origin remote..."
  system "git push origin master"
  puts "Deploying to production"
  system "git push heroku master"
end