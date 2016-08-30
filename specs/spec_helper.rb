#Spec_helper.rb
require 'simplecov'
SimpleCov.start


require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
