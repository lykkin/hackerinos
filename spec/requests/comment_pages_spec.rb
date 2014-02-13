require 'spec_helper'

describe 'Comment pages' do

    subject {page}
    let(:hackerino) { FactoryGirl.create(:hackerino)}
    before {visit '/comments/' << hackerino.id.to_s}
    let(:submit) { "Let your voice be heard!" }
    describe "comment creation" do
        describe "should have a form to interact with" do
            it {should have_field("comment_author")}
            it {should have_field("comment_content")}
        end
        it "shouldn't happen with invalid input" do
            expect {click_button submit}.not_to change(Comment, :count)
        end
        describe "should happen with valid input" do
            before do
                fill_in "comment_content", with: "test content"
                fill_in "comment_author", with: "test author"
            end
            it "should post a comment" do
                expect {click_button submit}.to change(Comment, :count).by(1)
            end
            describe "and you should be redirected to the updated comment page" do
                before {click_button submit}
                it {should have_title(hackerino.title)}
                it {should have_content("test author")}
                it {should have_content("test content")}
            end
        end
    end

end
