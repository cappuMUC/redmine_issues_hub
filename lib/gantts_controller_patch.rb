module GanttsControllerPatch
  GanttsController.class_eval do 
    def current_menu_item
      :issues
    end
  end
end
