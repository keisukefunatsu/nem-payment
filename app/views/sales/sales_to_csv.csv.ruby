require 'csv'

CSV.generate(encoding: Encoding::SJIS, row_sep: "\r\n", force_quotes: true) do |csv|
  csv_column_names = %w(作成日時 日本円 XEM建て 送金先XEMアドレス)
  csv << csv_column_names
  unless @sales.empty?
    @sales.each do |sale|
      csv_column_values = [
        sale.updated_at,
        sale.price_yen,
        sale.price_xem,
        sale.xem_address,
      ]
      csv << csv_column_values
    end
  end
end