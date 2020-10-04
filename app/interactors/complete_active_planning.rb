class CompleteActivePlanning
  include Interactor

  def call
    Planning.active.each do |planning|
      planning.completed!
    end
  end
end
