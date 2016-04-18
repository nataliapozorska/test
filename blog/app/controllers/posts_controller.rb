class PostsController < ApplicationController

  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index html.slim
      format.xml {render :xml => @posts}
    end
  end
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  def create
    #return render text: params[:post]

    @post = Post.new(params_post)

    respond_to do |format|
      if @post.save
        flash[:notice] = 'Post został dodany!!!'
        format.html { redirect_to(@post) }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
   @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.slim
      format.xml  { render :xml => @post }
    end
  end

  def edit
    @post = Post.find(params[:id])
  end


  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update(params_post)
        flash[:notice] = 'Post został pomyślnie edytowany.'
        format.html { redirect_to(@post) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      flash[:notice] = 'Post został usunięty.'
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end

  private

  def params_post
    params.require(:post).permit(:name, :title, :content)
  end
end
