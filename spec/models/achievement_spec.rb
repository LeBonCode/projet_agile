require 'spec_helper'

describe Achievement do
  it { should respond_to(:title) }
  it { should respond_to(:description) }
end
