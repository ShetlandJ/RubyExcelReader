require "sinatra"
require "sinatra/json"

require_relative('./models/excel_reader')

get '/api' do
  @excel_reader = ExcelReader.new("red.xlsx");

  index_array = [3, 10, 11]
  constituency = "Dundee City"

  json @excel_reader.create_constituency_object(index_array, constituency)
end
