class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :released, inclusion: { in: %w(true false)} 

  def release_date_validation
    if self.released
      if released_date == nil 
      end
    end
  end
  
end
