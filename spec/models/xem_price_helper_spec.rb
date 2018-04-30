require 'rails_helper'


describe XemPricesHelper do
  include XemPricesHelper
  it 'can convert raw address' do
    output = convert_xem_address('NBHEOH-LCGIAA-HDXEMZ-2NUMI4-QZVDXD-7ZBMUE-KY5R')
    expected = 'NBHEOHLCGIAAHDXEMZ2NUMI4QZVDXD7ZBMUEKY5R'
    expect(output).to eq expected
  end
  
  it 'can fetch xem SN response' do
    response = xem_confirmed_transaction('NBHEOHLCGIAAHDXEMZ2NUMI4QZVDXD7ZBMUEKY5R')['data']
    result = response.empty?
    expect(result).to eq false
  end
end
