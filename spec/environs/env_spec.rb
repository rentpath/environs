require 'spec_helper'

describe Env, "#foo" do

  it "returns the ENV variable corresponding to the name of the method" do
    ENV['FOO'] = 'bar'
    Env.foo.should eq 'bar'
  end

  it "converts method name to SCREAMING_SNAKE_CASE for lookup" do
    ENV['FOO_BAR_BAZ'] = 'bar'
    Env.foo_bar_baz.should eq 'bar'
  end

  describe "default behavior" do

    it "returns an error if no corresponding ENV variable is set" do
      ENV['FOO_NO_VALUE'] = nil
      expect { Env.foo_no_value }.to raise_error
    end

  end

  describe "'allow_nil: true' is passed along" do

    it "returns nil if no corresponding ENV var is set" do
      ENV['FOO_ALLOW_NIL'] = nil
      Env.foo_allow_nil(:allow_nil => true).should be_nil
    end

  end

end
