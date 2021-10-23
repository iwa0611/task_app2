class Room < ApplicationRecord
  validates :room_name, presence: true
  validates :intro, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :image, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :person_num, presence: true
  mount_uploader :image, ImageUploader
  belongs_to :user, optional: true
  
  
  validate:check_date_today
  validate:check_date_end
  
  def check_date_today
    if end_date.nil? || end_date <= Date.today
      errors.add(:end_date,"は今日以降を選択してください")
    end
  end

  def check_date_end
    if end_date.nil? || end_date < start_date
      errors.add(:end_date,"は開始日より後の日にちを選択してください")
    end
  end
  
end
