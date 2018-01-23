require "sinatra"
require "sinatra/json"
configure { set :server, :puma }



require_relative('./models/excel_reader')

get '/api' do
  @excel_reader = ExcelReader.new("red.xlsx");

  index_array = [3, 9, 10]
  sheet = "2012"

  my_stuff = []

  sheet_constituencies = @excel_reader.get_constituencies

  number = 0

  while number < 32 do

    my_stuff.push(@excel_reader.create_constituency_object(index_array, sheet_constituencies[number], sheet))

    number +=1
  end

  json my_stuff
end


post '/save_file' do

  @filename = params[:file][:filename]

  @checkbox_value = params[:check]
  p @checkbox_value

  @excel_reader = ExcelReader.new(@filename);

  index_array = [@checkbox_value[0].to_i]
  constituency = "Aberdeen City"
  sheet1 = "2012"
  sheet2 = "2013"


  json @excel_reader.create_constituency_object(index_array, constituency, sheet1)
end
