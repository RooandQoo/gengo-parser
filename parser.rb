open(ARGV[0]) { |f|
  parsing = false
  ignore_mode = false
  key = ""
  body = Array.new
  f.each { |line|
    line.gsub!(/\n/, '')
    next if line.empty?
    if parsing
      if md = line.match(/(\/@\w+)/)
        puts '"' +  key + '" = "' + body.join('\n') + '";'
        parsing = false
      end
      if line.match(/\[\[\[.*/)
        ignore_mode = true
      end
      if line.match(/.*\]\]\]/)
        ignore_mode = false
        next
      end
      body << line unless ignore_mode
    else
      if md = line.match(/(@\w+)/)
        body = Array.new
        key = md[0].gsub("@", "")
        parsing = true
      end
    end
  }
}
