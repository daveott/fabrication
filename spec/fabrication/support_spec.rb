require 'spec_helper'

describe Fabrication::Support do

  describe ".class_for" do

    context "with a class that exists" do

      it "returns the class for a class" do
        Fabrication::Support.class_for(Object).should == Object
      end

      it "returns the class for a class name string" do
        Fabrication::Support.class_for('object').should == Object
      end

      it "returns the class for a class name symbol" do
        Fabrication::Support.class_for(:object).should == Object
      end

    end

    context "with a class that doesn't exist" do

      it "returns nil for a class name string" do
        Fabrication::Support.class_for('your_mom').should be_nil
      end

      it "returns nil for a class name symbol" do
        Fabrication::Support.class_for(:your_mom).should be_nil
      end

    end

  end

  describe ".find_definitions" do

    before(:all) do
      Fabrication.clear_definitions
      Fabrication::Support.find_definitions
    end

    it "has an awesome object" do
      Fabrication::Fabricator.schematics[:awesome_object].should be
    end

    it "has a cool object" do
      Fabrication::Fabricator.schematics[:cool_object].should be
    end

  end

  describe ".name_for" do

    context "whitespace delimited" do
      context "singular" do
        subject { Fabrication::Support.name_for("interesting location") }
        it { should == :interesting_location }
      end
      context "plural" do
        subject { Fabrication::Support.name_for("interesting locations") }
        it { should == :interesting_location }
      end
    end

    context "underscored" do
      context "singular" do
        subject { Fabrication::Support.name_for("interesting_location") }
        it { should == :interesting_location }
      end
      context "plural" do
        subject { Fabrication::Support.name_for("interesting_locations") }
        it { should == :interesting_location }
      end
    end

  end

end
