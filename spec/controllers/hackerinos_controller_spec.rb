require 'spec_helper'

describe HackerinosController do
    describe "should be able to vote with ajax" do
        let(:hackerino) { FactoryGirl.create(:hackerino)}
        it "should return in success" do
            expect do
                xhr :post, :vote, {:id => hackerino.id}
            end 
            expect(response).to be_success
        end

    end
    describe "should be able to unvote with ajax" do
        it "should return in success" do
            expect do
                xhr :post, :unvote, {:id => hackerino.id}
            end 
            expect(response).to be_success
        end
    
    end
end
