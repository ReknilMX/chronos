# encoding: utf-8

RSpec.shared_context "config", :a => :b do

  before(:each) do
    @driver = Watir::Browser.new :firefox
  end

  after(:each) do |example|
    if NFAPP_CONFIG['sauce'] == false
      if example.exception
        file = example.metadata[:example_group][:file_path].try(:split, '/').try(:third)
        save_screenshot file
      else
        # local testing, everything OK = close browser window!
        @driver.quit
      end
    end
    @verification_errors.should == []
  end

  def save_screenshot(app = '', status = 'failure')
    path = Rails.root.join('screenshot/')
    file_name = path.join("#{app}-#{status}-#{Time.now.strftime('%d_%m_%Y_%H_%M_%S')}.png")
    @driver.save_screenshot file_name
  end

end
