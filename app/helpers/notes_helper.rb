module NotesHelper
  class Utilities
  	class << self
	    def str_to_ary(string = nil)
	  	  string.present? ? string.split(',') : []
	    end
	end
  end
end
