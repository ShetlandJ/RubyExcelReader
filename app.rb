require 'roo'

xlsx = Roo::Spreadsheet.open('./test_sheet.xlsx')

headers = xlsx.sheet(0).row(2)

for column_header in headers
  if (column_header === nil)
    column_header = ""
  end
  p "This cell contains: " + column_header
end
