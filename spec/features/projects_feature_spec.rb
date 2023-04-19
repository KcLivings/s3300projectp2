require "rails_helper"

RSpec.feature "Items", type: :feature do
    context "Update item" do
        let(:item) { Item.create(title: "Title", description: "Content of the description", price: 12.34, brand: "ASUS", mousestyle: "ergonomic") }
        before(:each) do
            visit edit_item_path(item)
        end

        scenario "should be successful" do
            within("form") do
                fill_in "Description", with: "New description content"
            end
            click_button "Update Item"
            expect(page).to have_content("Item was successfully updated")
        end
        scenario "descrypt should fail" do
            within("form") do
                fill_in "Description", with: ""
            end
            click_button "Update Item"
            expect(page).to have_content("Description can't be blank")
        end
        scenario "title should fail" do
            within("form") do
                fill_in "title", with: ""
            end
            click_button "Update Item"
            expect(page).to have_content("Title can't be blank")
        end
    end
end