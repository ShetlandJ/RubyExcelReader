require "sinatra"
require "sinatra/json"

require_relative('./models/excel_reader')

get '/api' do
  @excel_reader = ExcelReader.new("red.xlsx");
  json @excel_reader.get_sheet_names()
end
