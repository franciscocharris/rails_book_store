class RequestsController < ApplicationController
  before_action :set_book

  def index
    @requests = current_user.requests.all
  end

  def new
    @request = Request.new
  end

  def create
    @request = current_user.requests.new(request_params)
    @request.save
    redirect_to requests_path
  end

  private

  def set_book
    @book = Book.find_by(code: params[:book_id])
  end

  def request_params
    params[:request].permit(:book_code)
  end
end
