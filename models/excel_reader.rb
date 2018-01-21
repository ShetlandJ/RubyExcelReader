require 'roo'

class ExcelReader

  def initialize(file)
    @file = file
    @spreadsheet = ""
    @sheets = []
  end

  def file_checker()
    if (@file.include? "xls")
      @spreadsheet = Roo::Excelx.new(@file, file_warning: :ignore, only_visible_sheets: true)
      return true
    else
      return false
    end
  end

  def get_sheet_names()
    if (file_checker)
      for sheet in @spreadsheet.sheets()
        if sheet.to_i > 1
          @sheets.push(sheet)
        end
      end
      return @sheets
    end
  end

  

end
  # spreadsheet = Roo::Excelx.new("red.xlsx", file_warning: :ignore)
  # headers = spreadsheet.sheet(0).row(9)

  # headers.each do |head|
  #   if (head == "Local Authority ")
  #     p headers.index(head)
  #   end
  # end

  # constituencies = spreadsheet.sheet(0).column(2)
  #
  # constituencies.each do |cell|
  #   if (cell == "Aberdeen City")
  #     p constituencies.index(cell)
  #   end
  # end


  # spreadsheet.each_with_index { |column,index|
  #   puts "index: #{index} for #{column}"
  # }

  # for column in spreadsheet.sheet(0)
  # if (column != "Header 2")
  # p column
  # end
  # end
