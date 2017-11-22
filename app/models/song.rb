class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :released, inclusion: { in: %w(true false)}
  validate :release_year_validation
  validates :artist_name, presence: true

  def release_year_validation
    binding.pry
    current_year = DateTime.now.year.to_i
    if self.released
      if self.release_year == nil
        errors.add(:release_year_validation, "If album is released, must have release year.")
      end

      if self.release_year > current_year
        errors.add(:release_year_validation, "Release year cannot be in the future if album is already released.")
      end
    else
      true
    end

  end

end
