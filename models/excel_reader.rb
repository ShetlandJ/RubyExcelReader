require 'roo'

class ExcelReader

  def initialize(file)
    @file = file
    @spreadsheet = ""
    @sheets = []
    @constituencies = []
    @headers = []
    @chosen_constituency = []
    @test = []

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
    @sheets = []
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

  def return_constituencies()
    @constituencies
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
        return (@headers.index(header))
      end
    end
  end

  def get_header_column_name_by_index(index)
    get_headers_row()

    for header in @headers
      if (@headers.index(header) == index)
        return header
      end
    end
  end

  def get_row_index_by_name(name)
    get_constituencies()

    for constituency in @constituencies
      if (constituency == name)
        return (@constituencies.index(constituency) + 10)
      end
    end
  end

  def get_cell(row, column, sheet)
    cell = @spreadsheet.sheet(sheet).cell(row, column)
    if (cell == nil)
      return ""
    else
      return cell
    end
  end

  def get_sheet_index(sheet_name)
    get_sheet_names()
    for sheet in @sheets
      if (sheet == sheet_name)
        return @sheets.index(sheet)
      end
    end
  end

  def create_constituency_object(index_array, constituency, sheet_array)

    sheet_indexes = []
    for sheet in sheet_array
      sheet_indexes.push(get_sheet_index(sheet))
    end

    constituency_data = {}

    constituency_index = get_row_index_by_name(constituency)

    for number in index_array
      for sheet_index in sheet_indexes

        key = get_header_column_name_by_index(number-2)
        if (get_cell(constituency_index, number, sheet_index).is_a?(String) )
          value = get_cell(constituency_index, number, sheet_index)
        elsif (key.include? "%" || "Percentage")
          value = (get_cell(constituency_index, number, sheet_index) * 100).round(0)
        else
          value = get_cell(constituency_index, number, sheet_index).round(2)
        end
      end

      constituency_data[key] = value

    end

    my_test = []

    my_test.push(sheet_array[0] => constituency_data)
    my_test.push(sheet_array[1] => constituency_data)

    @chosen_constituency.push( constituency => my_test)



  end


  def return_chosen_constituency()
    return @chosen_constituency
  end

end
