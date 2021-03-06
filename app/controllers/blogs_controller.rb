class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        move_root("ブログ記事を登録しました。")
      else
        render :new
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      move_root("ブログ記事を編集しました。")
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    move_root("ブログ記事を削除しました。")
  end

  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end

  private
  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :body, :author)
  end

  def move_root(notice_message = nil)
    redirect_to blogs_path, { notice: notice_message }
  end
end
