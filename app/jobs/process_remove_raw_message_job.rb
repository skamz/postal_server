class ProcessRemoveRawMessageJob < Postal::Job
  def perform
  	logger = Postal.logger_for(:cron)
  	logger.info "Run ProcessRemoveRawMessageJob"
    Server.all.each do |server|
      if server.raw_message_retention_size
        logger.info "Tidying raw messages (by size) for #{server.permalink} (ID: #{server.id}). Keeping #{server.raw_message_retention_size} MB of data."
        server.message_db.provisioner.remove_raw_tables_until_less_than_size(server.raw_message_retention_size * 1024 * 1024)
      end
    end
  end
end
