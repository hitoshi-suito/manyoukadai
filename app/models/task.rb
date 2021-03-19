class Task < ApplicationRecord
  validates :details, presence: true
  validates :title, presence: true
  validates :expired_at, presence: true

  scope :title_search, -> (title){where('title LIKE ?',  "%#{title}%")}
  
  scope :status_search, -> (status){
  if status == '未着手'  
    where(status: 0)
  elsif status == '着手中'
    where(status: 1)
  elsif status == '完了'
    where(status: 2)
  end
  }

  enum status: { '未着手': 0, '着手中': 1, '完了': 2 }
  
  # def self.search(title)
  #   if title
  #     Task.where(['title LIKE ?', "%#{title}%"])
  #   else
  #     Task.all
  #   end
  # end

  # def self.search_status(status)
  #   if status == '未着手'
  #     Task.where(status: 0)  
  #   elsif status == '着手中'
  #     Task.where(status: 1)
  #   elsif status == '完了'
  #     Task.where(status: 2)
  #   end
  # end

      
end
