#encoding:utf-8
class Post < ActiveRecord::Base
  attr_accessible :content, :name,:tag
  validates :name ,:uniqueness => { :message => "标题已存在." },
                   :length => { :minimum => 2 , :message =>"#标题不能少于2个字符."}
  validates :tag ,:length => { :minimum => 2 , :message =>"#关键字不能少于2个字符."}

  paginates_per 5

  def all_tags
  	 tag.nil??  [] : tag.split(/,|，|\s+/)
  end

  def post_next(order="inc")
  	order== "inc"? Post.where("id < #{id}").last : Post.where("id > #{id}").first
  end

  def last_post
  	
  end
  
end
