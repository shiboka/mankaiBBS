class PostsController < ApplicationController
  before_action :set_board
  before_action :set_thred
  before_action :set_post, only: %i[ show update destroy ]
  load_and_authorize_resource

  # GET /posts
  def index
    @posts = Post.all

    render json: @posts
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    @board.post_count += 1
    render json: @board.errors, status: :unprocessable_entity unless @board.save

    @post = Post.new(post_params)
    @post.post_num = @board.post_count

    if @post.save
      render json: @post, status: :created, location: board_thred_post_url(@board.path, @thred.post_num, @post.post_num)
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_board
    @board = Board.find_by(path: params[:board_path])
  end

  def set_thred
    @thred = @board.threds.find_by(post_num: params[:thred_post_num])
  end

  def set_post
    @post = @thred.posts.find_by(post_num: params[:post_num])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    prms = params.require(:post).permit(:name, :message)
    prms[:name] = "Anonymous" if prms[:name].empty?
    prms[:thred] = @thred
    prms
  end
end
