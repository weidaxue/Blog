#encoding:utf-8
require 'yaml'
class BlogMailer < ActionMailer::Base

  default from: "sjy@sodt.cn"

  def report_new_one_blog(id)
  	 @post = Post.find_by_id(id)
  	 mail(:to =>read_mail_list["report_mail_list"], :subject => "A new blog")
  end

  private
  def read_mail_list
    YAML.load_file("config/mail_list.yml")
  end

end
