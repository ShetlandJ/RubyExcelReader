require "sinatra"
require "sinatra/json"

require_relative('./models/excel_reader')

get '/api' do
  @excel_reader = ExcelReader.new();
  json @excel_reader.return_first_row("test_sheet.xlsx")
end
