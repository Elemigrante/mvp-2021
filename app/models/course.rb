class Course < ApplicationRecord
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user}

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, :short_description, :language, :price, :level, presence: true
  validates :description, presence: true, length: { minimum: 5 }

  has_rich_text :description

  belongs_to :user

  def to_s
    title
  end

  LANGUAGES = [:"English", :"Russian", :"Polish"]

  def self.languages
    LANGUAGES.map { |lang| [lang, lang] }
  end

  LEVELS = [:"Beginner", :"Intermediate", :"Advanced"]

  def self.levels
    LEVELS.map { |lvl| [lvl, lvl] }
  end
end
