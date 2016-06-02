module Mail
  class SesClient
    def initialize(access_key_id:, secret_access_key:)
      @client = Aws::SES::Client.new(
        access_key_id: access_key_id,
        secret_access_key: secret_access_key,
        region: 'us-east-1'
      )
    end

    def send(to:, subject:, body:)
      c = configurations
      # Note: This email address must be either individually verified with Amazon SES, or from a domain that has been verified with Amazon SES
      c[:source] = 'noreply@inn0centzero.com'
      c[:destination][:to_addresses] = [to]
      c[:message][:subject][:data] = subject
      c[:message][:body][:text][:data] = body

      @client.send_email(c)
    end

    private

    def configurations
      {
        source: "", # required
        destination: { # required
          to_addresses: [],
          cc_addresses: [],
          bcc_addresses: [],
        },
        message: { # required
          subject: { # required
            data: "", # required
            charset: "UTF-8",
          },
          body: { # required
            text: {
              data: "", # required
              charset: "UTF-8",
            }
          },
        }
      }
    end
  end
end
