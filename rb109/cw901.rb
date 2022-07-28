def strip_comment(input, markers)
  output = input.dup

  markers.each do |marker|
    marker = "\\" + "#{marker}"
    output.gsub!(/( *#{marker}.*)$/, '')
  end

  output
end

str = "apples, pears # and bananas
grapes
bananas $apples"
p strip_comment(str, ['#', '$'])