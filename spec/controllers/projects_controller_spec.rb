require "rails_helper"

RSpec.describe ProjectsController, type: :request do
  describe "GET /projects" do
     let!(:projects) { create_list(:project, 2) }

     it "contains the product names" do
        get "/projects"
        parsed_response = JSON.parse(response.body)

        expect(parsed_response).to eq(projects.as_json)
     end
  end

  describe "GET /projects/:id" do
    let(:project) { create(:project, name: "foo_project") }

    it "return the task" do
       get "/projects/#{project.id}"
       parsed_response = JSON.parse(response.body)

       expect(parsed_response).to eq(project.as_json)
    end
 end

  describe "POST /projects" do
    let(:params) { { name: "foo_project", status: "done" } }
    let(:request) { post "/projects", params: { project: params } }

    it "create the task" do
      expect { request }.to change(Project, :count).by(+1)
    end
  end

  describe "PUT /projects/:id" do
    let(:project) { create(:project, name: "foo_project") }
    let(:request) { put "/projects/#{project.id}", params: { project: { name: "xpto" } } }

    it "create the task" do
      expect { request }.to change { project.reload.name }.to "xpto"
    end
  end

  describe "DELETE /projects/:id" do
    let!(:project) { create(:project, name: "foo_project") }
    let(:request) { delete "/projects/#{project.id}" }

    it "create the task" do
      expect { request }.to change(Project, :count).from(1).to(0)
    end
  end
end
