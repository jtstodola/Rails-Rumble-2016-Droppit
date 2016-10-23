require 'dropbox_sdk'
class PublicInboxesController < ApplicationController
  def show
    slug = params[:slug]
    @inbox = Inbox.where(slug: slug).first

    if @inbox.expire.present? && Time.now >= @inbox.expire
      redirect_to root_url, notice: "Inbox has expired or is invalid."
    end
  end

  def create
    slug = params[:slug]
    inbox = Inbox.where(slug: slug).first
    token = inbox.user.tokens.where(service: inbox.service).first.token

    # upload to dropbox using token and remote folder
    # and the file.

    client = DropboxClient.new token
    messages = []
    params[:files].each do |file|
      destination = File.join(inbox.remote_folder, file.original_filename)
      begin
        client.put_file(destination, file.read)
        messages << "File #{file.original_filename} uploaded to Dropbox!"
      rescue
        messages << "Unable to upload #{file.original_filename} to Dropbox"
      end

    end
    redirect_to public_inbox_path(slug), notice: messages.join("<br>")
  end
end

