require "json"
pages = []

$stdin.read.strip.split(/^-{4,}/).each do |page|
  mode = ""
  page.gsub!(/^\[\[(.+?)\]\]/){
    mode = "sh_" + $1
    ""
  }
  pages << {"mode" => mode, "page" => page.strip}
end

puts "window.pages = " + JSON.dump(pages)
