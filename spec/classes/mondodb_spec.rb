require 'spec_helper'

describe 'mongodb', :type => :class do
  let(:title) { 'init' }

  describe "MongoDB class with no parameters, basic test" do
    let(:params) { { } }

     it { should create_class("mongodb")\
      .with_backup(true)\
      .with_official(true) }
  end
end
