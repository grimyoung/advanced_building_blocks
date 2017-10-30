require_relative "Enumerable"

describe Enumerable do
  describe ".my_each" do
    context "no blocks given" do
      it "returns error" do
        expect{[1,2,3].my_each}.to raise_error(LocalJumpError, "no block given (yield)")
      end
    end

    context "after going through the array" do
      it "returns the array" do
        expect([1,2,3].my_each{ |x|}).to eql([1,2,3])
      end
    end
  end
end