module XemPricesHelper
  def xem_balance(xem_address)
    response = xem_api_response(address, 'get')
    response['account']['balance'].to_f / 1000000
  end

  def xem_super_node_name
    super_nodes = ['go.nem.ninja', 'san.nem.ninja', 'hachi.nem.ninja', 'esposium.de', 'nijuichi.nem.ninja', 'jusan.nem.ninja']
    super_nodes.sample
  end

  def convert_xem_address(raw_address)
    raw_address.tr('-', '')
  end

  def xem_price_zaif
    response = Faraday.get('https://api.zaif.jp/api/1/last_price/xem_jpy')
    if response.success?
      json = JSON.parse(response.body)
      json['last_price']
    else
      xem_price_cap
    end    
  end

  def xem_price_polo
    response = Faraday.get('https://poloniex.com/public?command=returnTicker')
    if response.success?
    json = JSON.parse(response.body)
    json['BTC_XEM']['last']
    else
      xem_price_zaif
    end
  end

  def xem_price_cap
    response = Faraday.get('https://api.coinmarketcap.com/v1/ticker/nem/?convert=JPY')
    if response.success?
      json = JSON.parse(response.body)
      json[0]['price_jpy']
    else
      xem_price_zaif
    end
  end

  def xem_payment(price, address, message, sale_id)
    # check unconfirmed transactions
    response = xem_unconfirmed_transaction(address)
    if !response['data'].empty?
      data = response['data']
      data.each do |datum|
        sent_message = [datum['transaction']['message']['payload']].pack('H*')
        sent_price = datum['transaction']['amount'].to_f / 1000000
        if message == sent_message && price.to_f == sent_price
          return {status: 'OK', confirmed: false, message: '送金の承認待ち状態です'}
        end
      end
    end
    
    # check confirmed transactions
    response = xem_confirmed_transaction(address)
    data = response['data']
    data.each do |datum|
      sent_message = [datum['transaction']['message']['payload']].pack('H*')
      sent_price = datum['transaction']['amount'].to_f / 1000000
      #  check message and price are correct
      if message == sent_message && price.to_f == sent_price
        @sale = Sale.find(sale_id)
        @sale.confirmed = true
        if @sale.save
          return {status: 'OK', confirmed: true, message: 'お支払が完了しました'}
        else
          return {status: 'NG', confirmed: true, message: 'メッセージと金額を確認しましたが、更新に失敗しました。手動で更新して下さい'}
        end
      else
        return {status: 'NG', confirmed: false, message: '送金を確認出来ていません'}
      end
    end
  end

  def xem_confirmed_transaction(address)
    xem_api_response(address, 'transfers/incoming')
  end

  def xem_unconfirmed_transaction(address)
    xem_api_response(address, 'unconfirmedTransactions')
  end

  def xem_api_response(address, method)
    address = convert_xem_address(address)
    super_node = xem_super_node_name
    address = "http://#{super_node}:7890/account/#{method}?address=#{address}"
    response = Faraday.get(address)
    JSON.parse(response.body)
  end
end
