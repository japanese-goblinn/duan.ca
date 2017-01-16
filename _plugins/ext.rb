require 'jekyll/tagging'

module Jekyll
  module LinkBackFilter
    def link_back(input, base, url)
        total = input.scan(",").count
        n = Random.rand(total)
        count = 0
        input.gsub(",") do |x|
            dot = x
            if n == count
                dot = "<a href=#{base}#{url}>.</a>"
            end
            count += 1
            dot
        end
    end
  end
end

Liquid::Template.register_filter(Jekyll::LinkBackFilter)