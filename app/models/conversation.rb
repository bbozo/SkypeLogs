class Conversation < AbstractSkypeModel
  skype_table_name!

  has_many :participants, foreign_key: :convo_id
  has_many :messages, foreign_key: :convo_id

end
