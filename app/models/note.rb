class Note < ApplicationRecord
  include NoteStatusEnum
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :content, presence: true

end
