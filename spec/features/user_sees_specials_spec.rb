RSpec.describe "a visitor visits comedian page" do
  context "they visit /comedians" do
    it "see a list of each comedian's specials" do

      comedian = Comedian.create(name: "Dane Cook", age: 46)
      special = Special.create(name: "Viscious Circle")

      visit '/comedians'

      within("#specials-list")
        expect(page).to have_content("Viscious Circle")
    end
  end
end
