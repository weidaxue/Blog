class PostsController < ApplicationController

  # http_basic_authenticate_with :name => "songjiayang", :password => "songjiayang", :except => [:index, :show,:posts_with_tag]
  before_filter :save_session, :only => [:create, :update,:destroy,:new,:edit]

  def index
    if params[:tag].blank?
      @posts = Post.order("created_at desc").page params[:page]
    else
      @posts = Post.where(["tag like ?",'%'+params[:tag].to_s.strip+'%']).order(:created_at).page params[:page]
    end
    session[:index] = 2
  end

  def show
    @post = Post.find(params[:id])
    @pre_page = @post.post_next('inc')
    @next_page = @post.post_next('desc')
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])
    respond_to do |format|
      if @post.save
        BlogMailer.report_new_one_blog(@post.id).deliver!
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private 
  def save_session
    redirect_to sign_in_path unless current_user
  end
end



