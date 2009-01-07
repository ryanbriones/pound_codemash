class Tweet
  include DataMapper::Resource

  property :id, Integer, :key => true
  property :text, String
  property :from_user_id, Integer
  property :from_user, String
  property :created_at, DateTime

  def text_codemashified
    self.text.gsub(/(#codemash)/i, '<span class="hl_codemash">\1</span>')
  end

  def created_at_codemash_time
    return self.created_at unless TZ
    TZ.utc_to_local(self.created_at)
  end
end
