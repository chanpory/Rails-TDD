require 'spec_helper'

describe User do
  
  it 'must have a first name' do
    u = User.new(:first_name => nil)
    u.should_not be_valid
    u.errors[:first_name].should_not be_empty
  end
  
  it 'must have a last name' do
    u = User.new(:last_name => nil)
    u.should_not be_valid
    u.errors[:last_name].should_not be_empty
  end

  it "should not require a middle name" do
    u = User.new(:middle_name => nil)
    u.should_not be_valid
    u.errors[:middle_name].should be_empty
  end
    
  it "may have a middle name" do
    u = User.new(:middle_name => "Murphy")
    u.should_not be_valid
    u.errors[:middle_name].should be_empty
  end
  
  describe "#full_name" do
    it "should include user's first and last name" do
     u = User.new(:first_name => "John", :last_name => "Doe")
     u.full_name.should == "John Doe"
    end
    
    it "should include any first and last name" do
     u = User.new(:first_name => "Tori", :last_name => "Spelling")
     u.full_name.should == "Tori Spelling"
    end
    
    it "should include middle name if present" do
     u = User.new(:first_name => "Tori", :middle_name => "Victoria", :last_name => "Spelling")
     u.full_name.should == "Tori Victoria Spelling"
    end
    
  end
  
  it "must have an email address" do
    u = User.new(:email => nil)
    u.should_not be_valid
    u.errors[:email].should_not be_empty
  end
  
  it "must have a valid email address" do
    # these email addresses are valid
    u = User.new(:email => "valid@email.com")
    u.valid?
    u.errors[:email].should be_empty

    u = User.new(:email => "a@a.aa")
    u.valid?
    u.errors[:email].should be_empty

    # these email addresses are invalid
    u = User.new(:email => "0")
    u.valid?
    u.errors[:email].should_not be_empty
    
    u = User.new(:email => " ")
    u.valid?
    u.errors[:email].should_not be_empty
    
    u = User.new(:email => "@.")
    u.valid?
    u.errors[:email].should_not be_empty

    u = User.new(:email => "@domain.com")
    u.valid?
    u.errors[:email].should_not be_empty    
    
    u = User.new(:email => "user@.com")
    u.valid?
    u.errors[:email].should_not be_empty

    u = User.new(:email => "user@domain.")
    u.valid?
    u.errors[:email].should_not be_empty
    
    u = User.new(:email => "user@domain")
    u.valid?
    u.errors[:email].should_not be_empty    
    
    u = User.new(:email => "user@@domain.com")
    u.valid?
    u.errors[:email].should_not be_empty

    u = User.new(:email => " @ . ")
    u.valid?
    u.errors[:email].should_not be_empty
    
  end
  
end
