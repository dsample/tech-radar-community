module MarkdownHelper
	def md(string)
		begin
			require 'rdiscount'
			RDiscount.new(string).to_html.html_safe
		rescue
			throw "MarkDown failed to load"
		end
	end

	def md_help
		link_to image_tag('md.png', target: "_blank", alt: "Markdown formatted", title: "Markdown formatted, click to open help",  "data-tooltip" => "", class: ["has-tip", "tip-right"]), '#', "data-reveal-id" => "markdownHelp"
	end
end