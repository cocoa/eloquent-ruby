class SuperSecretDocument
  def initialize(original_document, time_limit_seconds)
    @original_document = original_document
    @time_limit_seconds = time_limit_seconds
    @create_time = Time.now
  end

  def time_expired?
    Time.now - @create_time >= @time_limit_seconds
  end

  def check_for_expiration
    raise 'Document is no longer available' if time_expired?
  end


  # the promise and pain of delegation (page 274)
=begin
  def content
    check_for_expiration
    return @original_document.content
  end

  def title
    check_for_expiration
    return @original_document.title
  end

  def author
    check_for_expiration
    return @original_document.author
  end
=end


  # the method_missing method to the rescue (page 277)
=begin
  def method_missing(method_name, *args)
    check_for_expiration
    @original_document.send(method_name,*args)
  end
=end


  # more discriminating delegation (page 278)

  DELEGATED_METHODS = [:content, :words]

  def method_missing(method_name, *args)
    check_for_expiration
    if DELEGATED_METHODS.include?( method_name )
      @original_document.send(method_name,*args)
    else
      super 
    end
  end

end