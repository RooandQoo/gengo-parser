open("./data2.txt") { |f|
  parsing = false
  key = ""
  body = ""
  f.each { |line|
    line.gsub!(/\n/, '')
    next if line.empty?
    if parsing
      if md = line.match(/(\/@\w+)/)
        parsing = false
      else
        unless line.match(/\[\[\[.*\]\]\]/)
         body = line
         puts '"' +  key + '" = "' + body + '"'
        end
      end
    else
      if md = line.match(/(@\w+)/)
        key = md[0]
        parsing = true
      end
    end
  }
}
