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
    assert_equal(32, @excel_reader.get_constituencies().length)
  end

  def test_get_row()
    assert_equal(138, @excel_reader.get_headers_row().length )
  end

  def test_get_column_index_by_name()
    assert_equal(0, @excel_reader.get_header_column_index_by_name("Local Authority ") )
  end

  def test_get_row_index_by_name()
    assert_equal(8, @excel_reader.get_row_index_by_name("Aberdeen City") )
  end

  def test_get_cell_by_column_and_row_index()
    column_index = get_header_column_index_by_name("No. of Debt Advice Clients")
    row_index = get_row_index_by_name("Aberdeen City")

    assert_equal("Telephone Clients", @excel_reader.get_cell_coordinates(column_index, row_index))
  end

end
