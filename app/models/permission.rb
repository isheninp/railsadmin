class Permission < ApplicationRecord
  has_and_belongs_to_many :roles

  rails_admin do
    classes=[]
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
            ['Access','access']
          ]
        end
      end
      field :subject_id
      field :subject_class, :enum do
        enum do
          classes
        end
      end      
    end
  end

end
