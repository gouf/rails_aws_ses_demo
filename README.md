# Rails AWS SES Demo

Things you may want to cover:

* Aamazon SES verified domain or email address

  rewrite `lib/mail/ses_client.rb`:L14 mail address

  * [Verifying Email Addresses and Domains in Amazon SES - Amazon Simple Email Service](http://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html)

* AWS access key and secret accesse key

  Set as:

  ```sh
  export AWS_ACCESS_KEY_ID=Your_Aws_Access_Key_ID
  export AWS_SECRET_ACCESS_KEY=Your_Aws_Secret_Access_Key
  ```

* Ruby version : 2.3.1

* Up and Run : `rails s`

* Accesse to: 'http://localhost:3000/mail_sends'
