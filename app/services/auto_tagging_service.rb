require 'auto_tagging'
 class AutoTaggingService


  def initialize(body:)
  	@body = body
  	tag_service
  end

  def find_tags
    result = []
  	result =  AutoTagging.get_tags(body)
  	return result
  end


  private

  attr_reader :body, :tag

  def tag_service
  	AutoTagging.services = [:yahoo]
  end

 end