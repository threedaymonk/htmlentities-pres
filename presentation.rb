require "json"
pages = []

$stdin.read.split(/^-{4,}/).each do |page|
  page.gsub!(/^\S.*/, "")
  page.gsub!(/^    /, "")
  mode = ""
  page.gsub!(/^\[\[(.+?)\]\]/){
    mode = "sh_" + $1
    ""
  }
  pages << {"mode" => mode, "page" => page.strip}
end

puts "window.pages = " + JSON.dump(pages)
