require "rails_helper"

RSpec.describe SavedItemResource, type: :resource do
  describe "serialization" do
    let!(:saved_item) { create(:saved_item) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(saved_item.id)
      expect(data.jsonapi_type).to eq("saved_items")
    end
  end

  describe "filtering" do
    let!(:saved_item1) { create(:saved_item) }
    let!(:saved_item2) { create(:saved_item) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: saved_item2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([saved_item2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:saved_item1) { create(:saved_item) }
      let!(:saved_item2) { create(:saved_item) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      saved_item1.id,
                                      saved_item2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      saved_item2.id,
                                      saved_item1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
