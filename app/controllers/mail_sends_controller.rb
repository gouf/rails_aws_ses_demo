class MailSendsController < ApplicationController
  def index
    @sent_mails = []
    @queued_mails = []
  end

  def new
  end

  def confirm
    @subject = params[:Subject]
    @to = params[:To]
    @body = params[:Body]
  end
end
