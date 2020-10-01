class CreatePlanning
  include Interactor

  def call
    Planning.create!(name: context.name, status: Planning.statuses[:active])
  rescue ActiveRecord::RecordInvalid => e
    context.error = "Error: #{e.record.errors.full_messages.join('. ')}."
    context.fail!
  end
end
