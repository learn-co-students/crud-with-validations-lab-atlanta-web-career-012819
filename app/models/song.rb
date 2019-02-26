class MyValidator < ActiveModel::Validator
  def validate(record)
    if record.released == true
      if record.release_year.nil?
        record.errors[:release_year] << 'Need a release year!'
      elsif record.release_year > Time.now.year
        record.errors[:release_year] << 'Release year cannot be in the future!'
      end
    end
  end
end

class Song < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with MyValidator
  validates :title, presence: true
  validates :released, inclusion: [true, false]
  validates :title, uniqueness: { scope: :release_year }
end
