require "rails_helper"

RSpec.feature "Items", type: :feature do

    context "show" do

        let(:item) { Item.create(title: "Title", description: "Content of the description", price: 12.34, brand: "ASUS", mousestyle: "ergonomic") }

        scenario "should find name in /show" do
            visit root_path
            click_button 'Show'
            expect(page).to have_content("Name:")
        end
    end

    context "Login" do
        scenario "should sign up" do
          visit root_path
          click_link 'Sign up'
          within("form") do
            fill_in "Email", with: "testing@test.com"
            fill_in "Password", with: "123456"
            fill_in "Password confirmation", with: "123456"
            click_button "Sign up"
          end
          expect(page).to have_content("Welcome! You have signed up successfully.")
        end
    
        scenario "should log in" do
          user = FactoryBot.create(:user)
          login_as(user)
          visit root_path
          expect(page).to have_content("Edit Profile")
        end
    end


    context "Update item" do
        let(:item) { Item.create(title: "Title", description: "Content of the description", price: 12.34, brand: "ASUS", mousestyle: "ergonomic") }
        before(:each) do
            #user = FactoryBot.create(:user)
            #login_as(user)
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
                fill_in "description", with: ""
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