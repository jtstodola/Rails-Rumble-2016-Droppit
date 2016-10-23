require 'dropbox_sdk'
class PublicInboxesController < ApplicationController
  def show
    slug = params[:slug]
    @inbox = Inbox.where(slug: slug).first
  end

  def create
    slug = params[:slug]
    inbox = Inbox.where(slug: slug).first
    token = inbox.user.tokens.where(service: inbox.service).first.token

    # upload to dropbox using token and remote folder
    # and the file.

    client = DropboxClient.new token
    destination = File.join(inbox.remote_folder, params[:file].original_filename)
    begin
      client.put_file(destination, params[:file].read)
      message = "File uploaded to Dropbox!"
    rescue
      message = "Unable to update"
    end

    redirect_to public_inbox_path(slug), notice: message
  end
end

