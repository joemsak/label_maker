module LabelMaker
  module Api
    class Desk
      def self.root
        "https://#{ENV['DESK_NAME']}.desk.com/api/v2"
      end

      def self.get(endpoint)
        resp = token.get("#{root}#{endpoint}")
        JSON.parse(resp.body)
      end

      def self.post(endpoint, body = {})
        resp = token.post("#{root}#{endpoint}", body.to_json)
        JSON.parse(resp.body)
      end

      def self.put(endpoint, body)
        resp = token.put("#{root}#{endpoint}", body.to_json)
        JSON.parse(resp.body)
      end

      private
      def self.token
        @token ||= OAuth::AccessToken.from_hash(
                     consumer,
                     oauth_token: ENV["DESK_ACCESS_TOKEN"],
                     oauth_token_secret: ENV["DESK_ACCESS_TOKEN_SECRET"]
                   )
      end

      def self.consumer
        OAuth::Consumer.new(
          ENV["DESK_API_CONSUMER_KEY"],
          ENV["DESK_API_CONSUMER_SECRET"],
          site: "https://#{ENV['DESK_NAME']}.desk.com",
          scheme: :header
        )
      end
    end
  end
end
