module Workspaces
  class WorkspacesBaseController < ApplicationController
    before_action :set_workspace

    def set_workspace
      @store ||= Workspace.find_by_request(request)
    end
  end
end