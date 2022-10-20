class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: %i[ show edit update destroy archive republish ]
  before_action :get_user, only: [:blogs]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  def blogs
    @posts = @user.posts
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = current_user.posts.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        set_status
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        set_status
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def archive
    @post.archived!
    redirect_to post_path(@post), notice: 'Post Archived'
  end

  def republish
    @post.published!
    @post.published_at = Time.now
    @post.save
    redirect_to post_path(@post), notice: 'Post Republished'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.includes(:user).find(params[:id])
    end

    def get_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :user_id, :banner, :body)
    end

    def set_status
      if params[:commit] == "Publish"
        @post.published!
        @post.published_at = Time.now 
        @post.save 
      elsif params[:commit] == "Save as Draft"
        @post.draft!
      elsif params[:commit] == "Archive"
        @post.archived!
      end
    end
end
