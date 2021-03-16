require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    @analyzed_text = TextAnalyzer.new(params[:user_text])
    @wc = @analyzed_text.count_of_words
    @vc = @analyzed_text.count_of_vowels
    @cc = @analyzed_text.count_of_consonants
    @mul = @analyzed_text.most_used_letter.shift
    
    erb :results
  end

end
