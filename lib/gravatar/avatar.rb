require 'digest/md5'

module Gravatar
  class Avatar
    BASE_URL = 'https://www.gravatar.com/avatar/'.freeze

    attr_reader :email

    def initialize(email)
      @email = email.downcase
    end

    def url
      "#{BASE_URL}#{hash}"
    end

    def hash
      @hash ||= Digest::MD5.hexdigest email
    end
  end
end
