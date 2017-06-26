# encoding: utf-8

RSpec.shared_context "config_app", :a => :b do

  before(:each) do
  end

  after(:each) do |example|
  end

  def watch_for(file, pattern)
  f = File.open(file, "r")
  f.seek(0, IO::SEEK_END)
    while true
      @line = f.gets
        
      if @line =~ /Response Error: No es posible emitir el comprobante/
        break
      elsif @line =~ pattern
        break
      end
    end
  end

end

RSpec.shared_context "config_web", :a => :b do

  before(:each) do
    #@driver = Watir::Browser.new :chrome
    @driver = Watir::Browser.new :firefox, marionette: true
    #@driver = Watir::Browser.new :safari
  end

  after(:each) do |example|
    if example.exception
      file = example.metadata[:example_group][:file_path].try(:split, '/').try(:third)
      save_screenshot file
      #@driver.quit
    else
      # local testing, everything OK = close browser window!
      @driver.quit
    end
  end

  def save_screenshot(app = '', status = 'failure')
    path = Rails.root.join('screenshot/')
    file_name = path.join("#{app}-#{status}-#{Time.now.strftime('%d_%m_%Y_%H_%M_%S')}.png")
    @driver.screenshot.save file_name
  end

end