module CurrentChange
	extend ActiveSupport::Concern

	private

		def set_working_change
			@working_change = WorkingChange.find(session[:change_id])
		rescue ActiveRecord::RecordNotFound
			@working_change = WorkingChange.create
			session[:change_id] = @working_change.id
		end
end