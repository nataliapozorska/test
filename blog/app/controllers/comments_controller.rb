class CommentsController < ApplicationController

  before_filter :find_post, :only => [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    @comments = @post.comments
  end

  def show
    @comment = @post.comments.find(params[:id])
  end

  def new
    @comment = @post.comments.build
  end

  def create
    @comment = @post.comments.build(params_comment)
    if @comment.save
      redirect_to post_comment_url(@post, @comment)
      flash[:notice] = 'Komentarz został dodany!!!'
    else
      render :action => "new"
    end
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(params_comment)
      redirect_to post_comment_url(@post, @comment)
      flash[:notice] = 'Komentarz został pomyślnie edytowany.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = 'Komentarz został usunięty.'
    redirect_to post_comments_path(@post)
  end

  private

  def params_comment
    params.require(:comment).permit(:commenter, :body)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
