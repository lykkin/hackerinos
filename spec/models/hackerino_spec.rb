require_relative '../spec_helper'

describe Hackerino do

  before { @hackerino = Hackerino.new(title: "test title", url: "www.example.com")}
  subject { @hackerino }

  it { should respond_to(:id)}
  it { should respond_to(:author)}
  it { should respond_to(:url)}
  it { should respond_to(:title)}
  it { should respond_to(:vote)}
  it { should respond_to(:comments)}

  it { should be_valid }

  describe "empty title" do
    before {@hackerino.title = ""}
    it { should_not be_valid }
  end

  describe "empty url" do
    before {@hackerino.url = ""}
    it { should_not be_valid }
  end

  describe "invalid url formats" do
    it "should be invalid" do
      urls = %w[w ii.na, 239487239482374982374982347923487239487 another invalid something or other]
      urls.each do |invalid|
        @hackerino.url = invalid
        expect(@hackerino).not_to be_valid
      end
    end
  end

  describe "valid url formats" do
    it "should be valid" do
      urls = %w[www.google.com http://youtube.com www.twitch.tv http://www.gmail.com]
      urls.each do |valid|
        @hackerino.url = valid
        expect(@hackerino).to be_valid
      end
    end
  end

end
