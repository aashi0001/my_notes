class Note < ApplicationRecord
  include NoteStatusEnum

  belongs_to :user

  validates :user, presence: true
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :content, presence: true


  def get_tags
  	self.etags = AutoTaggingService.new( body: self.content).find_tags
  end

end
