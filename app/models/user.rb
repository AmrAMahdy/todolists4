class User < ActiveRecord::Base
  has_one :profile, dependent: :destroy
  has_many :todo_lists, dependent: :destroy
  has_many :todo_items, through: :todo_lists, source: :todo_items

  validates :username, presence: true

  def get_completed_count
    c = 0
    todo_items.each do |i|
      if(i.completed)
        c += 1
      end
    end
    return c
  end
end
