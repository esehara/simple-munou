require 'spec_helper'

describe SimpleMunou do
  it 'has a version number' do
    expect(SimpleMunou::VERSION).not_to be nil
  end

  it 'can array to munou pattern' do
    expect([0, "is foobar"].to_munou.class).to be SimpleMunou::Brain
  end

  it 'can set word list to munou pattern' do
    munou = [0, "is foobar"].to_munou
    munou.words = ["foo", "bar"]
    expect(munou.words.size).to eq 2
  end

  it 'can set words if string' do
    munou = [0, "is foobar"].to_munou
    munou.words = ["foo", "bar"]
    expect(munou.words[0].class).to be SimpleMunou::Word
  end

  it 'can generate words' do
    munou = [0, " is foobar"].to_munou
    munou.words = ["foo"]
    expect(munou.say).to eq "foo is foobar" 
  end

  it 'set kind if array and 2 size' do
    munou = [1, " is foobar"].to_munou
    munou.words = [["foo", 1]]
    expect(munou.words[0].kind).to eq 1
  end

  it 'choice same kind from word list' do
    munou = [1, " is foobar"].to_munou
    munou.words = [["foo", 1], ["bar", 2]]
    expect(munou.say).to eq "foo is foobar"
  end

  it 'choice all word if word kind is -1'do
    munou = [-1, " is foobar"].to_munou
    munou.words = [["foo", 1], ["bar", 2]]
    expect(munou.valid_words(-1).size).to eq 2
  end
end
