module BlogsHelper
  def choice_root
    if action_name == "new" || action_name == "create"
    elsif action_name == "edit"
      blog_path
    end
  end
end
