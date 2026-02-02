require "bundler/gem_tasks"
require "rake/testtask"
require "rubocop/rake_task"

Rake::TestTask.new do |t|
  t.pattern = "test/test_*.rb"
end

RuboCop::RakeTask.new

task :default => %i[test rubocop]
