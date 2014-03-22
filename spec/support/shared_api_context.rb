shared_context 'shared_api_context', api: true do

  include Kardex::Engine.routes.url_helpers

  def response_json
    unless @response_json
      @response_json = JSON.parse(response.body) rescue nil
    end
    @response_json
  end

end
