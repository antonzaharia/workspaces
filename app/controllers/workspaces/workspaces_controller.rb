module Workspaces
  class WorkspacesController < ApplicationController
    before_action :set_workspace

    def delete
      @workspace = Workspace.find(params[:workspace_id])

      render 'workspaces/delete'
    end

    def destroy
      @workspace.workspace_users.map(&:destroy)
      @workspace.destroy

      redirect_to workspace_home_path
    end

    private

    def set_workspace
      @workspace ||= Workspace.find_by_request(request)
    end
  end
end