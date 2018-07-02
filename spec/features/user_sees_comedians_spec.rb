RSpec.describe "a visitor visits index page" do
  context "they visit /comedians" do
    it "sees a list of comedians" do

      comic = Comedian.create(name: "Dane Cook", age: 46)

      visit '/comedians'

      expect(page).to have_content("Name: #{comic.name}")
      expect(page).to have_content("Age: #{comic.age}")
    end
  end
    it "sees a list of each comedian's specials" do

      comic = Comedian.create(name: "Dane Cook", age: 46)
      special1 = comic.specials.create(name: "Viscious Circle")
      special2 = comic.specials.create(name: "Harmful If Swallowed")

      visit '/comedians'

      expect(page).to have_content("Special: #{special1.name}")
      expect(page).to have_content("Special: #{special2.name}")
    end
    it "sees the average age for all comedians" do

      comic = Comedian.create(name: "Dane Cook", age: 46)
      comic = Comedian.create(name: "Chris Rock", age: 50)
      expected_result = 48

      visit '/comedians'

      expect(page).to have_content("Average age of all comedians: #{expected_result}")
    end
    it 'sees a list of all comedians aged 34' do

      comic1 = Comedian.create(name: "Dane Cook", age: 46)
      comic2 = Comedian.create(name: "Mikey P", age: 34)
      comic3 = Comedian.create(name: "Fatty T", age: 34)

      visit '/comedians?age=34'

      expect(page).to_not have_content("Name: #{comic1.name}")
      expect(page).to have_content("Name: #{comic2.name}")
      expect(page).to have_content("Name: #{comic3.name}")
    end
    it 'can see the count of specials for each comedian' do
      comic1 = Comedian.create(name: "Bob", age: 46)
      comic1.specials.create(name: "Funny Stuff")
      comic1.specials.create(name: "FS2")

      expected_result = 2

      visit '/comedians'

      expect(page).to have_content("Total: #{expected_result}")
    end
end
