require "sinatra"
require "sinatra/json"
configure { set :server, :puma }

require_relative('./models/excel_reader')


get '/' do
  json :foo => "Bar"
end

get '/api' do
  @excel_reader = ExcelReader.new("red.xlsx");

  index_array = [3, 5, 6]

  sheet1 = "2014"
  sheet2 = "2015"
  sheet3 = "2016"

  my_stuff = []

  sheet_constituencies = @excel_reader.get_constituencies

  number = 0

  while number < 32 do

    my_stuff.push(@excel_reader.create_constituency_object(index_array, sheet_constituencies[number], sheet1))

    my_stuff.push(@excel_reader.create_constituency_object(index_array, sheet_constituencies[number], sheet2))

    my_stuff.push(@excel_reader.create_constituency_object(index_array, sheet_constituencies[number], sheet3))



    number +=1
  end

  json my_stuff[0]
end


post '/save_file' do
  @filename = params[:file][:filename]

  @excel_reader = ExcelReader.new(@filename);

  index_array = [3, 5, 6, 9, 12, 20, 21, 22, 23, 24, 25, 30, 31, 32, 33, 40, 41, 42, 43, 50, 51, 52, 53, 54, 55, 63, 64, 66, 67, 70, 71, 74, 75, 78, 79, 134, 135, 138, 139]

  sheet1 = "2014"
  sheet2 = "2015"

  my_stuff = []

  sheet_constituencies = @excel_reader.get_constituencies

  number = 0

  while number < 32 do

    my_stuff.push(@excel_reader.create_constituency_object(index_array, sheet_constituencies[number], ["2014", "2015"]))

    number +=1
  end

  json my_stuff[0]
end
