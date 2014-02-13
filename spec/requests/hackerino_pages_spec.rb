require 'spec_helper'

describe "Hackerino pages" do

    subject { page }

    describe "Index page" do
        let(:hackerino) {FactoryGirl.create(:hackerino)}
        before {visit "/"}

        it { should have_content(hackerino.title)}
    end

    describe "Create page" do
        before { visit  "/post"}

        it { should have_title('Posterino a hackerino') }
    end
end
