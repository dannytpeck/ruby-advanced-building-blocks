require "./enumerable"

describe Enumerable do

  describe "#my_each" do

    it "performs the block five times" do
      x = ""
      [0, 1, 2, 3, 4].my_each{ x += "cat" }
      x.should eql "catcatcatcatcat"
    end

  end

  describe "#my_each_with_index" do

    it "iterates through the index values" do
      x = 0
      [15, 30, 45, 60, 75].my_each_with_index{ |number, index| x += index }
      x.should eql 10
    end

  end

  describe "#my_select" do

    it "populates new array with selected values" do
      x = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].my_select { |n| n % 2 == 0 }
      x.should eql [2, 4, 6, 8, 10]
    end

  end

  describe "#my_all?" do

    it "is true when everything in the array satisfies the condition" do
      %w[ant bear cat].my_all?{ |word| word.length >= 3 }.should be_true
    end
    it "is false when everything in the array doesn't satisfy the condition" do
      %w[ant bear cat].my_all?{ |word| word.length >= 4 }.should be_false
    end

  end

  describe "#my_any?" do

    it "is true when only one value in the array satisfies the condition" do
      %w[ant bear cat].my_any? { |word| word.length >= 4 }.should be_true
    end
    it "is true when multiple values in the array satisfy the condition" do
      %w[ant bear cat].my_any? { |word| word.length >= 3 }.should be_true
    end

  end

  describe "#my_none?" do

    it "is true when none of the values in the array satisfy the condition" do
      %w{ant bear cat}.my_none? { |word| word.length == 5 }.should be_true
    end
    it "is false when one of the values in the array satisfy the condition" do
      %w{ant bear cat}.my_none? { |word| word.length >= 4 }.should be_false
    end
    it "is true when the array is empty" do
      [].my_none?.should be_true
    end

  end

end