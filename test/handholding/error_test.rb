require './test/test_helper'
require 'handholding/error'

class ErrorTest < Minitest::Test

  def test_delegates_to_original_exception
    begin
      BadDay.new
    rescue NameError => e
      error = Handholding::Error.new(e)
      assert_equal "uninitialized constant ErrorTest::BadDay", error.message
    end
  end

  def test_line_number
    begin
      AwfulNews.new
    rescue NameError => e
      error = Handholding::Error.new(e)
      assert_equal 17, error.line_number
    end
  end

  def test_file_name
    begin
      SadPanda.new
    rescue NameError => e
      error = Handholding::Error.new(e)
      assert_match /test\/handholding\/error_test.rb\z/, error.file_name
    end
  end

  def test_location
    begin
      HorriblePerson.new
    rescue NameError => e
      error = Handholding::Error.new(e)
      assert_equal "test_location", error.location
    end
  end

  def test_knows_the_type_of_error
    error = Handholding::Error.new ArgumentError.new("Don't understand X")
    assert_equal ArgumentError, error.type
  end

end

