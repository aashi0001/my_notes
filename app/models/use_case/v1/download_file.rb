module UseCase
  module V1
  class DownloadFile
    def initialize(note:)
     @note = note
    end

    def call
      file = "public/archieved_notes/#{note.title}.txt"
        File.open(file, "w+") do |f|
          f.write(note.content)
        end
     return file
    end



    private

    attr_reader :note


   end
  end
end
