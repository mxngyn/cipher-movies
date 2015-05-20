require "rails_helper"

describe User do

  describe "validations" do

    it { should validate_presence_of :email }
    it { should validate_presence_of :name }

    context "for a new user" do
      
      it "should not be valid without a password" do
        user = FactoryGirl.build(:user, password: nil, password_confirmation: nil)
        expect(user).to_not be_valid
      end
 
      it "should be not be valid with a short password" do
        user = FactoryGirl.build(:user, password: "short", password_confirmation: "short")
        expect(user).to_not be_valid
      end
 
      it "should not be valid with a confirmation mismatch" do
        user = FactoryGirl.build(:user, password: "weather", password_confirmation: "whether")
        expect(user).to_not be_valid
      end
    
    end
 
    context "for an existing user" do
      
      let(:user) { FactoryGirl.create(:user) }
 
      it "should be valid with no changes" do
        expect(user).to be_valid
      end
 
      it "should not be valid with an empty password" do
        user.password = user.password_confirmation = ""
        expect(user).to_not be_valid
      end
 
      it "should be valid with a new (valid) password" do
        user.password = user.password_confirmation = "new password"
        expect(user).to be_valid
      end

    end
  end

end
