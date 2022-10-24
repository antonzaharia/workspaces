class WorkspacesController < ApplicationController
  def new
    @workspace = Workspace.new
  end
end