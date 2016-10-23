class PublicInboxesController < ApplicationController
  def show
    slug = params[:slug]
    @inbox = Inbox.where(slug: slug).first
  end

  def create
    slug = params[:slug]
    inbox = Inbox.where(slug: slug).first
    token = inbox.user.tokens.where(service: inbox.service).first
    remote_folder = inbox.remote_folder

    # upload to dropbox using token and remote folder
    # and the file.

    redirect_to public_inbox_path(slug), notice: "Uploaded."

  end
end

