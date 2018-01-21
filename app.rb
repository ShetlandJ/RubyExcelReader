require "sinatra"
require "sinatra/json"

require_relative('./models/excel_reader')

# define a route that uses the helper
get '/' do
  @excel_reader = ExcelReader.new();
  json @excel_reader.return_first_row("test_sheet.xlsx")
  # json :foo => 'bar'
end
