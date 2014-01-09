class Message < AbstractSkypeModel
  skype_table_name!

  belongs_to :conversation, foreign_key: :convo_id

  skype_time_columns :timestamp

  def body
    @body ||= Nokogiri::XML.fragment(body_xml).children.map(&:to_s).join("\n")
  end

  def to_s
    "#{timestamp} #{from_dispname}: #{body}"
  end
  
end