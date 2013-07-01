require 'environs'

describe Env, "#foo" do

  it "returns the ENV variable corresponding to the name of the method" do
    ENV['FOO'] = 'bar'
    Env.foo.should eq 'bar'
  end

  describe "default behavior" do

    it "returns an error if no corresponding ENV variable is set" do
      ENV['FOO'] = nil
      expect { Env.foo }.to raise_error
    end

  end

  describe "'allow_nil: true' is passed along" do

    it "returns nil if no corresponding ENV var is set" do
      ENV['FOO'] = nil
      Env.foo(allow_nil: true).should be_nil
    end

  end

end
