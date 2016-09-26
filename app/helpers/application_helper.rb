module ApplicationHelper
  def not_registration_page?
    !current_page?(new_person_registration_path)
  end
end
