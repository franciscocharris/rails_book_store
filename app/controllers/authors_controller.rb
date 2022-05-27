# frozen_string_literal: true

class AuthorsController < ApplicationController
  before_action :set_author, only: %i[show edit update destroy]

  def index
    @pagy, @authors = pagy(Author.all)
  end

  def new
    return redirect_to authors_path if current_user.author

    @author = Author.new
  end

  def show
    @pagy, @books = pagy(@author.books.where(active: true)) if @author.books.where(active: true)
  end

  def create
    @author = Author.new(author_params)
    @author.user_id = current_user.id
    return render :new, status: :unprocessable_entity unless @author.save

    redirect_to author_url(@author), notice: 'Author was successfully created.'
  end

  def update
    return render :edit, status: :unprocessable_entity unless @author.update(author_params)

    redirect_to author_url(@author), notice: 'Author was successfully updated.'
  end

  def destroy
    @author.destroy
    redirect_to authors_url, notice: 'Author was successfully destroyed.'
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name)
  end
end
