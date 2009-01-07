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
end
