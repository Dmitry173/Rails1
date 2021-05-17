class GithubClient

  ROOT_ENDPONT = 'https://api.github.com'
  ACCESS_TOKEN = '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'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist

  end

  private

    def setup_http_client
      Faraday.new(url: ROOT_ENDPONT)
    end
end 
