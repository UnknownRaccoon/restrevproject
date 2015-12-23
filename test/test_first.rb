require "json"
require "selenium-webdriver"
gem "test-unit"
require "test/unit"

class TestFirst < Test::Unit::TestCase

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "http://localhost:3000/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end

  def teardown
    @driver.quit
    assert_equal [], @verification_errors
  end

  def test_first
    @driver.get(@base_url + "about:newtab")
    @driver.find_element(:css, "span.newtab-thumbnail.enhanced-content").click
    @driver.find_element(:id, "dowm").click
    @driver.find_element(:id, "dowm").click
    @driver.find_element(:link, "rest").click
    @driver.find_element(:link, "rest").click
  end

  
end
