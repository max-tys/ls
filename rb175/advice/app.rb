require_relative 'monroe'
require_relative 'advice'
# require 'erb'
# why don't we type "require 'erb'" here?

class App < Monroe
  def call(env)
    case env['REQUEST_PATH']
    when '/'
      # why can we pass in a symbol to erb?
      status = '200'
      headers = {"Content-Type" => 'text/html'}
      response(status, headers) do
        erb :index
      end
    when '/advice'
      status = '200'
      headers = {"Content-Type" => 'text/html'}
      piece_of_advice = Advice.new.generate
      response(status, headers) do
        erb :advice, message: piece_of_advice
      end
    else
      status = '404'
      headers = {"Content-Type" => 'text/html', "Content-Length" => '60'}
      response(status, headers) do
        erb :not_found
      end
    end
  end
end

# p App.new.call({'REQUEST_PATH' => '/'})