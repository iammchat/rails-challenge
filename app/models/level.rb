class Level < ActiveRecord::Base
  belongs_to :next_level, class_name: 'Level', foreign_key: 'next_level_id'
  has_one :previous_level, class_name: 'Level', foreign_key: 'next_level_id'
  has_many :user_levels
  has_many :users, through: :user_levels
  has_many :attempts, class_name: 'UserLevelAttempt', through: :user_levels

  def self.create_new(number = 1)
    transaction do
      level = self.create!(number: (self.maximum(:number) || 0) + 1)
      [level] + level.create_next(number - 1)
    end
  end

  def create_next(number = 1)
    return [] if number == 0
    level = self.class.create!(number: self.number + 1)
    self.update!(next_level: level)
    [level] + level.create_next(number - 1)
  end

  def get_highscore
    transaction do
      attempts = self.attempts.select("Max(score) as score,user_level_id").group(:user_level_id).order(score: :desc).limit(5)
    end
  end
end
