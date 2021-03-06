class Activity < ActiveRecord::Base
  belongs_to :user

  scope :runs, -> { where(strava_type: 'Run') }
  scope :fortnight, -> { runs.where(['start_date_local >= ?', 14.days.ago]).where(['start_date_local <= ?', Time.now]) }
  scope :c2014, -> { runs.where(['start_date_local >= ?', Time.new(2014, 5, 5)]).where(['start_date_local <= ?', Time.new(2014, 9, 12)]) }
  scope :p2015, -> { runs.where(['start_date_local >= ?', Time.new(2014, 12, 1)]).where(['start_date_local < ?', Time.new(2015, 5, 1)]) }
  scope :c2015, -> { runs.where(['start_date_local >= ?', Time.new(2015, 5, 1)]).where(['start_date_local < ?', Time.new(2015, 10, 1)]) }
end
