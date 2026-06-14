class PostsController < ApplicationController
  # /posts
  def index
    @posts = Post.all
  end

  # /posts/new
  def new
   @post = Post.new
  end


  # /posts
  def create
   @post = Post.new(title: params[:post][:title], content: params[:post][:content])
   if @post.save
    redirect_to @post
   else
    render :new, status: :unprocessable_entity
   end
  end

  # /posts/:id
  def show
    @post = Post.find(params[:id])
  end

  # /posts/:id
  def destroy
   @post= Post.find(params[:id])
   @post.destroy
   redirect_to posts_path, notice: "Post was successfully deleted"
  end

  # /posts/:id/edit
  def edit
    @post = Post.find(params[:id])
  end

  # /posts/:id
  def update
    @post = Post.find(params[:id])
    if @post.update(title: params[:post][:title], content: params[:post][:content])
      redirect_to @post, notice: "Post was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end
end
