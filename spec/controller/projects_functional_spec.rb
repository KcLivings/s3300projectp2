require 'rails_helper'
require 'spec_helper'

RSpec.describe "/items", type: :request do

    #before(:each) do
    #  user = FactoryBot.create(:user)
    #  login_as(user)
    #end

    let(:valid_attributes) {
        {
            title: 'a title',
            description: 'a description',
            price: 12.34,
            brand: 'ASUS',
            mousestyle: 'ergonomic'
        }
    }
    
    let(:invalid_attributes) {
        {
            title: '',
            description: '',
            price: '',
            brand: '',
            mousestyle: ''
        }
    }
    
    describe "GET /index" do
      it "renders a successful response" do
        
        Item.create! valid_attributes
        get items_url
        expect(response).to be_successful
      end
    end
    
    describe "GET /show" do
      it "renders a successful response" do
        item = Item.create! valid_attributes
        get items_url(item)
        expect(response).to be_successful
      end
    end
    
    context "item routes" do


      describe "GET /new" do
        it "renders a successful response" do
          user = FactoryBot.create(:user)
          login_as(user)
          get new_item_url
          expect(response).to be_successful
        end
      end
    
      describe "GET /edit" do
        it "render a successful response" do
          item = Item.create! valid_attributes
          get edit_item_url(item)
          expect(response).to be_successful
        end
      end
    
      describe "POST /create" do
        context "with valid parameters" do
          it "creates a new Article" do
            expect {
              post items_url, params: { item: valid_attributes }
            }.to change(Item, :count).by(1)
          end
    
          it "redirects to the created article" do
            post items_url, params: { item: valid_attributes }
            expect(response).to redirect_to(item_url(Item.last))
          end
        end
    
        context "with invalid parameters" do
          it "does not create a new Article" do
            expect {
              post items_url, params: { item: invalid_attributes }
            }.to change(Item, :count).by(0)
          end
    
          it "renders a successful response (i.e. to display the 'new' template)" do
            post items_url, params: { item: invalid_attributes }
            expect(response).to be_successful
          end
        end
      end
    
      describe "PATCH /update" do
        context "with valid parameters" do
          let(:new_attributes) {
              {
                  title: 'a new title',
                  description: 'a new description',
                  price: '12.34',
                  brand: 'Corsair',
                  mousestyle: 'ergonomic'
              }
          }
    
          it "updates the requested article" do
            item = Item.create! valid_attributes
            patch item_url(item), params: { item: new_attributes }
            item.reload
            expect(@item.title == "a new title")
          end
    
          it "redirects to the article" do
              item = Item.create! valid_attributes
            patch item_url(item), params: { item: new_attributes }
            item.reload
            expect(response).to redirect_to(item_url(item))
          end
        end
    
        context "with invalid parameters" do
          it "renders a successful response (i.e. to display the 'edit' template)" do
              item = Item.create! valid_attributes
            patch item_url(item), params: { item: invalid_attributes }
            expect(response).to be_successful
          end
        end
      end
    
      describe "DELETE /destroy" do
        it "destroys the requested article" do
          item = Item.create! valid_attributes
          expect {
            delete item_url(item)
          }.to change(Item, :count).by(-1)
        end
    
        it "redirects to the articles list" do
          item = Item.create! valid_attributes
          delete item_url(item)
          expect(response).to redirect_to(items_url)
        end
      end
    end
end