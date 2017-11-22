class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :released, inclusion: { in: %w(true false)}

  def release_year_validation
    if self.released

      if self.released_year == nil
        errors.add(:release_year_validation, "If album is released, must have release year.")
      end

      if self.released_year > DateTime.now.year

      end

    end
  end

end
