class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: { in: [true,false] }
  validates :artist_name, presence: true
  validates :release_year, inclusion: { in: 0..Time.now.year }, presence: true, if: :released?
end
