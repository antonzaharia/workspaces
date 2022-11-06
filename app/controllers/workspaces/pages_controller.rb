module Workspaces
  class PagesController < WorkspacesController
    def show
      @workspace_users = @workspace.workspace_users.all
    end
  end
end