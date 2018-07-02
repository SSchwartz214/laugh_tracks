RSpec.describe Comedian do
  describe 'Validations' do
    describe 'Required Field(s)' do
      it 'should be invalid if missing a name' do
        comic = Comedian.create(age: 48)
        expect(comic).to_not be_valid
      end
      it 'should be invalid if missing an age' do
        comic = Comedian.create(name: 'Mitch Hedberg')
        expect(comic).to_not be_valid
      end
    end
  end
  describe 'Class Methods' do
    it 'can calculate average age' do
      Comedian.create(age: 48, name: 'Jon')
      Comedian.create(age: 50, name: 'Tom')

      expected_result = 49

      expect(Comedian.average_age).to eq(expected_result)
    end
    it 'can count total number of specials' do
      comic1 = Comedian.create(name: "Bob", age: 46)
      comic1.specials.create(name: "Funny Stuff")
      comic1.specials.create(name: "FS2")
      comic2 = Comedian.create(name: "Joe", age: 44)
      comic2.specials.create(name: "Funnier Stuff")
      comic2.specials.create(name: "FS3")
      comic2.specials.create(name: "FS4")

      expected_result1 = 2
      expected_result2 = 3

      expect(comic1.specials_count).to eq(expected_result1)
      expect(comic2.specials_count).to eq(expected_result2)
    end
  end
end
