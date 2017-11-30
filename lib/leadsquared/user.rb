require 'json'
require 'active_support/core_ext/object/try'

module Leadsquared
  class User < ApiConnection
    SERVICE = '/v2/UserManagement.svc/'.freeze

    def initialize(connection = nil)
      super(SERVICE, connection)
    end

    def get_user_by_id(user_id)
      url = url_with_service("User/Retrieve/ByUserId")
      response = connection.get(url, {id: user_id})
      parsed_response = handle_response response
      parsed_response.first
    end

    def get_user_by_email(email)
      url = url_with_service("User/Retrieve/ByEmailAddress")
      response = connection.get(url, {emailAddress: email})
      parsed_response = handle_response response
      parsed_response.first
    end
  end

end
