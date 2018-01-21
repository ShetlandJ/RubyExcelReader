require 'roo'

xlsx = Roo::Spreadsheet.open('./test_sheet.xlsx')

# Use the extension option if the extension is ambiguous.
# xlsx = Roo::Spreadsheet.open('./rails_temp_upload', extension: :xlsx)


#
# xlsx.each_with_pagename do |name, sheet|
#   p sheet.row(2)
# end

headers = xlsx.sheet(0).row(2)

for column_header in headers
  if (column_header === nil)
    column_header = ""
  #   p "This cell contains: " + column_header
  # else
  end
  p "This cell contains: " + column_header
end
