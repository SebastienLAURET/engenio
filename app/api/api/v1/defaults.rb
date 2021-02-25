module Api
  module V1
    module Defaults
      extend ActiveSupport::Concern

      included do
        version 'v1', using: :path
        format :json
        prefix :api
      end

    end
  end
end