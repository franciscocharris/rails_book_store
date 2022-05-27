# frozen_string_literal: true

class BooksController < ApplicationController
  require 'securerandom'
  before_action :set_book, only: %i[show edit update destroy]
  

  def index
    @pagy, @books = pagy(Book.all)
  end

  def show
    @comments = @book.comments.all
  end

  def new
    @book = Book.new
    @tags = Tag.all
  end

  def edit
    @tags = Tag.all
  end

  def create
    @book = current_user.author.books.new(book_params)
    @book.code = SecureRandom.uuid
    unless @book.save
      @tags = Tag.all
      return render :new, status: :unprocessable_entity
    end

    @book.save_tags
    redirect_to book_url(@book), notice: 'Book was successfully created.'
  end

  def update
    return render :edit, status: :unprocessable_entity unless @book.update(book_params)

    redirect_to book_url(@book), notice: 'Book was successfully updated.'
  end

  def destroy
    @book.destroy
    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:code, :name, :description, :price, :price, :n_pages, :d_published, :active,
                                 tag_elements: [])
  end
end
