class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :released, inclusion: { in: %w(true false)}
  validate :release_year_validation

  def release_year_validation
    if self.released

      if self.released_year == nil
        errors.add(:release_year_validation, "If album is released, must have release year.")
      end

      if self.released_year > DateTime.now.year.to_i
        errors.add(:release_year_validation, "Release year cannot be in the future if album is already released.")
      end

    end
  end

end
