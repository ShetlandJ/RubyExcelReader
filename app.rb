require "sinatra"
require "sinatra/json"

require_relative('./models/excel_reader')

get '/api' do
  @excel_reader = ExcelReader.new("red.xlsx");

  json @excel_reader.multiple_object_test()
end


post '/save_file' do

  @filename = params[:file][:filename]
  file = params[:file][:tempfile]

  File.open("./public/#{@filename}", 'wb') do |f|
    f.write(file.read)
  end

  @excel_reader = ExcelReader.new("#{@filename}");

  json
  erb :show_image
end
