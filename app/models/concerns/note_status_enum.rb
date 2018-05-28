module NoteStatusEnum
  extend ActiveSupport::Concern

  included do
    enum status: {
      active: 1,
      inactive: 0
    }
  end
end
