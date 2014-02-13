require 'spec_helper'

describe 'Comment pages' do

    subject {page}
    let(:hackerino) { FactoryGirl.create(:hackerino)}
    before {visit '/comments/' << hackerino.id.to_s}
    let(:submit) { "Let your voice be heard!" }
    describe "comment creation" do
        it "shouldn't happen with invalid input" do
            expect {click_button submit}.not_to change(Comment, :count)
        end
    end

end
