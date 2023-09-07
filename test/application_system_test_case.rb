require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # Webdrivers::Chromedriver.required_version = "116.0.5845.140"
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
end
