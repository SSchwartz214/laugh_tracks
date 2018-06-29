RSpec.describe "a visitor visits comedian page" do
  context "they visit /comedians" do
    it "they see a list of comedians" do

      comedian = Comedian.create(name: "Dane Cook", age: 46)

      visit '/comedians'

      within("#comedian-list")
        expect(page).to have_content("Dane", 46)
    end
  end
end







# As a visitor,
# When I visit `/comedians`
# Then I also see a list of each comedian's specials.
