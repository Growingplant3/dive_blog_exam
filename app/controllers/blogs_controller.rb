class BlogsController < ApplicationController
  def index
    @blogs = Blog.pluck(:id, :title, :updated_at)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.valid?
      @blog.save
      redirect_to blogs_path, { notice: 'ブログ記事を登録しました！' }
    else
      render :new
    end
  end

  def show
    @blog = Blog.find_by(id: params[:id])
  end

  def edit
    @blog = Blog.find_by(id: params[:id])
  end

  def update
    @blog = Blog.update(blog_params)
    redirect_to blogs_path, { notice: "ブログを編集しました！" }
  end

  def destroy
  end

  def confirm
  end

  private
  def set_blog
  end

  def blog_params
    params.require(:blog).permit(:title, :body, :author)
  end
end
