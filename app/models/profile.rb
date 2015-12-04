class Profile < ActiveRecord::Base
  belongs_to :user

  validate :one_null
  def one_null
    if(first_name.nil? and last_name.nil?)
      errors.add(:last_name, "and First name cannot be both empty")
    end
  end

  validates :gender, inclusion: ["male", "female"]

  validate :no_male_sue
  def no_male_sue
    if(first_name == "Sue" and gender == "male")
      errors.add(:first_name, "cannot be male")
    end
  end

  def self.get_all_profiles(min, max)
    Profile.all.where("birth_year BETWEEN :min and :max", max: max, min: min).order(birth_year: :asc)
  end
end
