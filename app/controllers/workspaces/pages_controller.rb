module Workspaces
  class PagesController < WorkspacesController
    def show
      @workspace_users = @workspace.workspace_users.all.order(created_at: :desc)
    end
  end
end