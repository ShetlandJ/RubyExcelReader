require('minitest/autorun')
require('minitest/rg')

require_relative('../excel_reader')

class TestExcelReader < MiniTest::Test
  def setup()
    @excel_reader = ExcelReader.new()
  end

  def test_can_load_file()
    assert_equal(true, @excel_reader.load_file("test_sheet.xlsx"))
  end

end
