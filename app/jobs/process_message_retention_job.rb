class ProcessMessageRetentionJob < Postal::Job
  def perform
  	logger = Postal.logger_for(:cron)
  	logger.info "Run ProcessMessageRetentionJob"
    Server.all.each do |server|
      if server.raw_message_retention_days
        # If the server has a maximum number of retained raw messages, remove any that are older than this
        logger.info "Tidying raw messages (by days) for #{server.permalink} (ID: #{server.id}). Keeping #{server.raw_message_retention_days} days."
        server.message_db.provisioner.remove_raw_tables_older_than(server.raw_message_retention_days)
      end

      if server.message_retention_days
        logger.info "Tidying messages for #{server.permalink} (ID: #{server.id}). Keeping #{server.message_retention_days} days."
        server.message_db.provisioner.remove_messages(server.message_retention_days)
      end
    end
  end
end
