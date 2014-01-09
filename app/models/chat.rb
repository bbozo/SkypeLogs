class Chat < AbstractSkypeModel
  skype_table_name!

  skype_time_columns :last_change, :activity_timestamp

  belongs_to :conversation, foreign_key: :conv_dbid
end
