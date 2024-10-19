# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::CategoriesController, type: :request do
  let(:user) {
    Fabricate(:user, email: 'test@test.com', password: 'password', type: 'User')
  }

  let(:category) {
    Fabricate(:category, name: 'new', slug: 'new', description: 'just a test description', status: 'active')
  }

  describe 'GET /api/v1/categories' do
    it 'responds with ok status' do
      get api_v1_categories_url, params: {category: {}}

      expect(response).to have_http_status :ok
    end

    it 'responds with categories' do
      Fabricate(:category, name: 'Mobiles', slug: 'mobiles', description: 'just a test description', status: 'active')
      Fabricate(:category, name: 'Clothes', slug: 'clothes', description: 'just a test description', status: 'active')

      get api_v1_categories_path

      expect(response.body).to match_response_schema('categories', strict: true)
    end
  end

  describe 'POST /api/v1/categories' do
    before(:each) do
      sign_in :user
    end

    context 'Create Category' do
      it "with empty params" do
        post api_v1_categories_url, params: {category: {}}

        expect(response).to have_http_status :bad_request
      end

      it "successfully" do
        post api_v1_categories_path, params: {
          category: {
            name: 'test',
            slug: 'test',
            description: 'test description',
            status: 'inactive'
          }
        }

        expect(response).to have_http_status :created
      end
    end
  end

  describe 'GET /api/v1/categories/{category id}' do
    it 'responds with ok status' do
      get api_v1_category_path(category)

      expect(response).to have_http_status :ok
    end
  end

  describe 'PUT /api/v1/categories/{category id}' do
    before(:each) do
      sign_in :user
    end

    it 'Update Category' do
      put api_v1_category_path(category), params: {
        category: {
          name: 'test',
          slug: 'test',
          status: 'active'
        }
      }

      response_body = JSON.parse(response.body)
      expect(response).to have_http_status :ok
      expect(response_body["category"]["name"]).to eq 'test'
    end
  end

  describe 'DELETE /api/v1/categories/{category id}' do
    before(:each) do
      sign_in :user
    end

    it 'Delete Category' do
      delete api_v1_category_path(category)

      expect(response).to have_http_status :ok
    end
  end
end