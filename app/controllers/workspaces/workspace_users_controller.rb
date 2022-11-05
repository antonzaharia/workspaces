module Workspaces
  class WorkspaceUsersController < WorkspacesController
    before_action :set_workspace_user, only: %i[ show edit update destroy ]

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

    # POST /workspace_users or /workspace_users.json
    def create
      @workspace_user = WorkspaceUser.new(workspace_user_params)

      respond_to do |format|
        if @workspace_user.save
          format.html { redirect_to workspace_user_url(@workspace_user), notice: "Workspace user was successfully created." }
          format.json { render :show, status: :created, location: @workspace_user }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @workspace_user.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /workspace_users/1 or /workspace_users/1.json
    def update
      respond_to do |format|
        if @workspace_user.update(workspace_user_params)
          format.html { redirect_to workspace_user_url(@workspace_user), notice: "Workspace user was successfully updated." }
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
        format.html { redirect_to workspace_users_url, notice: "Workspace user was successfully destroyed." }
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
        params.require(:workspace_user).permit(:user_id, :workspace_id)
      end
  end
end