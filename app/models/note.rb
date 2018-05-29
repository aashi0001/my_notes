class Note < ApplicationRecord
  include NoteStatusEnum

  belongs_to :user

  validates :user, presence: true
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :content, presence: true


  scope :user_notes, lambda { |user|
    where("notes.user_id = ?", user.id)
 } 


  def get_tags
  	self.etags = AutoTaggingService.new( body: self.content).find_tags
  end

end
