# frozen_string_literal: true

class TagsController < ApplicationController
  before_action :set_tag, only: %i[show edit update destroy]

  def index
    @pagy, @tags = pagy(Tag.all)
  end

  def show
    @pagy, @books = pagy(@tag.books.all) if @tag.books.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.author_id = current_user.author.id
    return render :new, status: :unprocessable_entity unless @tag.save

    redirect_to tag_url(@tag), notice: 'tag was successfully created.'
  end

  def update
    return render :edit, status: :unprocessable_entity unless @tag.update(tag_params)

    redirect_to tag_url(@tag), notice: 'tag was successfully updated.'
  end

  def destroy
    @tag.destroy
    redirect_to tags_url, notice: 'tag was successfully destroyed.'
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
