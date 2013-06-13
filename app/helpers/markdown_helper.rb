module MarkdownHelper
	def md(string)
		begin
			require 'rdiscount'
			RDiscount.new(string).to_html.html_safe
		rescue
			throw "MarkDown failed to load"
		end
	end
end