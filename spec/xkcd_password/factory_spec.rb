require File.expand_path("lib/xkcd_password/factory")

describe XkcdPassword::Factory do
  
  before do
    # Reading in the actual dictionary is slow...
    XkcdPassword::Dictonary.stub(:default).and_return(%w(correct horse battery stapler))
  end

  context "with default settings" do 
    it "generates a four word password" do
      xkcd_password_factory = XkcdPassword::Factory.new
      xkcd_password_factory.generate.split("-").length.should == 4 
    end

    it "use the default dictionary to populate" do
      XkcdPassword::Dictonary.should_receive(:default).once.and_return(%w(one two three four))
      xkcd_password_factory = XkcdPassword::Factory.new
    end

    it "picks 4 words to make up the password" do
      xkcd_password_factory = XkcdPassword::Factory.new
      xkcd_password_factory.should_receive(:pick).exactly(4).times.and_return("correct", "horse", "battery", "stapler")
      xkcd_password_factory.generate.should == "correct-horse-battery-stapler"
    end

  end

  context "with a template" do
    it "sets the template to its @template" do
      template = "word*word"
      xkcd_password_factory = XkcdPassword::Factory.new :template=>template
      xkcd_password_factory.template.should == template
    end

    it "respects any non-alpha characters used to separate the template" do
      template = "word*word!word word"
      xkcd_password_factory = XkcdPassword::Factory.new :template=>template
      xkcd_password_factory.should_receive(:pick).and_return("correct", "horse", "battery", "stapler")
      xkcd_password_factory.generate.should == "correct*horse!battery stapler"
    end

    it "raises an expection if any sub-dictionary isn't present" do
      template = "word fakeword"
      xkcd_password_factory = XkcdPassword::Factory.new :template=>template
      lambda do
        xkcd_password_factory.generate
      end.should raise_error(XkcdPassword::DictionaryNotFoundException)
    end
    
    it "raises an expection if the template is empty" do
      template = ""
      xkcd_password_factory = XkcdPassword::Factory.new :template=>template
      lambda do
        xkcd_password_factory.generate
      end.should raise_error(XkcdPassword::EmptyTemplateException)
    end

  end
end
