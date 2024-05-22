ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
    include JsonWebToken

    def setup_variables
      @user = users(:admin)
      @token = jwt_encode(user_id: @user.id)
      
      @board = Board.new
      @board.name = "test"
      @board.path = "test"
      @board.post_count = 1
      @board.save
  
      @thred = Thred.new
      @thred.subject = "test"
      @thred.post_num = 1
      @thred.board = @board
      @thred.save

      @post = Post.new
      @post.name = "test"
      @post.message = "test"
      @post.post_num = 1
      @post.thred = @thred
      @post.save

      p "POSTS:", @thred.posts
    end
  end
end
