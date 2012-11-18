#encoding:utf-8

module PostsHelper
	def time_strf_china(post)
		post.created_at.strftime("%Y/%m/%d")
	end

	def fast_view(post,number)
		if post.content.size>number
			"#{post.content.first(number)}........" 
		else
			post.content
		end
	end

	def post_error(post,attr_name)
		if @post.errors[attr_name].blank?
			attr_name=="name"? '标题必须唯一.' : '关键字以逗号,空格分隔.'
       	else
       	  error_msg = ""
       	 @post.errors[attr_name].each {|msg| error_msg+=msg}
       	 error_msg
       	end
			
	end
end
