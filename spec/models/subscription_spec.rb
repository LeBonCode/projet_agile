require 'spec_helper'

describe Subscription do
  it { should belong_to :user }
end
