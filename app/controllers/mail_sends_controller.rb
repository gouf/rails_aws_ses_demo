class MailSendsController < ApplicationController
  def index
    @sent_mails = []
    @queued_mails = []
  end

  def new
  end
end
