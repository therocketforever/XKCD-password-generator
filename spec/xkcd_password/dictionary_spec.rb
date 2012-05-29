require File.expand_path("lib/xkcd_password/dictionary")
describe XkcdPassword::Dictonary do
  it "reads the system dictionary file" do
    File.should_receive(:readlines).with("/usr/share/dict/words").and_return(%w(one two three four))
    XkcdPassword::Dictonary.default
  end
end
