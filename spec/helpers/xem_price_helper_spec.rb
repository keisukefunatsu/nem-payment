require 'rails_helper'


describe XemPricesHelper do
  include XemPricesHelper
  it 'can convert raw address' do
    output = convert_xem_address('NBHEOH-LCGIAA-HDXEMZ-2NUMI4-QZVDXD-7ZBMUE-KY5R')
    expected = 'NBHEOHLCGIAAHDXEMZ2NUMI4QZVDXD7ZBMUEKY5R'
    expect(output).to eq expected
  end

  it 'can convert payload' do
    response = decode_xem_message('346565316130613331333765')
    expect(response).to eq '4ee1a0a3137e'
  end
  
  it 'can fetch xem SN response' do
    response = xem_confirmed_transaction('NBHEOH-LCGIAA-HDXEMZ-2NUMI4-QZVDXD-7ZBMUE-KY5R')
    result = response['data'].nil?
    expect(result).to eq false
  end

  it 'can check valid address' do
    response = is_valid_xem_address?('NBHEOH-LCGIAA-HDXEMZ-2NUMI4-QZVDXD-7ZBMUE-KY5R')
    expect(response).to eq true
  end

  it 'can check invalid address' do
    response = is_valid_xem_address?('testaddress')
    expect(response).to eq false
  end

  it 'can check invalid address2' do
    response = is_valid_xem_address?('this address has blanks')
    expect(response).to eq false
  end
end
