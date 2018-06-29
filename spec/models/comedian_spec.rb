RSpec.describe Comedian do
  describe 'Validations' do
    describe 'Required Field(s)' do
      it 'should be invalid if missing a name' do
        comedian = Comedian.create(age: 48)
        expect(comedian).to_not be_valid
      end

      it 'should be invalid if missing an age' do
        comedian = Comedian.create(name: 'Mitch Hedberg')
        expect(comedian).to_not be_valid
      end
    end
  end
end
