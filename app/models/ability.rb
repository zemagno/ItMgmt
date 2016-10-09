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
    can [:show, :index] , "tasks"
    can [:index], "relatorio" # autorizo o token especificamente. Nao existe model associado.
    # can [:index,:show], Ci

    cannot :manage, Funcionario

    cannot :manage, CanHelperFinanceiro
    cannot :manage, CanHelperFinanceiroTi

    cannot :manage, Scheduler
    cannot :manage, User
    cannot :manage, Audit
    cannot :manage, Grupo
    cannot :manage, Parametro
    cannot :manage, SqlTemplate
    cannot :manage, TemplatesEmail 
    cannot :manage, Tipoci
    cannot :manage, Dicdado

    # ATENCAO ---> SEMPRE DESAUTORIZAR NO SUPORTE !!!! OU inverter condicao


    if user and user.is_a :suporte
      # can :manage, :all   # AROLDO 
      cannot :manage, Dicdado
      cannot :manage, @Dicdado
      cannot :manage, Cadrelatorio
      cannot :manage, @Cadrelatorio
      can    :index, Cadrelatorio
      can    :index, @Cadrelatorio
      cannot :manage, Tipoci
      cannot :manage, @Tipoci
      cannot :manage, Statusci
      cannot :manage, @Statusci
      cannot :manage, SqlTemplate
      cannot :manage, @SqlTemplate
      cannot :manage, Mailing
      cannot :manage, Scheduler
      cannot :manage, Software
      cannot :manage, CanHelperFinanceiro
      cannot :manage, CanHelperFinanceiroTi
      cannot :manage, CanHelperLicenciamento
      cannot :manage, Parametro
      can    :index,  Parametro   
      cannot :manage, Site
      can    :index,  Site   
      can    :index,  Tipoci
      can    :index, Dicdado
      can    :show,  Dicdado
      can    :index, Software
      cannot :manage, User
      can    :index, User
      can    :index, Grupo
      can    :index, Statusci
      can    :manage, :usuarios
      can    :manage, Task
      can    :manage, Note
      can    :manage, "tasks"
      can    :manage, Funcionario
      
    end

    if user and user.is_a :producao
      can :manage, Scheduler
      can :manage, SqlTemplate
      can :manage, TemplatesEmail
    end

    if user and user.is_a :financeiro
      can :manage, CanHelperFinanceiro
    end

    if user and user.is_a :licenciamento
      can :manage, CanHelperLicenciamento
    end

    if user and user.is_a :financeiroTI
      can :manage, CanHelperFinanceiro
      can :manage, CanHelperFinanceiroTi
    end
    if user and user.is_a :grupoAdmin
      can :manage, Grupo
    end

    if user and user.is_a :compras
      can :manage, Ci
      can :index, Cadrelatorio
    end

    if user and user.is_a :admin
      can :manage, :all
      can :admin, :all
    end

    if user and user.is_a :mailing
      can :manage, Mailing
    end

    if user and user.is_a :audit
      #can :manage, @Audit
      can :manage, Audit
    end


    # cannot :manage, CanHelperLicenciamento
    #can :manage, :all

    # cannot :manage, Grupo

  end
end
