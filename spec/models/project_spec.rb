require "rails_helper"

describe "item Attribute Requirements on Create", :type => :model do
    context "validation tests" do
        it "ensures the title is present when creating item" do
            item = Item.new(description: "Content of the description", price: 12.34, brand: "ASUS", mousestyle: "ergonomic")
            expect(item.valid?).to eq(false)
        end
        it "should not be able to save item when title missing" do
            item = Item.new(description: "Content of the description", price: 12.34, brand: "ASUS", mousestyle: "ergonomic")
            expect(item.save).to eq(false)
        end
        it "ensures the descritption is present when creating item" do
            item = Item.new(title: "Title", price: 12.34, brand: "ASUS", mousestyle: "ergonomic")
            expect(item.valid?).to eq(false)
        end
        it "should not be able to save item when description missing" do
            item = Item.new(title: "Title", price: 12.34, brand: "ASUS", mousestyle: "ergonomic")
            expect(item.save).to eq(false)
        end
        it "should be able to save item when have description and title" do
            item = Item.new(title: "Title", description: "Content of the description", price: 12.34, brand: "ASUS", mousestyle: "ergonomic")
            expect(item.save).to eq(true)
        end
    end
end

describe "Project Attribute Requirements on Edit", :type => :model do
    context "Edit project" do
        before (:each) do
            @item = Item.create(title: "Title", description: "Content of the description", price: 12.34, brand: "ASUS", mousestyle: "ergonomic")
        end
        it "ensures the title is present when editing project" do
            @item.update(:title => "New Title")
            expect(@item.title == "New Title")
        end
    end
end