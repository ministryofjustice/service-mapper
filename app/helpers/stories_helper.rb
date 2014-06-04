module StoriesHelper
  def current_filter
    @current_filter ||= {}
    [:story_ids, :service_id, :system_id].each do |var|
      if params[var].present?
        @current_filter[var] = params[var]
      end
    end
    @current_filter
  end
end
