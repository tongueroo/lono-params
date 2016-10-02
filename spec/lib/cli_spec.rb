require 'spec_helper'

# to run specs with what's remembered from vcr
#   $ rake
#
# to run specs with new fresh data from aws api calls
#   $ rake clean:vcr ; time rake
describe LonoParams::CLI do
  before(:all) do
    @project_root = "spec/fixtures/my_project"
    @args = "--project-root #{@project_root}"
  end

  describe "lono-params" do
    context "generate" do
      let(:output) { execute("bin/lono-params generate my-stack #{@args}") }
      it "should generate output/params/my-stack.json params file" do
        expect(output).to include("Params file generated for my-stack")
        data = JSON.load(IO.read("#{@project_root}/output/params/my-stack.json"))
        expect(data).to be_a(Array)
      end

      it "should treat use_previous_value as a special value" do
        out = execute("bin/lono-params generate my-stack #{@args}")
        expect(output).to include("Params file generated for my-stack")
        data = JSON.load(IO.read("#{@project_root}/output/params/my-stack.json"))
        param3 = data.last
        expect(param3["UsePreviousValue"]).to be true
      end

      it "should remove comments" do
        out = execute("bin/lono-params generate my-stack #{@args}")
        expect(output).to include("Params file generated for my-stack")
        data = JSON.load(IO.read("#{@project_root}/output/params/my-stack.json"))
        expect(data.size).to eq 3
      end
    end
  end
end
