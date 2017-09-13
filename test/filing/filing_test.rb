require './test/test_helper'

class EdgarApiFilingTest < Minitest::Test
  def test_exists
    assert EdgarApi::Filing
  end

  def test_it_returns_recent_filings
  	results = EdgarApi::Filing.pull
  	assert_equal true, results.count > 0
  end

  def test_it_creates_filing_objects
  	results = EdgarApi::Filing.pull
  	assert_equal EdgarApi::Filing, results[0].class
  end
end