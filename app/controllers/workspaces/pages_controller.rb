module Workspaces
  class PagesController < WorkspacesController
    def show
      @workspace_users = @workspace.workspace_users.all.order(created_at: :desc)
    end


    def accept_invite
      workspace_user = @workspace.workspace_users.find_by(user: current_user)
      workspace_user.update(status: 'completed')

      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update('workspace_pages_show', template: 'workspaces/pages/show')
          ]
        end
      end
    end

    def decline_invite
      panel = Panel.find(params[:panel_id])
      member = panel.members.find_by(user: current_user)
      member.destroy

      redirect_to dashboard_path
    end
  end
end