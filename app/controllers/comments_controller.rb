class CommentsController < ApplicationController
  before_action :set_book

  def create
    @comment = @book.comments.new(comment_params)
    @comment.user_id = current_user.id
    redirect_to @book if @comment.save
  end

  def destroy
    @comment = @book.comments.find(params[:id])
    redirect_to @book if @comment.destroy
  end

  private

    def set_book
      @book = Book.find_by(code: params[:book_id])
    end

    def comment_params
      params[:comment].permit(:message, :book_id)
    end
end