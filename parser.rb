open(ARGV[0]) { |f|
  parsing = false
  key = ""
  body = Array.new
  f.each { |line|
    line.gsub!(/\n/, '')
    next if line.empty?
    if parsing
      if md = line.match(/(\/@\w+)/)
        puts '"' +  key + '" = "' + body.join('\n') + '";'
        parsing = false
      else
        unless line.match(/\[\[\[.*\]\]\]/)
         body << line
        end
      end
    else
      if md = line.match(/(@\w+)/)
        body = Array.new
        key = md[0].gsub("@", "")
        parsing = true
      end
    end
  }
}
