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

  def create
    send_email(subject: params[:Subject], to: params[:To], body: params[:Body])
  end

  private

  def send_email(subject:, to:, body:)
    secrets = Rails.application.secrets.select { |key, _value| key.to_s.include?('aws') }
    ses = Mail::SesClient.new(
      access_key_id: secrets[:aws_access_key_id],
      secret_access_key: secrets[:aws_secret_access_key]
    )
    ses.send(subject: subject, to: to, body: body)
  end
end
