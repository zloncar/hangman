describe "playing hangman" do

  it "display a masked word" do
    word = "hangman"
    placeholder = play(word)
    expect( placeholder.to_s ).to eq("_______")
  end

  it "reveals letteres guessed correctly" do
    word = "hangman"
    placeholder = play(word)
    placeholder.make_guess(word, "h")
    expect( placeholder.to_s ).to eq("h______")

    placeholder.make_guess(word, "a")
    expect( placeholder.to_s ).to eq("ha___a_")
  end

  it "updates_the_graveyard" do
    pending
    word = "hangman"
    placeholder = play(word)
    placeholder.make_guess(word, "z")
    expect( placeholder.graveyard.to_s ).to eq("z")
  end

  def play(word)
    Placeholder.new(word)
  end

  class Placeholder
    def initialize(word)
      @placeholder = '_' * word.size
    end

    def graveyard

    end

    def to_s
      @placeholder
    end

    def []=(key, value)
      @placeholder[key] = value
    end

    def make_guess(word, guess)
      word.chars.each_with_index do |char, index|
        self[index] = char if char == guess
      end
    end

  end


end
