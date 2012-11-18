#encoding:utf-8
class Post < ActiveRecord::Base
  attr_accessible :content, :name,:tag
  validates :name ,:uniqueness => { :message => "标题已存在." },
                   :length => { :minimum => 2 , :message =>"#标题不能少于2个字符."}
  validates :tag ,:length => { :minimum => 2 , :message =>"#关键字不能少于2个字符."}

  paginates_per 4

  def all_tags
  	 tag.nil??  [] : tag.split(/,|，|\s+/)
  end

  def self.all_posts_with_tag(str_tag)
    posts = []
  	Post.all.each do |post|
  		if post.tag
  			posts << post if post.tag.include? str_tag
  		end
  	end
  	posts
  end

end
