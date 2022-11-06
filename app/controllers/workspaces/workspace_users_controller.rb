module Workspaces
  class WorkspaceUsersController < WorkspacesController
    before_action :set_workspace_user, only: [:show,:edit,:update,:destroy]

    # GET /workspace_users or /workspace_users.json
    def index
      @workspace_users = WorkspaceUser.all
    end

    # GET /workspace_users/1 or /workspace_users/1.json
    def show
    end

    # GET /workspace_users/new
    def new
      @workspace_user = WorkspaceUser.new
    end

    # GET /workspace_users/1/edit
    def edit
    end

    # GET /workspace_users/1/delete
    def delete
      @workspace_user = WorkspaceUser.find(params[:workspace_user_id])
    end

    # POST /workspace_users or /workspace_users.json
    def create
      user = User.find_by(email: workspace_user_params[:email])
      @workspace_user = @workspace.workspace_users.new(email: workspace_user_params[:email])
      if user
        @workspace_user = user
        @workspace_user.has_account = true
      end

      respond_to do |format|
        if @workspace_user.save
          format.turbo_stream do
            render turbo_stream: [
              turbo_stream.update('new_workspace_user', partial: 'workspaces/workspace_users/form', locals: { workspace_user: WorkspaceUser.new }),
              turbo_stream.prepend('workspace_user_index', partial: 'workspaces/workspace_users/workspace_user', locals: { workspace_user: @workspace_user })
            ]
          end
          format.html { redirect_to workspace_user_url(@workspace_user), notice: 'Workspace user was successfully created.' }
          format.json { render :show, status: :created, location: @workspace_user }
        else
          format.turbo_stream do
            render turbo_stream: [
              turbo_stream.update('new_workspace_user', partial: 'workspaces/workspace_users/form', locals: { workspace_user: @workspace_user } ),
            ]
          end
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @workspace_user.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /workspace_users/1 or /workspace_users/1.json
    def update
      respond_to do |format|
        if @workspace_user.update(workspace_user_params)
          format.html { redirect_to workspace_user_url(@workspace_user), notice: 'Workspace user was successfully updated.' }
          format.json { render :show, status: :ok, location: @workspace_user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @workspace_user.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /workspace_users/1 or /workspace_users/1.json
    def destroy
      @workspace_user.destroy

      respond_to do |format|
        format.html { redirect_to workspace_users_url, notice: 'Workspace user was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_workspace_user
        @workspace_user = WorkspaceUser.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def workspace_user_params
        params.require(:workspace_user).permit(:email)
      end
  end
end