require_relative '../spec_helper'

describe Comment do
    before { @comment = Comment.new(content: "test body") }
    subject { @comment }

    it { should respond_to(:hackerino_id) }
    it { should respond_to(:content) }
    it { should respond_to(:author) }
    it { should respond_to(:id) }

    it { should be_valid }

    describe "empty content body" do
        before { @comment.content = "" }
        it { should_not be_valid }
    end

end
