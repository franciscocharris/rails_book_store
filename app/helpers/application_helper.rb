# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def all_tags
    @tags = Tag.all
  end

  def all_authors
    @authors = Author.all
  end
end
