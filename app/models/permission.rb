class Permission < ApplicationRecord
  has_and_belongs_to_many :roles

  rails_admin do
    classes=["ALL", "Rails_admin", "Dashboard"]
    ActiveRecord::Base.descendants.each do |c|
      classes << c.name
    end
    create do 
      field :title
      field :action, :enum do
        enum do
          [
            ['Read','read'],
            ['Create','create'],
            ['Update','update'],
            ['Destroy','destroy'],
            ['Access','access'],
            ['Manage','manage']
          ]
        end
      end
      field :subject_id
      field :subject_class, :enum do
        enum do
          classes.uniq
        end
      end      
    end
    edit do 
      field :title
      field :action, :enum do
        enum do
          [
            ['Read','read'],
            ['Create','create'],
            ['Update','update'],
            ['Destroy','destroy'],
            ['Access','access'],
            ['Manage','manage']
          ]
        end
      end
      field :subject_id
      field :subject_class, :enum do
        enum do
          classes.uniq
        end
      end      
    end
  end

end
