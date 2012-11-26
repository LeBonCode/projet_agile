require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ApplicationHelper. For example:
#
# describe ApplicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe ApplicationHelper do
  it { helper.should respond_to(:resource_name) }
  it { helper.should respond_to(:resource) }
  it { helper.should respond_to(:devise_mapping) }
end
