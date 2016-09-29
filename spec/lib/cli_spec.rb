require 'spec_helper'

# to run specs with what's remembered from vcr
#   $ rake
# 
# to run specs with new fresh data from aws api calls
#   $ rake clean:vcr ; time rake
describe LonoParams::CLI do
  before(:all) do
    @args = "--project-root spec/fixtures/my_project"
  end

  describe "lono-params" do
    it "should generate params" do
      out = execute("bin/lono-params generate my-stack #{@args}")
      expect(out).to include("Params file generated for my-stack")
    end
  end
end
