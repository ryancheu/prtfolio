require 'test_helper'

class CodeTest < ActiveSupport::TestCase
  def test_create_code
    _code = Code.create(:gist_id => "1394");
    assert !_code.nil?
    _code2 = Code.create(:content => "cout << hi");
    assert !_code2.nil? 
    _code3 = Code.create();
    assert !_code3.valid? 
  end
end
