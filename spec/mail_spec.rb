# encoding: utf-8 
require File.dirname(__FILE__) + "/spec_helper"

require 'mail'

describe "mail" do
  
  it "should be able to be instantiated" do
    doing { Mail }.should_not raise_error
  end
  
  it "should be able to make a new email" do
    Mail.message.class.should == Mail::Message
  end
  
  it "should accept headers and body" do
    # Full test in Message Spec
    message = Mail.message do
      from    'mikel@me.com'
      to      'mikel@you.com'
      subject 'Hello there Mikel'
      body    'This is a body of text'
    end
    message.from.addresses.should    == ['mikel@me.com']
    message.to.addresses.should      == ['mikel@you.com']
    message.subject.to_s.should == 'Hello there Mikel'
    message.body.to_s.should    == 'This is a body of text'
  end

  it "should read a file" do
    wrap_method = Mail.read(fixture('emails', 'raw_email')).to_s
    file_method = Mail.message(File.read(fixture('emails', 'raw_email'))).to_s
    wrap_method.should == file_method
  end

end