module Wit
	# Represents a connection to the Wit HTTP API
	class Client
		require 'multi_json'
		require 'rest_client'

		# The Wit API's base URL
		API_ENDPOINT = 'https://api.wit.ai'

		# @param [String] access_token Your unique Wit developer's access token
		# @param [String] expected_version The Wit API version you wish to use ("YYYYMMDD").
		#   Not passing this version parameter will use the newest version of the API.
		def initialize(access_token, expected_version = nil)
			unless expected_version.nil? || expected_version =~ /\d/
				raise ArgumentError "expected_version must be nil or 'YYYYMMDD' date format"
			end

			@access_token = access_token
			@expected_version = expected_version
		end

		# @note See the official Wit API documentation for details on what these parameters mean.
		#
		# @param [String] q User's query
		# @param [String] context JSON representation of the user's context
		# @param [String] meta JSON representation of any information you want to
		#   attach to this request through its life cycle in Wit.
		#
		# @return [Hash] The API's JSON response as a Hash
		def message(q, context = nil, meta = nil)
			params = {q: q, context: context, meta: meta}
			headers = default_headers.merge(params: params)
			response = api['message'].get(headers)
			MultiJson.load(response)
		end

		private

		def default_headers
			unless @default_headers
				@default_headers = {Authorization: "Bearer #{@access_token}"}
				unless @expected_version.nil?
					@default_headers.merge!(Accept: "application/vnd.wit.#{@expected_version}")
				end
			end
			@default_headers
		end

		def api
			@api ||= RestClient::Resource.new API_ENDPOINT
		end
	end
end
