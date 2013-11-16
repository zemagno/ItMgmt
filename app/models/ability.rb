class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
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



    # admin - criar relato
    # financeiro - cobranca, alterar valor
    # suporte - criar qq coisa
    # usuario - ver alerta, relatorios [ talvez CMDB]
    #
    #
    if user
      if user.is_a :admin
          puts "======> can manage all"
        can :manage, :all
      elsif user.is_a :suporte
        puts "======> can manage alertas"
        can :manage, :all
        cannot :manage, Dicdado
        cannot :manage, @Dicdado
        cannot :manage, Cadrelatorio
        cannot :manage, @Cadrelatorio   
        can :index, Cadrelatorio
        can :index, @Cadrelatorio
        cannot :manage, Tipoci
        cannot :manage, @Tipoci
        cannot :manage, Statusci
        cannot :manage, @Statusci
      else
        puts "======> can read all"
        can [:show, :index] , "tasks"
        can [:index], "relatorio"
        can [:index,:show], "cis"
        can [:index,:show], "ci"
        
      end
    else 
      puts "======> can read all - publico"
      can [:show, :index] , "tasks"
      can [:index], "relatorio"
      can [:index,:show], "cis"
      can [:index,:show], "ci"
      
    end
    
    can :manage, :all
    
  end
end
