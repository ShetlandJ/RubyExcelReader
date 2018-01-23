require "sinatra"
require "sinatra/json"
configure { set :server, :puma }



require_relative('./models/excel_reader')

get '/api' do
  @excel_reader = ExcelReader.new("red.xlsx");

  json @excel_reader.multiple_object_test()
end


post '/save_file' do

  @filename = params[:file][:filename]

  @excel_reader = ExcelReader.new(@filename);

  index_array = [3, 10, 11]
  constituency = "Aberdeen City"
  sheet1 = "2012"
  sheet2 = "2013"


  json @excel_reader.create_constituency_object(index_array, constituency, sheet1)
end
