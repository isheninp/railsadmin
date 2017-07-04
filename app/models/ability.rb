class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)

#can :read, :all

    @roles = Role.includes(:users).where(users: {id: user.id})

   
    if @roles.any? { |r| r[:title] == 'Суперадмин' }
      can :manage, :all
      can :access, :rails_admin   # grant access to rails_admin
      can :dashboard              # grant access to the dashboard
            
      can :manage, User
      #can :read, :all                   # allow everyone to read everything
      can :read, Role
    else
      #can :access, :rails_admin   # grant access to rails_admin
      #can :read, Role
      #can :dashboard              # grant access to the dashboard
      
      #can :manage, :all             # allow superadmins to do anything
      
      #can :manage, [User, Role]  # allow managers to do anything to products and users
      #can :update, Role, :hidden => false  # allow sales to only update visible products
      
    end      
      
      p '---roles - ----------------'
      #Employer.joins({:people => {:household => {:suburb => :city}}})
      #p Permission.joins({:roles => :users})
      p = Permission.joins(roles: :users).where(users: {id: user.id})
      #p Permission.joins({:roles => {:users => {id: user.id}}})
      #p Permission.includes(:roles).includes(:users).where(users: {id: user.id})
      #p Role.includes(:users).where(users: {id: user.id}).includes(:permissions)
      

      
      can do |action, subject_class, subject|
        p.each do |permission|
          permission.subject_class == subject_class.to_s 
          &&  (subject.nil? || permission.subject_id.nil? || permission.subject_id == subject.id)
        end 
      end      

p '-------------------------'

can :manage, :all             # allow superadmins to do anything
      

    
    
# Always performed
#can :access, :rails_admin # needed to access RailsAdmin

# Performed checks for `root` level actions:
#can :dashboard            # dashboard access

# Performed checks for `collection` scoped actions:
#can :index, Model         # included in :read
#can :new, Model           # included in :create
#can :export, Model
#can :history, Model       # for HistoryIndex
#can :destroy, Model       # for BulkDelete

# Performed checks for `member` scoped actions:
#can :show, Model, object            # included in :read
#can :edit, Model, object            # included in :update
#can :destroy, Model, object         # for Delete
#can :history, Model, object         # for HistoryShow
#can :show_in_app, Model, object


   
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
    
    #can do |action, subject_class, subject|
    #  user.permissions.find_all_by_action(aliases_for_action(action)).any? do |permission|
    #    permission.subject_class == subject_class.to_s &&
    #      (subject.nil? || permission.subject_id.nil? || permission.subject_id == subject.id)
    #  end
    #end    
    
  end
end
