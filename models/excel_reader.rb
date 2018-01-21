require 'roo'

class ExcelReader

  def initialize()

  end

  def load_file(file)
    return true if file != nil
  end

  def return_first_row(file)
    if (load_file(file))
      xlsx = Roo::Spreadsheet.open(file)
      headers = xlsx.sheet(0).row(1)
      for column_cells in headers
        return headers
      end
    end
  end

end
