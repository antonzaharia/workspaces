module RouteConstraints
  class WorkspaceExists
    def self.matches?(request)
      Workspace.find_by_request(request).present?
    end
  end
end