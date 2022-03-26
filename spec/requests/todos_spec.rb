require 'rails_helper'

RSpec.describe 'Todos API' do
  let!(:project) { create(:project) }
  let!(:todos) { create_list(:todo, 20, project_id: project.id) }
  let(:project_id) { project.id }
  let(:id) { todos.first.id }

  describe 'POST /todos' do
    let(:valid_attrs) { { text: 'Valid', isCompleted: false, project_id: project_id  } }

    context 'valid request attrs' do
      before { post '/todos', params: valid_attrs }

      it 'creates a todo' do
        expect(json['text']).to eq('Valid')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'invalid attrs' do
      before { post '/todos', params: { project_id: project_id, isCompleted: false } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Text can't be blank/)
      end
    end
  end

  describe 'PATCH /projects/:project_id/todos/:id' do
    let(:valid_attrs) { { text: 'Valid' } }

    before { patch "/projects/#{project_id}/todos/#{id}", params: valid_attrs }

    context 'when todo exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the todo' do
        updated_todo = Todo.find(id)
        expect(updated_todo.text).to match(/Valid/)
      end
    end

    context 'when item does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end
end