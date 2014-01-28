class Message < AbstractSkypeModel
  skype_table_name!

  belongs_to :conversation, foreign_key: :convo_id
  has_many :participants, through: :conversation

  skype_time_columns :timestamp

  scope :with_participant, lambda{ |login| joins(:participants).where{participants.identity =~ "%#{login}%"} }

  def body
    @body ||= Nokogiri::XML.fragment(body_xml).children.map(&:to_s).join("\n")
  end

  def to_s
    "#{id} #{timestamp} #{from_dispname}: #{body}"
  end

  scope :trace, lambda {
    order(:timestamp).all.each{ |m| puts "#{m.timestamp.to_s.blue} #{m.from_dispname.to_s.green}: #{m.body.to_s.yellow}" };
    true
  }
  
end