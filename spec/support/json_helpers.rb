module JsonHelpers
  # Parses `response.body` with JSON.parse and returns the appropriate structure.
  # This methods also makes use of HashWithIndifferentAccess so the client don't
  # need to worry about accessing attributes in the correct way.
  #
  # Usage:
  #   describe 'UsersController' do
  #     include JsonHelpers
  #
  #     it 'just works' do
  #       expect(json).to be_a Hash
  #       expect(json[:data]).to be_a Hash
  #     end
  #   end
  def json
    case json = JSON.parse(response.body)
    when Array
      json
    when Hash
      json.with_indifferent_access
    end
  end
end
