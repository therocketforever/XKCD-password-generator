require File.expand_path("lib/xkcd_password/dictionary")
describe XkcdPassword::Dictionary do
  it "defaults to reading the common 5000 words dictionary" do
    File.stub(:readlines).and_return(%w(one two))
    XkcdPassword::Dictionary.should_receive(:dictionary_path).with("5000-common-words.txt")
    XkcdPassword::Dictionary.default
  end
end
