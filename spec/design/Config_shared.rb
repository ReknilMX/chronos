# encoding: utf-8

RSpec.shared_context "config", :a => :b do

  before(:each) do

    @driver = Watir::Browser.new :firefox
    #@driver = Watir::Browser.new :safari
  end

  after(:each) do |example|
  	if BFAPP_CONFIG['sauce'] == false
      if example.exception 
        file = example.metadata[:example_group][:file_path].try(:split, '/').try(:third)
        save_screenshot file
      else
        # local testing, everything OK = close browser window!
        #@driver.close
      end
    end
  end

  def save_screenshot(app = '', status = 'failure')
    path = Rails.root.join('screenshot/')
    file_name = path.join("#{app}-#{status}-#{Time.now.strftime('%Y_%m_%d_%H_%M_%S')}.png")
    @driver.screenshot.save file_name
  end
  
end
