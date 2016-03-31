require_relative '../models/params_checker'

module RushHour
  class Server < Sinatra::Base
    include ParamsChecker

    post '/sources' do
      client = Client.new(change_case(params))

      client.save if check(change_case(params))
    end

    post '/sources/:identifier/data' do |identifier|

    end

    not_found do
      erb :error
    end
  end
end
