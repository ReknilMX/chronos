RSpec.shared_context "config", :a => :b do

  before(:each) do
    if TFAPP_CONFIG['sauce'] == true
      @driver = @selenium
    else
      @driver = Selenium::WebDriver.for :firefox
      #@driver = Selenium::WebDriver.for :safari
    end
    @base_url = TFAPP_CONFIG['base_url']
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end

  after(:each) do |example|
    if TFAPP_CONFIG['sauce'] == false
      if example.exception || @verification_errors.any?
        file = example.metadata[:example_group][:file_path].try(:split, '/').try(:third)
        save_screenshot file
      else
        # local testing, everything OK = close browser window!
        @driver.quit
      end
    end
    @verification_errors.should == []
  end

  def element_present?(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end
  
  def alert_present?()
    @driver.switch_to.alert
    true
  rescue Selenium::WebDriver::Error::NoAlertPresentError
    false
  end

  def save_screenshot(app = '', status = 'failure')
    path = Rails.root.join('screenshot/')
    file_name = path.join("#{app}-#{status}-#{Time.now.strftime('%d_%m_%Y_%H_%M_%S')}.png")
    @driver.save_screenshot file_name
  end
  
  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end
  
  def close_alert_and_get_its_text(how, what)
    alert = @driver.switch_to().alert()
    alert_text = alert.text
    if (@accept_next_alert) then
      alert.accept()
    else
      alert.dismiss()
    end
    alert_text
  ensure
    @accept_next_alert = true
  end

end
