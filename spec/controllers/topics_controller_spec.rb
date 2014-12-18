require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  describe 'GET /topics' do
    before do
      FactoryGirl.create_list(:topic, 10)
      FactoryGirl.create(:topic, status: :inactive)
    end
    before do
      get(:index)
    end
    it 'renders correct view' do
      expect(response).to render_template(:index)
    end
    it 'returns correct http status' do
      expect(response).to have_http_status(:ok)
    end
    it 'loads only active topics' do
      expect(assigns(:topics)).to eq(Topic.active)
    end
  end # 'describe GET /topics'

  describe 'GET /topics/:id' do
    let (:topic) { FactoryGirl.create(:topic) }
    let (:topic_inactive) { FactoryGirl.create(:topic, status: :inactive)}

    context 'when topic does not exist' do
      before do
        get(:show, id: 'not-existing-id')
      end
      it 'redirects to index action' do
           expect(response).to redirect_to(topics_path)
       end
      it 'returns correct http status' do
        expect(response).to have_http_status(:found)
      end
    end

    context 'when topic is not active' do
      before do
        get(:show, id: topic_inactive.id)
      end
      it 'redirects to index action' do
           expect(response).to redirect_to(topics_path)
       end
      it 'returns correct http status' do
        expect(response).to have_http_status(:found)
      end
    end

    context 'when topic is active' do
      before do
        FactoryGirl.create_list(:post, 10)
        FactoryGirl.create(:post, status: :inactive)
      end
      before do
        get(:show, id: topic.id)
      end
      it 'renders correct view' do
        expect(response).to render_template(:show)
      end
      it 'returns correct http status' do
        expect(response).to have_http_status(:ok)
      end
      it 'loads active posts' do
        posts = topic.posts.active.order('rank desc')
          .paginate(:page => 1, :per_page => 5)
        expect(assigns(:posts)).to eq(posts)

      end
    end
  end
end
