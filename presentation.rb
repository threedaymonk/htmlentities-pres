require "json"
pages = []

$stdin.read.strip.split(/\s+----\s+/).each do |page|
  buffer = ""
  page.split(/^>/).each do |part|
    buffer += part
    pages << buffer
  end
end

puts "window.pages = " + JSON.dump(pages)
