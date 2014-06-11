class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    # Any user can either read or create
    can :read, :all
    can :create, [Annotation, Suggestion, Recipe]

    #only an author can delete their recipe, annotation, or suggestion
    can [:destroy, :update], [ Recipe, Annotation, Suggestion] do |model|
      model.try(:author) == user
    end
    
    # Only an author can edit the components of a recipe.
    can [:destroy, :update], [Ingredient, Step, Note] do |model|
      model.try(:recipe).try(:author) == user
    end
  end
end
