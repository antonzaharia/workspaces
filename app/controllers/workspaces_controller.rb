class WorkspacesController < ApplicationController
  before_action :set_workspace, only: [:show,:edit,:update,:destroy]

  def signout
    sign_out(current_user)

    redirect_to root_url(subdomain: false), allow_other_host: true
  end

  # GET /workspaces or /workspaces.json
  def index
    @workspaces = Workspace.all
  end

  # GET /workspaces/1 or /workspaces/1.json
  def show
  end

  # GET /workspaces/new
  def new
    @workspace = Workspace.new
  end

  # GET /workspaces/1/edit
  def edit
  end

  def delete
    @workspace = Workspace.find(params[:workspace_id])
  end

  # POST /workspaces or /workspaces.json
  def create
    @workspace = current_user.my_workspaces.new(workspace_params)

    respond_to do |format|
      if @workspace.save
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update('new_workspace', partial: 'workspaces/form', locals: { workspace: Workspace.new }),
            turbo_stream.prepend('workspace_index', partial: 'workspaces/workspace', locals: { workspace: @workspace })
          ]
        end
        format.html { redirect_to dashboard_path, allow_other_host: true, notice: 'Workspace was successfully created.' }
        format.json { render :show, status: :created, location: @workspace }
      else
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update('new_workspace', partial: 'workspaces/form', locals: { workspace: @workspace } ),
          ]
        end
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @workspace.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workspaces/1 or /workspaces/1.json
  def update
    respond_to do |format|
      if @workspace.update(workspace_params)
        format.html { redirect_to workspace_url(@workspace), notice: 'Workspace was successfully updated.' }
        format.json { render :show, status: :ok, location: @workspace }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @workspace.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workspaces/1 or /workspaces/1.json
  def destroy
    @workspace.workspace_users.delete_all
    @workspace.destroy

    redirect_to workspace_home_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workspace
      @workspace = Workspace.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def workspace_params
      params.require(:workspace).permit(:name, :slug)
    end
end
