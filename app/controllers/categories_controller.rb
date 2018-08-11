class CategoriesController < ApplicationController
  def recommend
    @topics = Topic.all
  end

  def business
    @topics = Topic.all
  end

  def life
    @topics = Topic.all
  end

  def planning
    @topics = Topic.all
  end

  def technology
    @topics = Topic.all
  end

  def art
    @topics = Topic.all
  end

  def event
    @topics = Topic.all
  end

  def hobby
    @topics = Topic.all
  end
end
