module Workspaces
  class WorkspacesController < ApplicationController
    before_action :set_workspace

    def set_workspace
      @workspace ||= Workspace.find_by_request(request)
    end
  end
end