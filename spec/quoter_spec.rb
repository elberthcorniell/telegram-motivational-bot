require_relative '../lib/quotes'

describe 'Quotes' do
  let(:quoter) { Quotes.new }
  describe 'initialize' do
    it 'Succesfully starts a new quoter with given URL' do
      file = File.read('./config.json')
      data = JSON.parse(file)
      url = data['quotes_api_route']
      expect(quoter.url).to eql url
    end
    it 'Successfully starts a new quoter with given URL as String' do
    end
  end
  describe 'get' do
    it 'Succesfully returns a Hash' do
      expect(quoter.get.is_a?(Hash)).to_not eql false
    end
    it 'Succesfully returns an Element with a valid Text property' do
      quote = quoter.get
      expect(quote['text'].is_a?(String)).to eql true
    end
    it 'Succesfully returns an Element with a valid Author property' do
      quote = quoter.get
      expect(quote['author'].is_a?(String)).to eql true
    end
  end
end
