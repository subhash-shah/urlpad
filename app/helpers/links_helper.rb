module LinksHelper
	def link_author_name(link)
		link.user.email
	end
end
