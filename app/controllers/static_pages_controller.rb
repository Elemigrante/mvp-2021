class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[landing_page]

  def landing_page
    @courses = Course.all.limit(3)
    @latest_courses = Course.all.limit(3).order(created_at: :desc)
  end

  def activity
    @activities = PublicActivity::Activity.all
  end

  def privacy_policy
  end
end
