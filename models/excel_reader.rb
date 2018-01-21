require 'roo'

class ExcelReader

  def initialize(file)
    @file = file
    @spreadsheet = ""
    @sheets = []
    @constituencies = []
    @headers = []

    file_checker()
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
    for sheet in @spreadsheet.sheets()
      if sheet.to_i > 1
        @sheets.push(sheet)
      end
    end
    return @sheets
  end

  def get_constituencies()
    counter = 8
    for constituency in @spreadsheet.column(2)
      if (counter < 40)
        @constituencies.push(@spreadsheet.column(2)[counter])
        counter += 1
      end
    end

    return @constituencies
  end

  def get_headers_row()
    for header in @spreadsheet.row(9)
      @headers.push(header)
    end
    return @headers
  end

  def get_header_column_index_by_name(name)
    get_headers_row()
    for header in @headers
      if (header == name)
        return @headers.index(header)
      end
    end
  end

  def get_row_index_by_name(name)
    get_constituencies()
    for constituency in @constituencies
      if (constituency == name)
        return (@constituencies.index(constituency) + 8)
      end
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
