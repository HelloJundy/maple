ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
  def check_classification
     @classifications = Classification.all
     @classifications.each do |classification|
       assert_select 'a[href=?]', classification_path(classification), text: classification.title
     end


     @tags = ActsAsTaggableOn::Tag.all
     @tags.each do |tag|
       assert_select 'a[href=?]', tag_path(tag)
     end
  end
end
