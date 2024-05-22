class ThredsController < ApplicationController
  before_action :set_board
  before_action :set_thred, only: %i[ show update destroy ]
  load_and_authorize_resource

  # GET /threds
  def index
    @threds = @board.threds.map(&:preview).sort_by { |t| t[:posts].last.created_at }.reverse

    render json: @threds
  end

  # GET /threds/1
  def show
    render json: @thred.serialize
  end

  # POST /threds
  def create
    @board.post_count += 1
    render json: @board.errors, status: :unprocessable_entity unless @board.save

    @thred = Thred.new(thred_params)
    @thred.post_num = @board.post_count
    render json: @thred.errors, status: :unprocessable_entity unless @thred.save

    prms = post_params
    prms[:thred] = @thred
    @post = Post.new(prms)
    @post.post_num = @board.post_count

    if @post.save
      render json: @thred, status: :created, location: @thred
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /threds/1
  def update
    if @thred.update(thred_params)
      render json: @thred
    else
      render json: @thred.errors, status: :unprocessable_entity
    end
  end

  # DELETE /threds/1
  def destroy
    @thred.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_board
    @board = Board.find_by(path: params[:board_path])
  end

  def set_thred
    @thred = @board.threds.find_by(post_num: params[:post_num])
  end

  # Only allow a list of trusted parameters through.
  def thred_params
    prms = params.require(:thred).permit(:subject)
    prms[:board] = @board
    prms
  end

  def post_params
    prms = params.require(:thred).permit(:name, :message)
    prms[:name] = "Anonymous" if prms[:name].empty?
    prms
  end
end
