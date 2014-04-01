require 'jj_webservice'
require 'spec_helper'
describe "get web_service return" do
  mem_info = JjWebservice::MemberInfo.new

  it "should return something" do
    mem_info.get_accumulate_list(123123, 123123, 123123, 123123 ) 
  end
end
