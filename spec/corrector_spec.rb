require_relative 'spec_helper'

describe Corrector do
  before :each do
    @corrector = Corrector.new
  end

  describe 'Check the word capitalization' do
    it 'return the corrected word' do
      @corrector.correct_name('mihreteab').should eql 'Mihreteab'
    end
  end

  describe 'Check the word capitalization' do
    it 'return the corrected word' do
      expect(@corrector.correct_name('this is a longer string to check whether it').length).to equal 10
    end
  end
end
