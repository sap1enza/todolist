require "rails_helper"

RSpec.describe TasksController, type: :request do
  describe "GET /tasks" do
     let!(:tasks) { create_list(:task, 2) }

     it "contains the product names" do
        get "/tasks"
        parsed_response = JSON.parse(response.body)

        expect(parsed_response).to eq(tasks.as_json)
     end
  end

  describe "GET /tasks/:id" do
    let(:task) { create(:task, name: "foo_task") }

    it "return the task" do
       get "/tasks/#{task.id}"

       parsed_response = JSON.parse(response.body)

       expect(parsed_response).to eq(task.as_json)
    end
 end

  describe "POST /tasks" do
    let(:params) { { name: "foo_task", status: "done" } }
    let(:request) { post "/tasks", params: { task: params } }

    it "create the task" do
      expect { request }.to change(Task, :count).by(+1)
    end
  end

  describe "PUT /tasks/:id" do
    let(:task) { create(:task, name: "foo_task") }
    let(:request) { put "/tasks/#{task.id}", params: { task: { name: "xpto" } } }

    it "create the task" do
      expect { request }.to change { task.reload.name }.to "xpto"
    end
  end

  describe "DELETE /tasks/:id" do
    let!(:task) { create(:task, name: "foo_task") }
    let(:request) { delete "/tasks/#{task.id}" }

    it "create the task" do
      expect { request }.to change(Task, :count).from(1).to(0)
    end
  end
end
