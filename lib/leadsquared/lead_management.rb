require 'json'

module Leadsquared
  class LeadManagement
    SERVICE = '/v2/LeadManagement.svc/'.freeze

    def get_meta_data
    end

    def get_lead_by_id
    end

    def get_lead_by_email
    end

    def quick_search
    end

    def create_lead(email = nil, first_name = nil, last_name = nil)
      url = url_with_service("Lead.Create")
      body = [
        {
          "Attribute": "EmailAddress",
          "Value": email
        },
        {
          "Attribute": "FirstName",
          "Value": first_name
        },
        {
          "Attribute": "LastName",
          "Value": last_name
        }
      ]
      response = connection.post(url, {}, body.to_json)
      handle_response response
    end

    def update_lead
    end

    def create_or_update
    end

    def visitor_to_lead
    end

    def search_lead_by_criteria
    end

    def send_email_to_lead
    end

    private

    def url_with_service(action)
      SERVICE + action
    end

    def connection
      @connection ||= Leadsquared::Client.new
    end

    def handle_response(response)
      case response.status
      when 200
        return JSON.parse response.body
      when 400
        raise InvalidRequestError.new("Bad Request")
      when 401
        raise InvalidRequestError.new("Unauthorized Request")
      when 404
        raise InvalidRequestError.new("API Not Found")
      when 500
        raise InvalidRequestError.new("Internal Error")
      else
        raise InvalidRequestError.new("Unknown Error")
      end
    end
  end

end