require 'roo'

class ExcelReader

  def initialize(file)
    @file = file
    @spreadsheet = ""
    @sheets = []
    @constituencies = []
    @headers = []
    @chosen_constituency = []

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
        return (@headers.index(header) + 2)
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

  def create_constituency_object(index_array, constituency, sheet)
    sheet_index = get_sheet_index(sheet)

    constituency_data = {}

    constituency_index = get_row_index_by_name(constituency)

    constituency_data["Constituency"] = constituency
    constituency_data["Year"] = sheet

    for number in index_array

      key = get_header_column_name_by_index(number)
      value = get_cell(constituency_index, number, sheet_index)

      constituency_data[key] = value

    end

    @chosen_constituency.push( constituency_data)

    return @chosen_constituency

  end

  def multiple_object_test()
    index_array = [3, 10, 11]
    constituency = "Dundee City"
    sheet1 = "2012"
    sheet2 = "2013"

    create_constituency_object(index_array, constituency, sheet1)
    create_constituency_object(index_array, constituency, sheet2)

  end

end
