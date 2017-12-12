require 'rails_helper'

describe LegacyDatasetsController, type: :controller do
  describe 'visiting a dataset page with a legacy URL' do
    it "redirects to the latest slugged URL" do
      dataset = DatasetBuilder.new.with_legacy_name('a-legacy-name').build
      index([dataset])

      get :redirect, params: { legacy_name: 'a-legacy_name' }

      expect(response).to redirect_to(dataset_url(dataset[:uuid], dataset[:name]))
      expect(response.status).to eql 301
    end
  end
end
