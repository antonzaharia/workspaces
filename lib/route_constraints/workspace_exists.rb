module RouteConstraints
  class WorkSpaceExists
    def self.matches?(request)
      Workspace.find_by_request(request).nil?
    end
  end
end