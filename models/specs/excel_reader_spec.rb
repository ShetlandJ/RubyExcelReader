require('minitest/autorun')
require('minitest/rg')

require_relative('../excel_reader')

class TestExcelReader < MiniTest::Test
  def setup()
    @excel_reader = ExcelReader.new("../red.xlsx")
    @excel_reader_2 = ExcelReader.new("../a.txt")
  end

  def test_can_load_file__true()
    assert_equal(true, @excel_reader.file_checker())
  end

  def test_can_get_sheet_names()
    assert_equal(["2012", "2013", "2014", "2015", "2016"], @excel_reader.get_sheet_names)
  end

  def test_get_constituencies()
    
  end

end
