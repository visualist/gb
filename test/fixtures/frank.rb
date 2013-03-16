
text_file = "Frankenstein-Shelley.txt"
yaml_data = "out"


require 'rubygems'
require 'rubygems/text'

class Collector
  include Gem::Text

  def initialize
    @paragraph = ""
  end

  def <<(line)
    @paragraph << " " if @paragraph.size > 0
    @paragraph << line
  end

  def size
    @paragraph.size
  end

  def paragraph
    format_text(@paragraph, 60, 4)
  end

  def reset
    @paragraph = ""
  end
end


def create_yaml_entry(textblock, itemnumber, timestamp)
textblock.gsub!(/"/, '')
textblock.gsub!(/'/, '')
textblock.gsub!(/:/, '')
title = textblock[0..20].gsub(/^["\s]+/, '')
return <<-EOS
S#{itemnumber}:
  updated_at: 1822-01-31 #{timestamp} UTC
  guest: shelley
  title: #{title}
  body:
#{textblock}
EOS
end


collector = Collector.new
itemnumber = 0

out = File.open(yaml_data, "w") do |w|
  File.open(text_file) do |f|

    f.each_line do |line|
      itemnumber += 1
      timestamp = '01:00:20'
      line.chomp!
      collector << line
      if line.empty? && collector.size > 0
        if collector.size > 80 # criteria to use it
          w.puts create_yaml_entry(collector.paragraph, itemnumber, timestamp)
          w.puts ""
        end
        collector.reset
      end
    end

  end
end
