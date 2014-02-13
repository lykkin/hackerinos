require 'spec_helper'

describe "Hackerino pages" do

    subject { page }

    describe "Index page" do
        let(:hackerino) {FactoryGirl.create(:hackerino)}
        before {hackerino.save}
        before {visit "/"}
        it {should have_title('Raise your hackerinos')}
        it {should have_link('hackerinos', :href => "/")}
        it {should have_link('submit a hackerino', :href => "/post")}
        it {should have_selector(:css, ".donger")}

    end

    describe "Post hackerino" do
        before { visit  "/post"}
        describe "should have a submission form" do
            it {should have_field("hackerino_title")}
            it {should have_field("hackerino_url")}
            it {should have_field("hackerino_author")}
        end
        
        let(:submit) { "Posterino this hackerino" }

        it { should have_title('Posterino a hackerino') }

        describe "with invalid information" do
            it "should not create a new hackerino" do
                expect {click_button submit}.not_to change(Hackerino, :count)
            end
        end

        describe "with valid information" do
            before do
                fill_in "hackerino_title", with: "test title"
                fill_in "hackerino_url", with: "www.example.com"
                fill_in "hackerino_author", with: "test author"
            end
            it "should post a hackerino" do
                expect {click_button submit}.to change(Hackerino, :count).by(1)
            end
            describe "and the hackerino should show on the index page" do
                before {click_button submit}
                let(:hackerino) { Hackerino.find_by(:url => "www.example.com") }

                it {should have_title("Raise your hackerinos")}
                it {should have_content(hackerino.title)}
            end
        end
    end
end
