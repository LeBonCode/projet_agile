module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      sign_in user
    end
  end

  RSpec::Matchers.define :have_constant do |const|
    match do |owner|
      (owner.is_a?(Class) ? owner : owner.class).const_defined?(const)
    end
  end
end