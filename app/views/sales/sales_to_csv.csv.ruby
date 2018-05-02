require 'csv'
bom = "\xEF\xBB\xBF"

CSV.generate(bom, encoding: Encoding::UTF_8, row_sep: "\r\n", force_quotes: true) do |csv|
  csv_column_names = %w(作成日時 日本円 XEM建て 支払い 送金先XEMアドレス)  
  csv << csv_column_names
  unless @sales.empty?
    @sales.each do |sale|
      confirmed = sale.confirmed == true ? '済' : '未';
        csv_column_values = [
          sale.updated_at.strftime('%Y/%m/%d %H:%M'),
          sale.price_yen,
          sale.price_xem,
          confirmed,
          sale.xem_address,
        ]
        csv << csv_column_values
    end
  end
end