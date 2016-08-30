require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs = ["lib", "specs"]
  t.warning = false
  t.verbose = false
  t.test_files = FileList['specs/*_spec.rb']
  #convention: testfiles need to end with #_spec.rb
  #old version: _test.rb
  puts "Running TestTask"
end

task default: :test do #default test, run TestTask first(built in, knows test -->TestTask)
    puts "Running my Rakefile"
end
