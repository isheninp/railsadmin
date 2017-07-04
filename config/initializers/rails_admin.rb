RailsAdmin.config do |config|

  config.parent_controller = 'ApplicationController'
  
  config.main_app_name = ["Компания", "Мое приложение"]
  
  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.model 'Role' do
    list do
      field :title
      field :description
      field :users
    end
  end

  config.model 'User' do
    navigation_label 'CRM'
    weight 9
    list do
      field :full_name
      field :email
      field :roles
    end
    edit do
      group :SSDD do
        label "О пользователе"
        help "Заполните тут поля..."
      end
    end    
  end
  
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
    
 
  end
  
  config.navigation_static_label = "Полезные ссылки"
  
  config.navigation_static_links = {
    'Внутрений портал' => 'http://#'
  }  
  
end
