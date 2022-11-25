module Workspaces
  class PagesController < WorkspacesController
    def show
      @workspace_users = @workspace.workspace_users.all.order(created_at: :desc)
    end

    def settings
    end

    def accept_invite
      workspace_user = @workspace.workspace_users.find_by(user: current_user)
      workspace_user.update(status: 'completed')

      redirect_to workspace_home_path
    end

    def decline_invite
      panel = Panel.find(params[:panel_id])
      member = panel.members.find_by(user: current_user)
      member.destroy

      redirect_to dashboard_path
    end
  end
end