module HomeHelper
  def menu_item_class(action)
    params[:action] == action ? 'nav-item active' : 'nav-item'
  end
end
